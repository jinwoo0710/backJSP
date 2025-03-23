<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); // ★ 한글 깨짐 방지%>
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
	<div>
		<h2>입력한 정보</h2>
	    <p><strong>아이디:</strong> <%= request.getParameter("id") %></p>
	    <p><strong>비밀번호:</strong> (보안상 출력하지 않음)</p>
	    <p><strong>성별:</strong> <%= request.getParameter("gender") %></p>
	    <p><strong>가입경로:</strong> <%= request.getParameter("route") %></p>
	    <p><strong>주소지:</strong> <%= request.getParameter("address") %></p>
	    <p><strong>메모:</strong> <%= request.getParameter("memo") %></p>	
	</div>
</body>
</html>