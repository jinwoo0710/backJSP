<%@page import="userTable.UserDTO"%> 
<%@page import="userTable.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String password = request.getParameter("password");

	UserDAO dao = new UserDAO();
	UserDTO dto = dao.get(userid);
	
	if(dto == null){
		%>
		<script type="text/javascript">
			alert("아이디가 틀렸습니다.");
	        location.href = "login.jsp";
		</script>
		<%
	}else{
		String pwdDB = dto.getPassword();	
		if(password.equals(pwdDB)){
			session.setAttribute("usernumber", Integer.valueOf(dto.getUsernumber()));
		    session.setAttribute("userid", userid);
		    session.setAttribute("username", dto.getUsername());
		    session.setAttribute("password", dto.getPassword());
		    session.setAttribute("phone", dto.getPhone());

		    response.sendRedirect("index.jsp"); 
		}else{
			%>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다.");
		        location.href = "login.jsp";
			</script>
			<%
		}
	}
	
	
	
%>