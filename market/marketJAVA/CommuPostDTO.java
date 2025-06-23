package commupostTable;

public class CommuPostDTO {
	
	private int postid;
	private int usernumber;
	private String username;
	private String category;
	private String visible;
	private String title;
	private String content;
	private String img;
	private String tag;
	private int viewcnt;
	private String createtime;
	private String updatetime;
	
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getUsernumber() {
		return usernumber;
	}
	public void setUsernumber(int usernumber) {
		this.usernumber = usernumber;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public CommuPostDTO(int postid, int usernumber, String username, String category,
            String visible, String title, String content, String img,
            String tag, int viewcnt, String createtime, String updatetime) {
		this.postid = postid;
		this.usernumber = usernumber;
		this.username = username;
		this.category = category;
		this.visible = visible;
		this.title = title;
		this.content = content;
		this.img = img;
		this.tag = tag;
		this.viewcnt = viewcnt;
		this.createtime = createtime;
		this.updatetime = updatetime;
	}
	public CommuPostDTO(int usernumber, String username, String category,
            String visible, String title, String content, String img,
            String tag) {
		this.usernumber = usernumber;
		this.username = username;
		this.category = category;
		this.visible = visible;
		this.title = title;
		this.content = content;
		this.img = img;
		this.tag = tag;
	}
	public CommuPostDTO(int usernumber, String username, String category,
            String visible, String title, String content, String img,
            String tag, int postid) {
		this.usernumber = usernumber;
		this.username = username;
		this.category = category;
		this.visible = visible;
		this.title = title;
		this.content = content;
		this.img = img;
		this.tag = tag;
		this.postid = postid;
	}

	public CommuPostDTO() {}
}