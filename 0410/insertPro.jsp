<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import ="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	//1. DB 연동 드라이버 로드
	new InitialContext();
   	Context initCtx = new  InitialContext();
   	DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/backend");
   	Connection con = ds.getConnection();
	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "insert into member values (?, ? , ?)";
	//4. SQL 실행
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, id);
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
