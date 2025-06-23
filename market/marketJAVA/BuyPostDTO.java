package buypostTable;

public class BuyPostDTO {

	private int postid;
	private int usernumber;
	private String username;
	private String category;
	private String title;
	private String content;
	private String image;
	private int price;
	private String phone;
	private String calltime;
	private String deal;
	private String concat;
	private String sold;
	private String urgency;
	private String location;
	private int viewcnt;
	private String createdtime;
	private String updatedtime;
   

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
    public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCalltime() {
		return calltime;
	}

	public void setCalltime(String calltime) {
		this.calltime = calltime;
	}
	
	public String getDeal() {
		return deal;
	}

	public void setDeal(String deal) {
		this.deal = deal;
	}

	public String getConcat() {
		return concat;
	}

	public void setConcat(String how) {
		this.concat = how;
	}

	public String getUrgency() {
		return urgency;
	}

	public void setUrgency(String urgency) {
		this.urgency = urgency;
	}

    public int getViewcnt() {
        return viewcnt;
    }

    public void setViewcnt(int viewcnt) {
        this.viewcnt = viewcnt;
    }

    public String getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(String createdtime) {
        this.createdtime = createdtime;
    }

    public String getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(String updatedtime) {
        this.updatedtime = updatedtime;
    }

    public BuyPostDTO(int postid, int usernumber, String username, String category,
            String title, String content, String image, int price, String phone,
            String calltime, String deal, String concat, String sold, String urgency,
            String location, int viewcnt, String createdtime, String updatedtime) {
		this.postid = postid;
		this.usernumber = usernumber;
		this.username = username;
		this.category = category;
		this.title = title;
		this.content = content;
		this.image = image;
		this.price = price;
		this.phone = phone;
		this.calltime = calltime;
		this.deal = deal;
		this.concat = concat;
		this.sold = sold;
		this.urgency = urgency;
		this.location = location;
		this.viewcnt = viewcnt;
		this.createdtime = createdtime;
		this.updatedtime = updatedtime;
	}

    
    public BuyPostDTO(int usernumber, String username, String category,
            String title, String content, String image, int price,
            String phone, String calltime, String concat,
            String sold, String urgency, String location) {
		this.usernumber = usernumber;
		this.username = username;
		this.category = category;
		this.title = title;
		this.content = content;
		this.image = image;
		this.price = price;
		this.setPhone(phone);
		this.setCalltime(calltime);
		this.setConcat(concat);
		this.sold = sold;
		this.setUrgency(urgency);
		this.location = location;
		}

    public BuyPostDTO() {}

	

	
}