<%@page import="sellpostTable.SellPostDTO"%>
<%@page import="sellpostTable.SellPostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");

	int usernumber = (int) session.getAttribute("usernumber");
	String username = (String) session.getAttribute("username");
	String category = request.getParameter("category");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String image = request.getParameter("image");;
	int price = Integer.parseInt(request.getParameter("price"));
	String sold = request.getParameter("productStatus");
	String location = request.getParameter("location");
	int postid = Integer.parseInt(request.getParameter("postid"));

	System.out.println(image);
	SellPostDAO dao = new SellPostDAO();
	SellPostDTO dto = new SellPostDTO(usernumber, username, category, title, content, image, price, sold, location, postid);
	dao.update(dto);	
	
	response.sendRedirect("index.jsp");
%>