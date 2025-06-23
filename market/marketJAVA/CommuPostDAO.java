package commupostTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommuPostDAO {

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/market");
        return ds.getConnection();
    }

    // 데이터 삽입 (자동생성 컬럼 제외)
    public void insert(CommuPostDTO dto) {
        String sql = "INSERT INTO commupost (usernumber, username, category, visible, title, content, img, tag) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
        	System.out.println("inserting...");
            pstmt.setInt(1, dto.getUsernumber());
            pstmt.setString(2, dto.getUsername());
            pstmt.setString(3, dto.getCategory());
            pstmt.setString(4, dto.getVisible());
            pstmt.setString(5, dto.getTitle());
            pstmt.setString(6, dto.getContent());
            pstmt.setString(7, dto.getImg());
            pstmt.setString(8, dto.getTag());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 전체 목록 조회
    public ArrayList<CommuPostDTO> list() {
        String sql = "SELECT * FROM commupost";
        ArrayList<CommuPostDTO> dtos = new ArrayList<>();

        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                int postid = rs.getInt("postid");
                int usernumber = rs.getInt("usernumber");
                String username = rs.getString("username");
                String category = rs.getString("category");
                String visible = rs.getString("visible");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String img = rs.getString("img");
                String tag = rs.getString("tag");
                int viewcnt = rs.getInt("viewcnt");
                String createtime = rs.getString("createtime");
                String updatetime = rs.getString("updatetime");

                CommuPostDTO dto = new CommuPostDTO(postid, usernumber, username, category,
                        visible, title, content, img, tag,
                        viewcnt, createtime, updatetime);

                dtos.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dtos;
    }

    // 단일 레코드 조회
    public CommuPostDTO get(int id) {
        String sql = "SELECT * FROM commupost WHERE postid = ?";
        CommuPostDTO dto = null;

        try (Connection con = getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int postid = rs.getInt("postid");
                int usernumber = rs.getInt("usernumber");
                String username = rs.getString("username");
                String category = rs.getString("category");
                String visible = rs.getString("visible");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String img = rs.getString("img");
                String tag = rs.getString("tag");
                int viewcnt = rs.getInt("viewcnt");
                String createtime = rs.getString("createtime");
                String updatetime = rs.getString("updatetime");

                dto = new CommuPostDTO(postid, usernumber, username, category,
                        visible, title, content, img, tag,
                        viewcnt, createtime, updatetime);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}