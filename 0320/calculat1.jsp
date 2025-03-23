<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		form{
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
	<form action="calculat2.jsp" method="get">
		X : <input type="text" name="x"><br>
		Y : <input type="text" name="y"><br>
		<input type="submit" name="plu" value="+">
		<input type="submit" name="sub" value="-">
		<input type="submit" name="mul" value="*">
		<input type="submit" name="dvi" value="/">
	</form>
</body>
</html>