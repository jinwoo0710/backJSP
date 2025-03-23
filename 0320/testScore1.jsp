<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 부여</title>
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
<form action="testScore2.jsp" method="get">
	이름: <input type="text" name="name"><br>
	국어: <input type="text" name="kor"><br>
 	수학: <input type="text" name="math"><br>
   	영어: <input type="text" name="eng"><br>
   	<input type="submit" value="확인">
</form>
</body>
</html>