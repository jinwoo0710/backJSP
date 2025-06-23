package sellpostTable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.util.ArrayList;
import java.util.ArrayList;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SellPostDAO {
	
	//DB연동 커넥션 생성
	private Connection getConnection() throws Exception {
		
		Context initCtx = new InitialContext();
	   	DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/market");
	   	Connection con = ds.getConnection();
	   	
		return con;
	}
	//데이터베이스에 데이터 저장
	public void insert(SellPostDTO dto) {
		String sql = "INSERT INTO sellpost (usernumber, username, category, title, content, image, price, sold, location) "
		           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try(
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);	
		) {
			System.out.println("posting....");
			pstmt.setInt(1, dto.getUsernumber());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getTitle());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getImage());
			pstmt.setInt(7, dto.getPrice());
			pstmt.setString(8, dto.getSold());
			pstmt.setString(9, dto.getLocation());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DB에서 레코드 조회
	public ArrayList<SellPostDTO> list(){
		String sql = "SELECT * FROM sellpost";
		ArrayList<SellPostDTO> dtos = new ArrayList<SellPostDTO>();
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);					
		) 
		{	
			while(rs.next()) {
				int postid = rs.getInt("postid");
				int usernumber = rs.getInt("usernumber");
				String username = rs.getString("username");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String image = rs.getString("image");
				int price = rs.getInt("price");
				String sold = rs.getString("sold");
				String location = rs.getString("location");
				int viewcnt = rs.getInt("viewcnt");
				String createdtime = rs.getString("createdtime");
				String updatedtime = rs.getString("updatedtime");

				SellPostDTO dto = new SellPostDTO(
				    postid, usernumber, username, category,
				    title, content, image, price, sold, location,
				    viewcnt, createdtime, updatedtime
				);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dtos;
	}
	
	//updateForm에 출력할 데이터 가져오기
	public SellPostDTO get(int id) {
		String sql = "select * from sellpost where postid = ?";
		SellPostDTO dto=null;
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int postid = rs.getInt("postid");
				int usernumber = rs.getInt("usernumber");
				String username = rs.getString("username");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String image = rs.getString("image");
				int price = rs.getInt("price");
				String sold = rs.getString("sold");
				String location = rs.getString("location");
				int viewcnt = rs.getInt("viewcnt");
				String createdtime = rs.getString("createdtime");
				String updatedtime = rs.getString("updatedtime");

				dto = new SellPostDTO(
				    postid, usernumber, username, category,
				    title, content, image, price, sold, location,
				    viewcnt, createdtime, updatedtime
				);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 특정 게시글 조회 (상세 페이지용)
	public SellPostDTO getPost(int postid) {
		return get(postid);
	}
	
	// 조회수 증가
	public void increaseViews(int postid) {
		String sql = "UPDATE sellpost SET viewcnt = viewcnt + 1 WHERE postid = ?";
		
		try(
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);	
		) {
			pstmt.setInt(1, postid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//update
	public void update(SellPostDTO dto) {
	    String sql = "UPDATE sellpost SET usernumber=?, username=?, category=?, title=?, content=?, image=?, price=?, sold=?, location=? WHERE postid=?";
	
	    try (
	        Connection con = getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql);
	    ) {
	    	System.out.println("updating...");
	        pstmt.setInt(1, dto.getUsernumber());
	        pstmt.setString(2, dto.getUsername());
	        pstmt.setString(3, dto.getCategory());
	        pstmt.setString(4, dto.getTitle());
	        pstmt.setString(5, dto.getContent());
	        pstmt.setString(6, dto.getImage());
	        pstmt.setInt(7, dto.getPrice());
	        pstmt.setString(8, dto.getSold());
	        pstmt.setString(9, dto.getLocation());
	        pstmt.setInt(10, dto.getPostid());
	
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public ArrayList<SellPostDTO> read(String word, String category, String minPrice, String maxPrice, String location, String sort) {
	    ArrayList<SellPostDTO> dtos = new ArrayList<>();
	    StringBuilder sql = new StringBuilder("SELECT * FROM sellpost WHERE 1=1");

	    ArrayList<Object> params = new ArrayList<>();

	    // 검색어
	    if (word != null && !word.trim().isEmpty()) {
	        sql.append(" AND (title LIKE ? OR content LIKE ?)");
	        String keyword = "%" + word.trim() + "%";
	        params.add(keyword);
	        params.add(keyword);
	    }

	    // 카테고리
	    if (category != null && !category.isEmpty()) {
	        sql.append(" AND category = ?");
	        params.add(category);
	    }

	    // 가격
	    if (minPrice != null && !minPrice.isEmpty()) {
	        sql.append(" AND price >= ?");
	        params.add(Integer.parseInt(minPrice));
	    }

	    if (maxPrice != null && !maxPrice.isEmpty()) {
	        sql.append(" AND price <= ?");
	        params.add(Integer.parseInt(maxPrice));
	    }

	    // 지역
	    if (location != null && !location.isEmpty()) {
	        sql.append(" AND location LIKE ?");
	        params.add("%" + location + "%");
	    }

	    System.out.println("정렬 조건(sort): " + sort);
	    // 정렬 조건 추가
	    if (sort != null) {
	        sort = sort.trim();
	        switch (sort) {
	            case "latest":
	                sql.append(" ORDER BY updatedtime DESC");
	                break;
	            case "price-low":
	                sql.append(" ORDER BY price ASC");
	                break;
	            case "price-high":
	                sql.append(" ORDER BY price DESC");
	                break;
	            default:
	                sql.append(" ORDER BY updatedtime DESC"); // 기본값
	        }
	    }

	    System.out.println("최종 SQL: " + sql.toString());

	    try (
	        Connection con = getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql.toString());
	    ) {
	        for (int i = 0; i < params.size(); i++) {
	            pstmt.setObject(i + 1, params.get(i));
	        }

	        ResultSet rs = pstmt.executeQuery();
	        System.out.println(rs);
	        while (rs.next()) {
	            SellPostDTO dto = new SellPostDTO(
	                rs.getInt("postid"),
	                rs.getInt("usernumber"),
	                rs.getString("username"),
	                rs.getString("category"),
	                rs.getString("title"),
	                rs.getString("content"),
	                rs.getString("image"),
	                rs.getInt("price"),
	                rs.getString("sold"),
	                rs.getString("location"),
	                rs.getInt("viewcnt"),
	                rs.getString("createdtime"),
	                rs.getString("updatedtime")
	            );
	            dtos.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return dtos;
	}
	
	public void delete(int postid) {
	    String sql = "DELETE FROM sellpost WHERE postid=?";

	    try (
	        Connection con = getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql);
	    ) {
	    	System.out.println("deleting...");
	        pstmt.setInt(1, postid);
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}





