package userTable;

public class UserDTO {
	
	private int usernumber;
	private String userid;
	private String password;
	private String username;
	private String phone;
	private String createdate;

	public int getUsernumber() {
		return usernumber;
	}
	public void setUsernumber(int usernumber) {
		this.usernumber = usernumber;
	}
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
	public UserDTO(int usernumber, String userid, String password, String username, String phone, String createdate) {
		this.usernumber = usernumber;
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.phone = phone;
		this.createdate = createdate;
	}
	public UserDTO(String userid, String password, String username, String phone) {
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.phone = phone;
	}
	public UserDTO() {}

	
}
