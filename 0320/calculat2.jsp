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
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));
		String oper = request.getParameterMap().keySet().stream()
                .filter(k -> !"x".equals(k) && !"y".equals(k))
                .findFirst()
                .orElse("");
		double result = 0;
		
		switch(oper){
			case "plu": result = x + y; break;
			case "sub": result = x - y; break;
			case "mul": result = x * y; break;
			case "dvi": result = (y != 0) ? (double)x / y : Double.NaN; break;
		}
	%>
	<div>
		<h1>계산결과 : <%= result%></h1>
	</div>
</body>
</html>