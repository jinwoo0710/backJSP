package postTable;

public class PostDTO {
	
	private int postid;
	private String userid;
	private String username;
	private String state;
	private String category;
	private String title;
	private String content;
	private String image;
	private int price;
	private String sold;
	private String location;
	private int viewcnt;
	private String createdate;
	private String updatedate;
	
	
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSold() {
		return sold;
	}
	public void setSold(String sold) {
		this.sold = sold;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	
	public PostDTO(int postid, String userid, String username, String state, String category, String title, String content, String image, int price, String sold, String location, int viewcnt, String createdate, String updatedate) {
		this.postid = postid;
		this.userid = userid;
		this.username = username;
		this.state = state;
		this.category = category;
		this.title = title;
		this.content = content;
		this.image = image;
		this.price = price;
		this.sold = sold;
		this.location = location;
		this.viewcnt = viewcnt;
		this.createdate = createdate;
		this.updatedate = updatedate;
	}
	public PostDTO() {}
	

	
}
