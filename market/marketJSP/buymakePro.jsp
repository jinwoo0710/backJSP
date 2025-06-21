<%@page import="buypostTable.BuyPostDTO"%>
<%@page import="buypostTable.BuyPostDAO"%>
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
	String phone = request.getParameter("phone"); 
	String sold = request.getParameter("sold");
	if (sold == null || sold.isEmpty()) {
	    sold = "구하는중";  // 또는 기본값
	}
	String urgency = request.getParameter("urgency");
	if (urgency == null || urgency.isEmpty()) {
	    urgency = "일반";  // 기본값
	}
	String location = request.getParameter("location");
	String calltime = request.getParameter("calltime");
	String deal = request.getParameter("deal");
	String[] concatarr = request.getParameterValues("concat");
	String concat = null;
	if (concatarr != null) {
		concat = String.join(",", concatarr); 
	}
	
	// 출력 확인
	System.out.println("usernumber: " + usernumber);
	System.out.println("username: " + username);
	System.out.println("category: " + category);
	System.out.println("title: " + title);
	System.out.println("content: " + content);
	System.out.println("image: " + image);
	System.out.println("price: " + price);
	System.out.println("phone: " + phone);
	System.out.println("sold: " + sold);
	System.out.println("urgency: " + urgency);
	System.out.println("location: " + location);
	System.out.println("calltime: " + calltime);
	System.out.println("deal: " + deal);
	System.out.println("concat: " + concat);


	
	BuyPostDAO dao = new BuyPostDAO();
	BuyPostDTO dto = new BuyPostDTO(
		    usernumber,
		    username,
		    category,
		    title,
		    content,
		    image,
		    price,
		    phone,
		    calltime,
		    concat,
		    sold,
		    urgency,
		    location
		);
	dao.insert(dto);	
	
	response.sendRedirect("index.jsp");
%>