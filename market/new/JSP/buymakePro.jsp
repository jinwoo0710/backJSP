<%@ page import="java.sql.*, javax.naming.*, javax.sql.*, java.io.*, java.util.*, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, market.buypost.BuyPostDAO, market.buypost.BuyPostDTO" contentType="application/json; charset=UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    request.setCharacterEncoding("UTF-8");

    String userid = (String) session.getAttribute("userid");
    JSONObject jsonResponse = new JSONObject();

    if (userid == null) {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        jsonResponse.put("status", "error");
        jsonResponse.put("message", "로그인이 필요합니다.");
        out.print(jsonResponse.toJSONString());
        return;
    }

    String savePath = application.getRealPath("/marketJSP/upload_buy");
    int sizeLimit = 10 * 1024 * 1024;
    String encType = "UTF-8";

    try {
        MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, encType, new DefaultFileRenamePolicy());

        String username = multi.getParameter("username");
        int usernumber = Integer.parseInt(multi.getParameter("usernumber"));
        String category = multi.getParameter("category");
        String title = multi.getParameter("title");
        String content = multi.getParameter("content");
        double price = Double.parseDouble(multi.getParameter("price"));
        String location = multi.getParameter("location");

        Enumeration files = multi.getFileNames();
        String imageFileNames = "";
        while(files.hasMoreElements()) {
            String name = (String) files.nextElement();
            String filename = multi.getFilesystemName(name);
            if (filename != null) {
                if (!imageFileNames.isEmpty()) {
                    imageFileNames += ";";
                }
                imageFileNames += filename;
            }
        }
        
        BuyPostDAO dao = new BuyPostDAO();
        BuyPostDTO dto = new BuyPostDTO(usernumber, username, category, title, content, imageFileNames, price, location);
        int result = dao.insert(dto);

        if (result > 0) {
            response.setStatus(HttpServletResponse.SC_OK);
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "게시글이 성공적으로 등록되었습니다.");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "게시글 등록에 실패했습니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        jsonResponse.put("status", "error");
        jsonResponse.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
    }
    out.print(jsonResponse.toJSONString());
%>