<%@page import="userTable.UserDTO"%>
<%@page import="userTable.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	System.out.println("탈퇴");
	request.setCharacterEncoding("utf-8");

	String userid = (String) session.getAttribute("userid");
	System.out.println(userid); 
	UserDAO dao = new UserDAO();
	dao.delete(userid);

	session.invalidate(); // 세션 제거
	response.sendRedirect("index.jsp"); // 메인으로 리디렉션
%>