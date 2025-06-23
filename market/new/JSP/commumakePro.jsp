<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // 세션 확인
    String userid = (String) session.getAttribute("userid");
    String username = (String) session.getAttribute("username");
    Integer usernumber = (Integer) session.getAttribute("usernumber");
    
    if (userid == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // 폼 데이터 받기
    String category = request.getParameter("category");
    String visible = request.getParameter("visible");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String tag = request.getParameter("tag");
    
    // 필수 필드 검증
    if (title == null || title.trim().isEmpty()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입력 오류</title>
</head>
<body>
    <script>
        alert('제목을 입력해주세요.');
        history.back();
    </script>
</body>
</html>
<%
        return;
    }
    
    if (content == null || content.trim().isEmpty()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입력 오류</title>
</head>
<body>
    <script>
        alert('내용을 입력해주세요.');
        history.back();
    </script>
</body>
</html>
<%
        return;
    }
    
    // 데이터베이스 연결
    String dbURL = "jdbc:mysql://localhost:3306/market_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
    String dbUser = "root";
    String dbPassword = "1111";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        // 데이터베이스에 커뮤니티 글 저장
        String sql = "INSERT INTO commupost (usernumber, username, category, visible, title, content, tag) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setInt(1, usernumber);
        pstmt.setString(2, username);
        pstmt.setString(3, category);
        pstmt.setString(4, visible != null ? visible : "전체공개");
        pstmt.setString(5, title);
        pstmt.setString(6, content);
        pstmt.setString(7, tag);
        
        int result = pstmt.executeUpdate();
        
        if (result > 0) {
            // 생성된 게시글 ID 가져오기
            rs = pstmt.getGeneratedKeys();
            int postId = 0;
            if (rs.next()) {
                postId = rs.getInt(1);
            }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록 완료</title>
</head>
<body>
    <script>
        alert('글이 성공적으로 등록되었습니다!');
        window.location.href = 'community.jsp';
    </script>
</body>
</html>
<%
        } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록 실패</title>
</head>
<body>
    <script>
        alert('글 등록에 실패했습니다. 다시 시도해주세요.');
        history.back();
    </script>
</body>
</html>
<%
        }
        
    } catch (Exception e) {
        e.printStackTrace();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시스템 오류</title>
</head>
<body>
    <script>
        alert('시스템 오류가 발생했습니다: <%= e.getMessage().replace("'", "\\'") %>');
        history.back();
    </script>
</body>
</html>
<%
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>