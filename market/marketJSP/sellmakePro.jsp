<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="sellpostTable.SellPostDTO, sellpostTable.SellPostDAO" %>

<%
    request.setCharacterEncoding("UTF-8");

    String uploadPath = application.getRealPath("/upload");
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdir();

    int usernumber = (int) session.getAttribute("usernumber");
    String username = (String) session.getAttribute("username");

    // 초기화
    String category = null;
    String title = null;
    String content = null;
    String location = null;
    int price = 0;
    String sold = "판매중";
    String image = null;
    try {
        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");

            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                System.out.println(item);
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");


                    switch (name) {
                        case "category": category = value; break;
                        case "title": title = value; break;
                        case "content": content = value; break;
                        case "price": price = Integer.parseInt(value); break;
                        case "location": location = value; break;
                    }
                } else {
                    if (item.getFieldName().equals("image") && item.getSize() > 0) {
                    	System.out.println("4");
                        String fileName = new File(item.getName()).getName();
                        String ext = fileName.substring(fileName.lastIndexOf("."));
                        String newFileName = System.currentTimeMillis() + "_" + usernumber + ext;
                        File storeFile = new File(uploadPath, newFileName);
                        try {
                            storeFile = new File(uploadPath, newFileName);
                            item.write(storeFile);
                            System.out.println("파일 저장 완료: " + storeFile.getAbsolutePath());
                        } catch (Exception e) {
                            System.out.println("파일 저장 실패");
                            e.printStackTrace();
                        }
                        image = "upload/" + newFileName;
                    }
                }
            }


            System.out.println("== 업로드된 폼 데이터 확인 ==");
            System.out.println("usernumber: " + usernumber);
            System.out.println("username: " + username);
            System.out.println("category: " + category);
            System.out.println("title: " + title);
            System.out.println("content: " + content);
            System.out.println("image: " + image);
            System.out.println("price: " + price);
            System.out.println("sold: " + sold);
            System.out.println("location: " + location);

            // DTO 생성 및 DB 저장
            SellPostDTO dto = new SellPostDTO(usernumber, username, category, title, content, image, price, sold, location);
            SellPostDAO dao = new SellPostDAO();
            dao.insert(dto);

            response.sendRedirect("index.jsp");
        }else{
        	System.out.println("전혀 못들어가죠??");
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("<script>alert('오류 발생'); history.back();</script>");
    }
%>
