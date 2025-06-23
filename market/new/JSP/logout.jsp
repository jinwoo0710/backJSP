<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");

	session.invalidate(); // 세션 제거
	response.sendRedirect("index.jsp?message=logout_success"); // 메인으로 리디렉션
%>