<%@page import="userTable.UserDTO"%>
<%@page import="userTable.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	
	// 폼에서 전송된 파라미터 받기
	String userid = request.getParameter("userid"); // 이메일 주소
	String password = request.getParameter("password");
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO(userid, password, username, phone);
	dao.insert(dto);	
	
	response.sendRedirect("login.jsp?message=signup_success");
%>