<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#textbox{
			background-color: #fff;
            padding: 50px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 60%;
            height: 600px;
            margin: auto;
            margin-top: 5%;
		}
		
		#title{
			font-weight: bold;
			font-size: 25px;
		}
		
		#info {
		    display: flex;
		    justify-content: space-between; /* 양쪽 끝 정렬 */
		    align-items: center; /* 세로 중앙 정렬 */
		}
		
</style>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String text = request.getParameter("textarea");
		String time = request.getParameter("time");
	%>
	
	<div id="textbox">
	    <div id="title"><%= title %></div>
	    <hr>
	    <div id="info">
	        <span>작성자:<%= name %></span>
	        <span>작성일시:<%= time %></span>
	    </div>
	    <hr>
	    <div><%= text %></div>
	</div>

</body>
</html>