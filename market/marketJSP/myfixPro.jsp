<%@page import="userTable.UserDTO"%>
<%@page import="userTable.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	
	String userid = (String) session.getAttribute("userid");
	
	String username = request.getParameter("nickname");
	String phone = request.getParameter("phone");
	String test = (String) session.getAttribute("password");	
	String passwordParam = request.getParameter("password");
	String password = (passwordParam == null || passwordParam.trim().isEmpty()) ? (String) session.getAttribute("password") : passwordParam;

	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(userid, password, username, phone);
	
	session.setAttribute("username", username);
    session.setAttribute("password", password);
    session.setAttribute("phone", phone);
    
	dao.update(dto);	
	
	response.sendRedirect("mypage.jsp");
%>