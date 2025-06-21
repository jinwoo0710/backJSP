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
	String image = null;
	int price = Integer.parseInt(request.getParameter("price"));
	String sold = request.getParameter("productStatus");
	String location = request.getParameter("location");
	int postid = Integer.parseInt(request.getParameter("postid"));
	
	
	System.out.println("usernumber: " + usernumber);
	System.out.println("username: " + username);
	System.out.println("category: " + category);
	System.out.println("title: " + title);
	System.out.println("content: " + content);
	System.out.println("image: " + image);
	System.out.println("price: " + price);
	System.out.println("sold: " + sold);
	System.out.println("location: " + location);
	System.out.println("postid: " + postid);

	
	SellPostDAO dao = new SellPostDAO();
	SellPostDTO dto = new SellPostDTO(usernumber, username, category, title, content, image, price, sold, location, postid);
	dao.update(dto);	
	
	response.sendRedirect("index.jsp");
%>