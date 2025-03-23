<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); // ★ 한글 깨짐 방지%>
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
		
		#address {
	        width: 150px;
	        text-align: center;
	    }
	    
	    #address option {
	        text-align: center;
	    }
	  	
	  	#name,#password,#memo{
	  		width: 150px;
	  	}
	</style>
</head>
<body>
	<form action="signin2.jsp" method="post" accept-charset="UTF-8">
		<table>
	        <tr>
	            <td>아이디</td>
	            <td>
	            	<input type="text" name="id" id="id">
            	</td>
	        </tr>
	        <tr>
	            <td>비밀번호</td>
	            <td>
	            	<input type="password" name="password" id="pw">
	           	</td>
	        </tr>
	        <tr>
	            <td>성별</td>
	            <td>
	            	<input type="radio" name="gender" id="male" value="남">남
	                <input type="radio" name="gender" id="female" value="여">여
	          	</td>
	        </tr><tr>
	            <td>가입경로</td>
	            <td> <select name="route" id="route">
	                <option value="웹검색">웹검색</option>
	                <option value="지인추천">지인추천</option>
	                <option value="광고">광고</option>
	                <option value="기타">기타</option>
	            </select></td>
	        </tr>
	        <tr>
	            <td>주소지</td>
	            <td> 
	            	<select name="address" id="address" size="2">
	                	<option value="서울">서울</option>
	                	<option value="부산">부산</option>
	                	<option value="경기">경기</option>
	                	<option value="기타">기타</option>
	            	</select>
            	</td>
	        </tr>
	        <tr>
	            <td>메모</td>
	            <td>
	            	<textarea name="memo" id="memo" cols="20" rows="5"></textarea>
	            </td>
	        </tr>
	    </table>
	    <button>회원가입</button>
	</form>
</body>
</html>
