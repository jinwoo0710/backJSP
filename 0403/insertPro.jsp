
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	//1. DB 연동 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//2. 연결 객체 생성
	String url = "jdbc:mysql://localhost:3306/backend";  // 데이터베이스 이름을 backend로 변경
	String user = "root";  // MySQL 사용자명 (기본 root로 가정)
	String pass = "20020710";  // MySQL 비밀번호 (실제 비밀번호로 변경)
	Connection con = DriverManager.getConnection(url, user, pass);
	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "insert into stumember values (?, ? , ?)";
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	
	int state = pstmt.executeUpdate();
	
	if(state == 1){
		out.println("성공적으로 회원 등록이 되었습니다.");
	}
	//5. 객체 해제
	con.close();
	pstmt.close();
	//6. list.jsp로 이동	
	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	행이 입력되었습니다!
</body>
</html>
