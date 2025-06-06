package postTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.util.ArrayList;

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
public class PostDAO {
	
	//DB연동 커넥션 생성
	private Connection getConnection() throws Exception {
		
		//connection pool을 활용한 db연동
		Context initCtx = new InitialContext();
	   	DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/market");
	   	Connection con = ds.getConnection();
	   	
		return con;
	}
	//데이터베이스에 데이터 저장
	public void insert(PostDTO dto) {
		String sql = "INSERT INTO post(postid, userid, username, state, category, title, content, image, price, sold, location, viewcnt, createdtime, updatedtime) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try(
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);	
		) {
			pstmt.setInt(1, dto.getPostid());
			pstmt.setString(2, dto.getUserid());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getState());
			pstmt.setString(5, dto.getCategory());
			pstmt.setString(6, dto.getTitle());
			pstmt.setString(7, dto.getContent());
			pstmt.setString(8, dto.getImage());
			pstmt.setInt(9, dto.getPrice());
			pstmt.setString(10, dto.getSold());
			pstmt.setString(11, dto.getLocation());
			pstmt.setInt(12, dto.getViewcnt());
			pstmt.setString(13, dto.getCreatedate());
			pstmt.setString(14, dto.getUpdatedate());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	
//	//DB에서 레코드 조회
//	public ArrayList<UserDTO> list(){
//		String sql = "SELECT id, name, pwd FROM MEMBER";
//		ArrayList<UserDTO> dtos = new ArrayList<UserDTO>();
//		try(Connection con = getConnection();
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery(sql);					
//		) 
//		{	//ResultSet에 들어있는 레코드를 추출하여 ArrayList에 추가
//			while(rs.next()) {
//				String id = rs.getString("id");
//				String name = rs.getString("name");
//				String pwd = rs.getString("pwd");
//				UserDTO dto = new UserDTO(id, name, pwd);
//				dtos.add(dto);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return dtos;
//	}
//	
//	//updateForm에 출력할 데이터 가져오기
//	public UserDTO get(String id) {
//		String sql = "select * from member where id = ?";
//		UserDTO dto=null;
//		try (
//			Connection con = getConnection();
//			PreparedStatement pstmt = con.prepareStatement(sql);
//		){
//			pstmt.setString(1, id);
//			ResultSet rs = pstmt.executeQuery();
//			rs.next();
//			String name = rs.getString("name");
//			String pwd = rs.getString("pwd");
//			
//			dto = new UserDTO(id, name, pwd);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return dto;
//	}
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





