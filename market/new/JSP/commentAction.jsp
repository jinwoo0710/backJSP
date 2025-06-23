<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="commentTable.CommentDAO, commentTable.CommentDTO" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // AJAX 요청인지 확인
    boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    
    // 디버깅: 모든 파라미터 확인
    String action = request.getParameter("action");
    String postIdStr = request.getParameter("postId");
    String postType = request.getParameter("postType");
    String content = request.getParameter("content");
    String parentCommentIdStr = request.getParameter("parentCommentId");
    String commentIdStr = request.getParameter("commentId");
    
    // 기본값 설정
    if (postType == null || postType.trim().isEmpty()) {
        postType = "community";
    }
    
    // 세션에서 사용자 정보 가져오기 (모든 가능한 키 확인)
    String userId = (String) session.getAttribute("userid");
    String username = (String) session.getAttribute("username");
    
    // 다른 세션 키들도 확인
    if (userId == null || userId.trim().isEmpty()) {
        userId = (String) session.getAttribute("userID");
    }
    if (username == null || username.trim().isEmpty()) {
        username = (String) session.getAttribute("userName");
    }
    
    // 최종적으로 로그인 정보가 없는지 확인
    boolean isLoggedIn = (userId != null && !userId.trim().isEmpty());
    
    if (!isLoggedIn) {
        // AJAX 요청이면 에러 응답
        if (isAjaxRequest) {
            response.setContentType("application/json; charset=UTF-8");
            out.print("{\"success\": false, \"message\": \"로그인이 필요합니다.\"}");
            return;
        }
        // 일반 요청이면 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
        return;
    }
    
    // userId가 50자를 초과하면 잘라내기 (DB 오류 방지)
    if (userId.length() > 50) {
        userId = userId.substring(0, 50);
    }
    
    // username이 null이면 userId로 대체 (username은 NOT NULL)
    if (username == null || username.trim().isEmpty()) {
        username = userId;
    }
    
    // 세션 정보 디버깅
    System.out.println("=== 댓글 액션 디버깅 ===");
    System.out.println("action: " + action);
    System.out.println("postId: " + postIdStr);
    System.out.println("postType: " + postType);
    System.out.println("content: " + content);
    System.out.println("userId: " + userId);
    System.out.println("username: " + username);
    System.out.println("세션 모든 속성:");
    java.util.Enumeration<String> sessionAttrs = session.getAttributeNames();
    while (sessionAttrs.hasMoreElements()) {
        String attrName = sessionAttrs.nextElement();
        System.out.println("  " + attrName + " = " + session.getAttribute(attrName));
    }
    
    boolean success = false;
    String message = "";
    String debugInfo = "액션: " + action + ", 게시글ID: " + postIdStr + ", 사용자: " + userId + "(" + username + ")";
    
    try {
        CommentDAO dao = new CommentDAO();
        
        if ("add".equals(action)) {
            // 댓글 작성
            if (postIdStr != null && content != null && !content.trim().isEmpty()) {
                int postId = Integer.parseInt(postIdStr);
                
                CommentDTO comment = new CommentDTO();
                comment.setPostId(postId);
                comment.setPostType(postType);
                comment.setUserId(userId);
                comment.setUsername(username);
                comment.setContent(content.trim());
                
                // 답글인 경우 부모 댓글 ID 설정
                if (parentCommentIdStr != null && !parentCommentIdStr.trim().isEmpty()) {
                    try {
                        int parentCommentId = Integer.parseInt(parentCommentIdStr);
                        comment.setParentCommentId(parentCommentId);
                        System.out.println("답글 작성: 부모 댓글 ID = " + parentCommentId);
                    } catch (NumberFormatException e) {
                        System.out.println("부모 댓글 ID 파싱 오류: " + parentCommentIdStr);
                    }
                }
                
                System.out.println("댓글 작성 시도: " + comment.toString());
                success = dao.insertComment(comment);
                
                if (success) {
                    message = "댓글이 성공적으로 작성되었습니다.";
                    System.out.println("댓글 작성 성공!");
                } else {
                    message = "댓글 작성에 실패했습니다. DB 연결 또는 SQL 오류 확인 필요.";
                    System.out.println("댓글 작성 실패!");
                }
            } else {
                message = "필수 입력 항목이 누락되었습니다. " + debugInfo;
                System.out.println("필수 항목 누락: postId=" + postIdStr + ", content=" + content);
            }
            
        } else if ("update".equals(action)) {
            // 댓글 수정
            if (commentIdStr != null && content != null && !content.trim().isEmpty()) {
                int commentId = Integer.parseInt(commentIdStr);
                success = dao.updateComment(commentId, content.trim());
                message = success ? "댓글이 성공적으로 수정되었습니다." : "댓글 수정에 실패했습니다.";
            } else {
                message = "필수 입력 항목이 누락되었습니다.";
            }
            
        } else if ("delete".equals(action)) {
            // 댓글 삭제
            if (commentIdStr != null) {
                int commentId = Integer.parseInt(commentIdStr);
                success = dao.deleteComment(commentId);
                message = success ? "댓글이 성공적으로 삭제되었습니다." : "댓글 삭제에 실패했습니다.";
            } else {
                message = "댓글 ID가 누락되었습니다.";
            }
            
        } else if ("like".equals(action)) {
            // 댓글 좋아요 토글
            if (commentIdStr != null) {
                int commentId = Integer.parseInt(commentIdStr);
                success = dao.toggleCommentLike(commentId, userId);
                message = success ? "좋아요가 처리되었습니다." : "좋아요 처리에 실패했습니다.";
            } else {
                message = "댓글 ID가 누락되었습니다.";
            }
            
        } else {
            message = "지원하지 않는 액션입니다. 받은 액션: '" + action + "' " + debugInfo;
        }
        
    } catch (NumberFormatException e) {
        message = "잘못된 숫자 형식입니다: " + e.getMessage();
        System.out.println("숫자 형식 오류: " + e.getMessage());
    } catch (Exception e) {
        e.printStackTrace();
        message = "처리 중 오류가 발생했습니다: " + e.getMessage();
        System.out.println("예외 발생: " + e.getMessage());
    }
    
    System.out.println("최종 결과: success=" + success + ", message=" + message);
    
    // AJAX 요청인 경우 JSON 응답
    if (isAjaxRequest) {
        response.setContentType("application/json; charset=UTF-8");
        out.print("{\"success\": " + success + ", \"message\": \"" + message.replace("\"", "\\\"") + "\"}");
        return;
    }
    
    // 리다이렉트 URL 설정
    String redirectUrl = request.getParameter("redirectUrl");
    if (redirectUrl == null || redirectUrl.trim().isEmpty()) {
        if (postIdStr != null) {
            redirectUrl = "commupost.jsp?id=" + postIdStr;
        } else {
            redirectUrl = "community.jsp";
        }
    }
    
    // 성공한 경우 바로 리다이렉트
    if (success) {
        response.sendRedirect(redirectUrl);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 처리 오류</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 0;
            padding: 20px;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .error-header {
            text-align: center;
            color: #dc3545;
            margin-bottom: 20px;
        }
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #f5c6cb;
        }
        .btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            margin: 10px 5px 0 0;
            transition: background-color 0.2s;
        }
        .btn:hover {
            background: #0056b3;
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #545b62;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-header">
            <h1>❌ 댓글 처리 실패</h1>
        </div>
        
        <div class="error-message">
            <p><strong>오류 내용:</strong> <%= message %></p>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="<%= redirectUrl %>" class="btn">게시글로 돌아가기</a>
            <a href="community_working.jsp" class="btn btn-secondary">커뮤니티 목록</a>
        </div>
    </div>
</body>
</html> 