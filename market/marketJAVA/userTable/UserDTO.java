package userTable;

public class UserDTO {
	
	private String userid;
	private String password;
	private String username;
	private String email;
	private String phone;
	private String createdate;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public UserDTO(String userid, String password, String username, String email, String phone, String createdate) {
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.createdate = createdate;
	}
	public UserDTO() {}

	
}
