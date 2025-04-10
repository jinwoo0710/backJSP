<%@page import="javax.naming.*" %>
<%@page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<%
	String id = request.getParameter("id");

	new InitialContext();
   	Context initCtx = new  InitialContext();
   	DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/backend");
   	Connection con = ds.getConnection();
	
	String sql = "delete from member where id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	int state = pstmt.executeUpdate();
	
	if(state == 1){
		out.println(id + "님의 정보가 삭제 되었습니다.");
	}
	else{
		out.println("실패했습니다.");
	}
	
	con.close();
	pstmt.close();
%>
	
<script>
		let ans = alert("삭제되었습니다!");
		if (!ans){
			location.href='list.jsp';
		}
</script>

