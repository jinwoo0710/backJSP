<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"  %>
    
<%
	String id = request.getParameter("id");

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/backend";  // 데이터베이스 이름을 backend로 변경
	String user = "root";  // MySQL 사용자명 (기본 root로 가정)
	String pass = "20020710";  // MySQL 비밀번호 (실제 비밀번호로 변경)
	Connection con = DriverManager.getConnection(url, user, pass);
	
	String sql = "delete from stumember where id = ?";
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

