<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String postType = request.getParameter("postType");
    int postId      = Integer.parseInt(request.getParameter("postId"));
    String sellerId = request.getParameter("sellerId");
    String sellerNm = request.getParameter("sellerName");
    String title    = request.getParameter("title");

    String meId  = (String) session.getAttribute("userid");
    String meNm  = (String) session.getAttribute("username");
    if(meId==null){response.sendRedirect("login.jsp");return;}

    Context ctx = new InitialContext();
    DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/market");
    Connection conn = ds.getConnection();

    int roomId = 0;
    PreparedStatement ps = conn.prepareStatement(
        "SELECT room_id FROM chat_rooms WHERE ((user1_id=? AND user2_id=?) OR (user1_id=? AND user2_id=?)) " +
        "AND post_type=? AND post_id=?" );
    ps.setString(1, meId); ps.setString(2, sellerId);
    ps.setString(3, sellerId); ps.setString(4, meId);
    ps.setString(5, postType); ps.setInt(6, postId);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        roomId = rs.getInt(1);
    } else {
        ps = conn.prepareStatement(
            "INSERT INTO chat_rooms(user1_id,user1_name,user2_id,user2_name,post_type,post_id,post_title) " +
            "VALUES(?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, meId);     ps.setString(2, meNm);
        ps.setString(3, sellerId); ps.setString(4, sellerNm);
        ps.setString(5, postType); ps.setInt(6, postId);
        ps.setString(7, title);
        ps.executeUpdate();
        rs = ps.getGeneratedKeys();
        rs.next(); roomId = rs.getInt(1);
    }
    conn.close();
    response.sendRedirect("chat_room.jsp?roomId="+roomId+"&postType="+postType+"&postId="+postId);
%> 