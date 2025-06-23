<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("userid"); // 폼에서는 userid로 오지만 실제로는 email
	String password = request.getParameter("password");
	String returnUrl = request.getParameter("returnUrl");

	// 디버깅용 출력
	System.out.println("로그인 시도 - email: " + email + ", password: " + password);

	// 데이터베이스 연결 정보 (MySQL root 계정)
	String dbURL = "jdbc:mysql://localhost:3306/market_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
	String dbUser = "root";
	String dbPassword = "1111";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	boolean loginSuccess = false;
	String username = "";
	String userid = "";
	int usernumber = 0;
	String errorMessage = "";
	
	try {
		// MySQL 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 데이터베이스 연결
		conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
		System.out.println("데이터베이스 연결 성공");
		
		// 이메일로 사용자 인증 쿼리 (email 컬럼이 있는 경우와 없는 경우 모두 처리)
		String sql = "SELECT usernumber, userid, username, email FROM user WHERE (email = ? OR userid = ?) AND password = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, email); // userid로도 로그인 가능하도록 백워드 호환성 유지
		pstmt.setString(3, password);
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			loginSuccess = true;
			usernumber = rs.getInt("usernumber");
			userid = rs.getString("userid");
			username = rs.getString("username");
			String userEmail = rs.getString("email");
			
			// 세션에 사용자 정보 저장
			session.setAttribute("userid", userid);
			session.setAttribute("userID", userid); // 호환성을 위해 두 키 모두 저장
			session.setAttribute("username", username);
			session.setAttribute("usernumber", usernumber);
			session.setAttribute("email", userEmail);
			
			System.out.println("로그인 성공 - usernumber: " + usernumber + ", userid: " + userid + ", username: " + username + ", email: " + userEmail);
		} else {
			errorMessage = "이메일 또는 비밀번호가 올바르지 않습니다.";
			System.out.println("로그인 실패 - 일치하는 사용자 없음");
		}
		
	} catch (ClassNotFoundException e) {
		errorMessage = "MySQL 드라이버를 찾을 수 없습니다.";
		System.out.println("MySQL 드라이버 오류: " + e.getMessage());
		e.printStackTrace();
	} catch (SQLException e) {
		errorMessage = "데이터베이스 연결 오류가 발생했습니다.";
		System.out.println("데이터베이스 오류: " + e.getMessage());
		e.printStackTrace();
	} catch (Exception e) {
		errorMessage = "시스템 오류가 발생했습니다.";
		System.out.println("시스템 오류: " + e.getMessage());
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if (loginSuccess) {
		// 로그인 성공 시 원래 페이지로 이동
		if (returnUrl != null && !returnUrl.isEmpty()) {
			response.sendRedirect(returnUrl);
		} else {
			response.sendRedirect("index.jsp?message=login_success");
		}
	} else {
		// 로그인 실패 시 에러 메시지와 함께 로그인 페이지로 이동
		String redirectUrl = "login.jsp?error=1";
		if (returnUrl != null && !returnUrl.isEmpty()) {
			redirectUrl += "&returnUrl=" + java.net.URLEncoder.encode(returnUrl, "UTF-8");
		}
		response.sendRedirect(redirectUrl);
	}
%>