<%@page import="userTable.UserDTO"%>
<%@page import="userTable.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	
	String userid = "test@example.com";
	String password = request.getParameter("password");
	String username = request.getParameter("nickname");
	String phone = request.getParameter("phone");
	
	System.out.println(password);
	System.out.println(username);
	System.out.println(phone);
	
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(userid, password, username, phone);
	dao.update(dto);	
	
	response.sendRedirect("mypage.jsp");
%>