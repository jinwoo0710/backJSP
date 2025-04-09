
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//1. DB 연동 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//2. 연결 객체 생성
	String url = "jdbc:mysql://localhost:3306/backend";  // 데이터베이스 이름을 backend로 변경
	String user = "root";  // MySQL 사용자명 (기본 root로 가정)
	String pass = "20020710";  // MySQL 비밀번호 (실제 비밀번호로 변경)
	Connection con = DriverManager.getConnection(url, user, pass);
	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "UPDATE stumember SET NAME=?, PWD=? WHERE ID=?";
	PreparedStatement stmt = con.prepareStatement(sql);
	//4. SQL 실행
	stmt.setString(1, name);
	stmt.setString(2, pwd);
	stmt.setString(3, id);
	
	int i = stmt.executeUpdate();
	if(i == 1){
		out.println("업데이트 되었습니다.");
	}
	//5. 객체 해제
	con.close();
	stmt.close();
	%>
	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='list.jsp';
		}
	</script>



