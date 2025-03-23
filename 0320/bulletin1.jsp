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
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 60%;
            height: 600px;
            text-align: center;
            margin: auto;
            margin-top: 5%;
		}
		
		#con{
			display: flex; /* 가로로 배치 */
			justify-content: space-between; /* 제목과 버튼을 양쪽 끝에 배치 */
			width: 60%;
			margin-left: 20%;
		}
		
		#title{
			border: 1px solid rgb(178, 178, 178);
			margin-bottom: 10px;
			width: 60%;
            height: 10%;
           	font-size: 20px;
           	margin-right: 50px;
		}
		
		#name{
			border: 1px solid rgb(178, 178, 178);
			margin-bottom: 10px;
            height: 10%;
           	font-size: 20px;
           	margin-right: 20px;
		}
		
		textarea{
			border: 1px solid rgb(178, 178, 178);
			width: 60%;
            height: 80%;
            margin-top: 10px;
           	font-size: 15px;
		} 
		
		#btn{
			width: 100px;
			background-color: rgb(191, 255, 204);
			border: 1px solid white;
		}
	</style>
</head>
<body>
	<form action="bulletin2.jsp" method="get">
		<div id="textbox">
			<div id="con">
				<input type="text" name="name" id="name" placeholder="닉네임">
				<input type="text" name="title" id="title" placeholder="제목">
				<input type="submit" name="btn" id="btn" value="제출">
			</div>
			<hr>
			<textarea name="textarea" placeholder=" 본문을 작성하세요"></textarea>
			<%@ page import="java.time.ZonedDateTime, java.time.format.DateTimeFormatter, java.time.ZoneOffset" %>
			<%
			    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			    String time = ZonedDateTime.now(ZoneOffset.UTC).format(formatter);
			%>
			<input type="hidden" name="time" value="<%= time %>">
		</div>
	</form>
</body>
</html>