package buypostTable;

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
/**
 * 패키지명 : cs.dit.member
 * 파일명 : MemberDAO.java
 * 작성일 : 2025. 4. 16.
 * 작성자 : 김진숙
 * 변경이력 :
 * 프로그램 설명 : 데이터베이스와 연동하고 CRUD가 가능한 메소드 구현
 *
 */
public class BuyPostDAO {
	
	//DB연동 커넥션 생성
	private Connection getConnection() throws Exception {
		
		//connection pool을 활용한 db연동
		Context initCtx = new InitialContext();
	   	DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/market");
	   	Connection con = ds.getConnection();
	   	
		return con;
	}
	//데이터베이스에 데이터 저장
	public void insert(BuyPostDTO dto) {
		String sql = "INSERT INTO buypost (usernumber, username, category, title, content, image, price, phone, calltime, deal, concat, sold, urgency, location)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
			pstmt.setString(8, dto.getPhone());
			pstmt.setString(9, dto.getCalltime());
			pstmt.setString(10, dto.getDeal());     // 예: "직거래,택배"
			pstmt.setString(11, dto.getConcat());   // 예: "채팅,문자"
			pstmt.setString(12, dto.getSold());
			pstmt.setString(13, dto.getUrgency());
			pstmt.setString(14, dto.getLocation());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DB에서 레코드 조회
	public ArrayList<BuyPostDTO> list(){
		String sql = "SELECT * FROM buypost";
		ArrayList<BuyPostDTO> dtos = new ArrayList<BuyPostDTO>();
		try(Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);					
		) 
		{	//ResultSet에 들어있는 레코드를 추출하여 ArrayList에 추가
			while(rs.next()) {
				int postid = rs.getInt("postid");
				int usernumber = rs.getInt("usernumber");
				String username = rs.getString("username");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String image = rs.getString("image");
				int price = rs.getInt("price");
				String phone = rs.getString("phone");
				String calltime = rs.getString("calltime");
				String deal = rs.getString("deal");
				String concat = rs.getString("concat");
				String sold = rs.getString("sold");
				String urgency = rs.getString("urgency");
				String location = rs.getString("location");
				int viewcnt = rs.getInt("viewcnt");
				String createdtime = rs.getString("createdtime");
				String updatedtime = rs.getString("updatedtime");

				BuyPostDTO dto = new BuyPostDTO(
				    postid, usernumber, username, category, title, content, image,
				    price, phone, calltime, deal, concat, sold, urgency, location,
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
	public BuyPostDTO get(int id) {
		String sql = "select * from buypost where postid = ?";
		BuyPostDTO dto=null;
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
				String phone = rs.getString("phone");
				String calltime = rs.getString("calltime");
				String deal = rs.getString("deal");
				String concat = rs.getString("concat");
				String sold = rs.getString("sold");
				String urgency = rs.getString("urgency");
				String location = rs.getString("location");
				int viewcnt = rs.getInt("viewcnt");
				String createdtime = rs.getString("createdtime");
				String updatedtime = rs.getString("updatedtime");
				
				dto = new BuyPostDTO(
					    postid, usernumber, username, category, title, content, image,
					    price, phone, calltime, deal, concat, sold, urgency, location,
					    viewcnt, createdtime, updatedtime
					);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 특정 게시글 조회 (상세 페이지용)
	public BuyPostDTO getPost(int postid) {
		return get(postid);
	}
	
	// 조회수 증가
	public void increaseViews(int postid) {
		String sql = "UPDATE buypost SET viewcnt = viewcnt + 1 WHERE postid = ?";
		
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
//	//update
//	public void update(UserDTO dto) {
//		String sql = "UPDATE member SET NAME=?, PWD=? WHERE ID=?";
//		
//		try(
//			Connection con = getConnection();
//			PreparedStatement pstmt = con.prepareStatement(sql);	
//		) {
//			pstmt.setString(1, dto.getName());
//			pstmt.setString(2, dto.getPwd());
//			pstmt.setString(3, dto.getId());
//			
//			pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public void delete(String id) {
//		String sql = "DELETE FROM MEMBER WHERE ID=?";
//		
//		try(
//			Connection con = getConnection();
//			PreparedStatement pstmt = con.prepareStatement(sql);	
//		) {
//			pstmt.setString(1, id);
//			
//			pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}





