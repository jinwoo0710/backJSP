<%@page import="commupostTable.CommuPostDTO"%>
<%@page import="commupostTable.CommuPostDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");

int usernumber = (int) session.getAttribute("usernumber");
	String username = (String) session.getAttribute("username");
	String category = request.getParameter("category");
	String visible = request.getParameter("visible");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String img = null; 
	String tag = request.getParameter("tag");
	String setting = null;
	
	System.out.println("usernumber: " + usernumber);
	System.out.println("username: " + username);
	System.out.println("category: " + category);
	System.out.println("visible: " + visible);
	System.out.println("title: " + title);
	System.out.println("content: " + content);
	System.out.println("img: " + img);
	System.out.println("tag: " + tag);

	
	CommuPostDTO dto = new CommuPostDTO(usernumber, username, category, visible, title, content, img, tag);
	CommuPostDAO dao = new CommuPostDAO();
	dao.insert(dto);

	
	response.sendRedirect("index.jsp");
%>