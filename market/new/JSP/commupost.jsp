<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="commupostTable.CommuPostDAO, commupostTable.CommuPostDTO" %>
<%@ page import="commentTable.CommentDAO, commentTable.CommentDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 게시글 상세</title>
    <style>
        /* 전체 스타일 리셋 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* 커뮤니티 상세 페이지 */
        .post-detail-container {
            padding: 24px 0;
        }

        .back-button {
            margin-bottom: 20px;
            background: none;
            border: none;
            color: #3b82f6;
            cursor: pointer;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .post-detail {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        /* 게시글 헤더 */
        .post-detail-header {
            padding: 24px;
            border-bottom: 1px solid #e5e7eb;
        }

        .post-category {
            display: inline-block;
            background-color: #e3f2fd;
            color: #1976d2;
            padding: 4px 12px;
            border-radius: 16px;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 12px;
        }

        .post-detail-title {
            font-size: 24px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 16px;
            line-height: 1.4;
        }

        .post-detail-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #6b7280;
            font-size: 14px;
        }

        .post-author-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .author-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: #6b7280;
        }

        .author-details {
            display: flex;
            flex-direction: column;
        }

        .author-name {
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 2px;
        }

        .author-level {
            font-size: 12px;
            color: #6b7280;
        }

        .post-stats {
            display: flex;
            gap: 16px;
            font-size: 14px;
            color: #6b7280;
        }

        .post-stat {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        /* 게시글 내용 */
        .post-detail-content {
            padding: 24px;
            border-bottom: 1px solid #e5e7eb;
        }

        .post-content {
            line-height: 1.8;
            color: #374151;
            font-size: 16px;
        }

        .post-content p {
            margin-bottom: 16px;
        }

        .post-content ul {
            margin-left: 20px;
            margin-bottom: 16px;
        }

        .post-content li {
            margin-bottom: 8px;
        }

        /* 게시글 액션 */
        .post-actions {
            padding: 20px 24px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .action-buttons {
            display: flex;
            gap: 12px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            background: white;
            color: #6b7280;
            cursor: pointer;
            transition: all 0.2s;
            font-size: 14px;
        }

        .action-btn:hover {
            background-color: #f9fafb;
        }

        .action-btn.liked {
            color: #ef4444;
            border-color: #ef4444;
            background-color: #fef2f2;
        }

        .share-report {
            display: flex;
            gap: 8px;
        }

        .share-btn, .report-btn {
            background: none;
            border: none;
            color: #6b7280;
            cursor: pointer;
            padding: 8px;
            border-radius: 6px;
            transition: background-color 0.2s;
        }

        .share-btn:hover, .report-btn:hover {
            background-color: #f3f4f6;
        }

        /* 댓글 섹션 */
        .comments-section {
            padding: 24px;
        }

        .comments-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .comments-title {
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
        }

        .comments-count {
            color: #3b82f6;
            margin-left: 8px;
        }

        /* 댓글 작성 */
        .comment-form {
            margin-bottom: 24px;
            padding: 16px;
            background-color: #f9fafb;
            border-radius: 8px;
        }

        .comment-input {
            width: 100%;
            min-height: 80px;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            resize: vertical;
            font-family: inherit;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .comment-input:focus {
            outline: none;
            border-color: #3b82f6;
        }

        .comment-form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
        }

        .btn-cancel {
            padding: 8px 16px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: white;
            color: #6b7280;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-submit {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            background: #3b82f6;
            color: white;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-submit:hover {
            background: #2563eb;
        }

        /* 댓글 목록 */
        .comments-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .comment-item {
            padding: 16px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            background: white;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .comment-author {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .comment-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #6b7280;
        }

        .comment-author-name {
            font-weight: 500;
            color: #1f2937;
            font-size: 14px;
        }

        .comment-time {
            font-size: 12px;
            color: #9ca3af;
        }

        .comment-content {
            margin-bottom: 12px;
            color: #374151;
            font-size: 14px;
            line-height: 1.6;
        }

        .comment-actions {
            display: flex;
            gap: 12px;
        }

        .comment-action {
            background: none;
            border: none;
            color: #6b7280;
            cursor: pointer;
            font-size: 12px;
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 4px 8px;
            border-radius: 4px;
            transition: background-color 0.2s;
        }

        .comment-action:hover {
            background-color: #f3f4f6;
        }

        .comment-action.liked {
            color: #ef4444;
        }

        /* 답글 */
        .reply-item {
            margin-left: 40px;
            margin-top: 12px;
            padding: 12px;
            background-color: #f9fafb;
            border-radius: 6px;
            border-left: 3px solid #3b82f6;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .post-detail-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .post-detail-title {
                font-size: 20px;
            }

            .action-buttons {
                flex-wrap: wrap;
            }

            .reply-item {
                margin-left: 20px;
            }
        }
    </style>
</head>
<body>
	<%
		String postid = request.getParameter("id");
		if (postid == null) {
		    response.sendRedirect("community.jsp");
		    return;
		}
		
		CommuPostDAO dao = new CommuPostDAO();
		CommuPostDTO dto = dao.get(Integer.parseInt(postid));
		if (dto == null) {
		    response.sendRedirect("community.jsp");
		    return;
		}
		
		// 조회수 증가
		dao.increaseViews(Integer.parseInt(postid));
		
		// 댓글 관련 데이터 로드
		CommentDAO commentDao = new CommentDAO();
		List<CommentDTO> comments = commentDao.getCommentsByPostId(Integer.parseInt(postid), "community");
		int commentCount = commentDao.getCommentCount(Integer.parseInt(postid), "community");
		
		// 현재 사용자 정보 (모든 가능한 세션 키 확인)
		String currentUser = (String) session.getAttribute("userid");
		String currentUsername = (String) session.getAttribute("username");
		
		if (currentUser == null) {
		    currentUser = (String) session.getAttribute("userID");
		}
		if (currentUsername == null) {
		    currentUsername = (String) session.getAttribute("username");
		}
		if (currentUsername == null) {
		    currentUsername = (String) session.getAttribute("userName");
		}
		
		boolean isLoggedIn = (currentUser != null && !currentUser.trim().isEmpty());
		
		// 디버깅 정보
		System.out.println("=== commupost.jsp 디버깅 ===");
		System.out.println("postid: " + postid);
		System.out.println("currentUser: " + currentUser);
		System.out.println("currentUsername: " + currentUsername);
		System.out.println("isLoggedIn: " + isLoggedIn);
		System.out.println("commentCount: " + commentCount);
		System.out.println("comments size: " + (comments != null ? comments.size() : "null"));
	%>
    <div class="container">
        <div class="post-detail-container">
            <!-- 뒤로가기 버튼 -->
            <button class="back-button" onclick="goBack()">
                <span>←</span>
                커뮤니티로 돌아가기
            </button>
            
            <div class="post-detail">
                <!-- 게시글 헤더 -->
                <div class="post-detail-header">
                    <span class="post-category"><%= dto.getCategory() != null ? dto.getCategory() : "일반" %></span>
                    <h1 class="post-detail-title"><%= dto.getTitle() %></h1>
                    <div class="post-detail-meta">
                        <div class="post-author-info">
                            <div class="author-avatar"><%= dto.getUsername().substring(0, 1) %></div>
                            <div class="author-details">
                                <span class="author-name"><%= dto.getUsername() %></span>
                                <span class="author-level">활동 회원 · 가입 1년</span>
                            </div>
                        </div>
                        <div class="post-stats">
                            <div class="post-stat">
                                <span>🕒</span>
                                <span><%= dto.getCreatetime() %></span>
                            </div>
                            <div class="post-stat">
                                <span>👁️</span>
                                <span><%= dto.getViewcnt() %></span>
                            </div>
                            <div class="post-stat">
                                <span>❤️</span>
                                <span>24</span>
                            </div>
                            <div class="post-stat">
                                <span>💬</span>
                                <span><%= commentCount %></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 게시글 내용 -->
                <div class="post-detail-content">
                    <div class="post-content">
                        <%= dto.getContent().replaceAll("\n", "<br>") %>
                    </div>
                </div>
                
                <!-- 게시글 액션 -->
                <div class="post-actions">
                    <div class="action-buttons">
                        <button class="action-btn" onclick="toggleLike()">
                            <span>❤️</span>
                            <span>좋아요 24</span>
                        </button>
                        <button class="action-btn" onclick="toggleBookmark()">
                            <span>🔖</span>
                            <span>북마크</span>
                        </button>
                    </div>
                    <div class="share-report">
                        <button class="share-btn" onclick="sharePost()">🔗</button>
                        <button class="report-btn" onclick="reportPost()">🚨</button>
                    </div>
                </div>
                
                <!-- 댓글 섹션 -->
                <div class="comments-section">
                    <div class="comments-header">
                        <h3 class="comments-title">댓글 <span class="comments-count"><%= commentCount %></span></h3>
                    </div>
                    
                    <!-- 댓글 작성 -->
                    <% if (isLoggedIn) { %>
                    <div class="comment-form">
                        <form id="commentForm" action="commentAction.jsp" method="post">
                            <input type="hidden" name="postId" value="<%= postid %>">
                            <input type="hidden" name="postType" value="community">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="redirectUrl" value="commupost.jsp?id=<%= postid %>">
                            <textarea name="content" class="comment-input" placeholder="댓글을 작성해주세요..." id="commentInput" required></textarea>
                            <div class="comment-form-actions">
                                <button type="button" class="btn-cancel" onclick="cancelComment()">취소</button>
                                <button type="submit" class="btn-submit">댓글 작성</button>
                            </div>
                        </form>
                    </div>
                    <% } else { %>
                    <div class="comment-form">
                        <p style="text-align: center; color: #6b7280; padding: 20px;">
                            <a href="login.jsp" style="color: #3b82f6;">로그인</a>하시면 댓글을 작성할 수 있습니다.
                        </p>
                    </div>
                    <% } %>
                    
                    <!-- 댓글 목록 -->
                    <div class="comments-list">
                        <% if (comments != null && comments.size() > 0) { 
                            for (CommentDTO comment : comments) {
                                boolean isReply = comment.isReply();
                        %>
                        <div class="comment-item <%= isReply ? "reply-item" : "" %>">
                            <div class="comment-header">
                                <div class="comment-author">
                                    <div class="comment-avatar">
                                        <%= comment.getUsername() != null ? comment.getUsername().substring(0, 1) : "?" %>
                                    </div>
                                    <span class="comment-author-name"><%= comment.getUsername() %></span>
                                </div>
                                <span class="comment-time"><%= comment.getTimeAgo() %></span>
                            </div>
                            <div class="comment-content">
                                <%= comment.getContent() != null ? comment.getContent().replace("\n", "<br>") : "" %>
                            </div>
                            <div class="comment-actions">
                                <button class="comment-action" onclick="toggleCommentLike(<%= comment.getCommentId() %>)">
                                    <span>❤️</span>
                                    <span><%= comment.getLikeCount() %></span>
                                </button>
                                <% if (!isReply) { %>
                                <button class="comment-action" onclick="showReplyForm(<%= comment.getCommentId() %>)">
                                    <span>💬</span>
                                    <span>답글</span>
                                </button>
                                <% } %>
                            </div>
                        </div>
                        <% } 
                        } else { %>
                        <div style="text-align: center; color: #6b7280; padding: 40px;">
                            <h3>아직 댓글이 없습니다</h3>
                            <p>첫 번째 댓글을 작성해보세요!</p>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // JSP 변수 → JS 변수로 전달
        var isLoggedIn = <%= isLoggedIn %>;

        // 댓글 작성 폼 제출 처리
        if (isLoggedIn) {
            document.getElementById('commentForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const formData = new FormData(this);
                const content = formData.get('content');
                if (!content || content.trim() === '') {
                    alert('댓글 내용을 입력해주세요.');
                    return;
                }
                const submitBtn = this.querySelector('.btn-submit');
                submitBtn.disabled = true;
                submitBtn.textContent = '작성 중...';
                this.submit();
            });
        }

        // 댓글 작성 취소
        function cancelComment() {
            document.getElementById('commentInput').value = '';
        }

        // 댓글 좋아요 토글
        function toggleCommentLike(commentId) {
            if (isLoggedIn) {
                fetch('commentAction.jsp', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        'X-Requested-With': 'XMLHttpRequest'
                    },
                    body: 'action=like&commentId=' + commentId + '&postId=<%= postid %>&postType=community'
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        location.reload();
                    } else {
                        alert('오류: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('처리 중 오류가 발생했습니다.');
                });
            } else {
                alert('로그인이 필요합니다.');
            }
        }

        // 답글 작성 폼 표시
        function showReplyForm(parentCommentId) {
            if (isLoggedIn) {
                const existingForm = document.querySelector('.reply-form');
                if (existingForm) {
                    existingForm.remove();
                }
                const replyFormHtml = `
                    <div class="comment-form reply-form" style="margin-top: 12px;">
                        <form action="commentAction.jsp" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="postId" value="<%= postid %>">
                            <input type="hidden" name="postType" value="community">
                            <input type="hidden" name="parentCommentId" value="${parentCommentId}">
                            <input type="hidden" name="redirectUrl" value="commupost.jsp?id=<%= postid %>">
                            <textarea class="comment-input" name="content" placeholder="답글을 작성해주세요..." required style="min-height: 60px;"></textarea>
                            <div class="comment-form-actions">
                                <button type="button" class="btn-cancel" onclick="this.closest('.reply-form').remove()">취소</button>
                                <button type="submit" class="btn-submit">답글 작성</button>
                            </div>
                        </form>
                    </div>
                `;
                const commentItem = event.target.closest('.comment-item');
                commentItem.insertAdjacentHTML('afterend', replyFormHtml);
            } else {
                alert('로그인이 필요합니다.');
            }
        }

        // 좋아요 토글, 북마크, 공유, 신고 등 기존 함수는 그대로 유지
        function toggleLike() {
            const btn = document.querySelector('.action-btn');
            const isLiked = btn.classList.contains('liked');
            
            if (isLiked) {
                btn.classList.remove('liked');
                btn.innerHTML = '<span>❤️</span><span>좋아요 23</span>';
                alert('좋아요를 취소했습니다.');
            } else {
                btn.classList.add('liked');
                btn.innerHTML = '<span>❤️</span><span>좋아요 25</span>';
                alert('좋아요를 눌렀습니다.');
            }
        }
        
        function toggleBookmark() {
            alert('게시글을 북마크에 저장했습니다.');
        }
        
        function sharePost() {
            navigator.clipboard.writeText(window.location.href).then(() => {
                alert('게시글 링크가 복사되었습니다.');
            });
        }
        
        function reportPost() {
            if (confirm('이 게시글을 신고하시겠습니까?')) {
                alert('신고가 접수되었습니다. 검토 후 조치하겠습니다.');
            }
        }
        
        // 뒤로가기
        function goBack() {
            window.location.href = 'community.jsp';
        }
    </script>
</body>
</html>
