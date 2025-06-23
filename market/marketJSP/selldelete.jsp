<%@page import="sellpostTable.SellPostDTO"%>
<%@page import="sellpostTable.SellPostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");

	int postid = Integer.parseInt(request.getParameter("postid"));
	System.out.println(postid);
	
	SellPostDAO dao = new SellPostDAO();
	
	dao.delete(postid);	
	
	response.sendRedirect("sell.jsp");
%> 