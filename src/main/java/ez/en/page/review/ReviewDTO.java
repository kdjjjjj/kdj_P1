package ez.en.page.review;

public class ReviewDTO {
	
	private String r_code;		//리뷰글번호(PK)
	private String id;			//회원아이디(FK)
	private String rev_code; 	//예약코드(FK)
	private String f_code;		//파일코드(FK)
	private String r_w_date;	//작성날짜
	private String r_content;	//내용
	private int r_star;			//별점
	private int r_declaration;	//신고수
	private int r_lockpwd;		//잠금여부
	
	public ReviewDTO() {}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRev_code() {
		return rev_code;
	}

	public void setRev_code(String rev_code) {
		this.rev_code = rev_code;
	}

	public String getF_code() {
		return f_code;
	}

	public void setF_code(String f_code) {
		this.f_code = f_code;
	}

	public String getR_w_date() {
		return r_w_date;
	}

	public void setR_w_date(String r_w_date) {
		this.r_w_date = r_w_date;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_star() {
		return r_star;
	}

	public void setR_star(int r_star) {
		this.r_star = r_star;
	}


	public int getR_declaration() {
		return r_declaration;
	}

	public void setR_declaration(int r_declaration) {
		this.r_declaration = r_declaration;
	}

	public int getR_lockpwd() {
		return r_lockpwd;
	}

	public void setR_lockpwd(int r_lockpwd) {
		this.r_lockpwd = r_lockpwd;
	}

	@Override
	public String toString() {
		return "ReviewDTO [r_code=" + r_code + ", id=" + id + ", rev_code=" + rev_code + ", f_code=" + f_code
				+ ", r_w_date=" + r_w_date + ", r_content=" + r_content + ", r_star=" + r_star + ", r_declaration=" + r_declaration + ", r_lockpwd=" + r_lockpwd + "]";
	}
	
	

}
