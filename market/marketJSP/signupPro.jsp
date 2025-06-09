<%@page import="userTable.UserDTO"%>
<%@page import="userTable.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	
	
	String userid = request.getParameter("email");
	String password = request.getParameter("password");
	String username = request.getParameter("nickname");
	String phone = request.getParameter("phone");
	String createdate = "2024-06-05 10:00:00";
	
	System.out.println(userid);
	System.out.println(password);
	System.out.println(username);
	System.out.println(phone);
	System.out.println(createdate);
	
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(userid, password, username, phone, createdate);
	dao.insert(dto);	
	
	response.sendRedirect("login.jsp");
%>