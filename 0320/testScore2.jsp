<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		div{
			background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin: auto;
            margin-top: 10%;
		}
	</style>
</head>
<body>
	<%
		String name = request.getParameter("name");
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int kor = Integer.parseInt(request.getParameter("kor"));
		int sum = eng + math + kor;
	%>
	
	<div>
		<%=name %>의 성적<br>
		국어 : <%= kor %><br>
		수학 : <%= math %><br>
		영어 : <%= eng %><br>
		총점 : <%= sum %><br>
		평균 : <%= String.format("%.2f", sum/3.0) %>
	</div>
</body>
</html>