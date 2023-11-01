package ez.en.page.review_recommend;

public class Review_recommendDTO {
	
	private int rr_num;
	private String id;
	private String r_code; 
	private int is_recommend;
	
	public Review_recommendDTO() {}

	public int getRr_num() {
		return rr_num;
	}

	public void setRr_num(int rr_num) {
		this.rr_num = rr_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public int getIs_recommend() {
		return is_recommend;
	}

	public void setIs_recommend(int is_recommend) {
		this.is_recommend = is_recommend;
	}

	@Override
	public String toString() {
		return "Review_recommendDTO [rr_num=" + rr_num + ", id=" + id + ", r_code=" + r_code + ", is_recommend="
				+ is_recommend + "]";
	}
	
	

}
