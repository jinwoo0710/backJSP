<%@page import="postTable.PostDTO"%>
<%@page import="postTable.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	
	int postid = 123456789;
	String userid = "123456789";
	String username = "jinwoo";
	String state = "sell";
	String category = request.getParameter("category");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String image = null;
	Integer price = 20000;
	String sold = "판매중";
	String location = request.getParameter("location");
	int viewcnt = 0;
	String createdate = "2024-06-05 10:00:00";
	String updatedate = "2024-06-06 12:00:00";
	
	PostDAO dao = new PostDAO();
	PostDTO dto = new PostDTO(postid, userid, username, state, category, title, content, image, price, sold, location, viewcnt, createdate, updatedate);
	dao.insert(dto);	
	
	response.sendRedirect("index.jsp");
%>