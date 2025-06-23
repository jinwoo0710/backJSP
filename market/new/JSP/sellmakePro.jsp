<%@page import="sellpostTable.SellPostDTO"%>
<%@page import="sellpostTable.SellPostDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<%!
    // 파일 이름에서 순수 파일명만 추출하는 헬퍼 메서드
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return new File(token.substring(token.indexOf("=") + 2, token.length() - 1)).getName();
            }
        }
        return null;
    }
%>
<%	
	request.setCharacterEncoding("utf-8");

	try {
		// 세션에서 사용자 정보 가져오기
		Integer usernumberObj = (Integer) session.getAttribute("usernumber");
		String username = (String) session.getAttribute("username");
		
		if (usernumberObj == null || username == null) {
			// 비정상적인 접근, 로그인 페이지로 리다이렉트
			response.sendRedirect("login.jsp?error=session_expired");
			return;
		}
		
		int usernumber = usernumberObj.intValue();

		// 폼 데이터 가져오기 (request.getParameter 사용)
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String condition = request.getParameter("condition");
		String priceStr = request.getParameter("price");
		String sold = "판매중";
		String location = request.getParameter("location");
		String phone = request.getParameter("phone");
		
		// 이미지 업로드 설정
		String uploadPath = application.getRealPath("/uploads/sellImages");
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// 이미지 파일 처리 (request.getParts 사용)
		List<String> uploadedFiles = new ArrayList<>();
		Collection<Part> parts = request.getParts();

		for (Part part : parts) {
			if (part.getName().equals("images") && part.getSize() > 0) {
				String fileName = getFileName(part);
				if (fileName != null && !fileName.isEmpty()) {
					// 동일한 파일명 방지를 위해 UUID 추가
					String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
					part.write(uploadPath + File.separator + uniqueFileName);
					uploadedFiles.add(uniqueFileName);
				}
			}
		}
		
		// 가격 처리
		int price = 0;
		if (priceStr != null && !priceStr.isEmpty()) {
			price = Integer.parseInt(priceStr.replaceAll("[^0-9]", ""));
		}
		
		// 데이터베이스에 저장할 파일명 목록 (쉼표로 구분)
		String image = String.join(",", uploadedFiles);
		
		// 데이터베이스에 저장
		SellPostDAO dao = new SellPostDAO();
		SellPostDTO dto = new SellPostDTO(usernumber, username, category, title, content, image, price, sold, location);
		dao.insert(dto);	
		
		// 성공 시 판매 목록 페이지로 이동
		response.sendRedirect("sell.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
%>
<script>
	alert('등록 중 오류가 발생했습니다. 입력 내용을 확인하고 다시 시도해주세요.');
	history.back();
</script>
<%
	}
%>