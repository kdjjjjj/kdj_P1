package ez.en.page.community;

public class CommunityDTO {
	
	private int c_code;
	private String c_title;
	private String c_content;
	private int c_cnt; 
	private int c_declaration;
	private double c_scope;
	private int c_like;
	
	public CommunityDTO() {}

	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public int getC_cnt() {
		return c_cnt;
	}

	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
	}

	public int getC_declaration() {
		return c_declaration;
	}

	public void setC_declaration(int c_declaration) {
		this.c_declaration = c_declaration;
	}

	public double getC_scope() {
		return c_scope;
	}

	public void setC_scope(double c_scope) {
		this.c_scope = c_scope;
	}

	public int getC_like() {
		return c_like;
	}

	public void setC_like(int c_like) {
		this.c_like = c_like;
	}

	@Override
	public String toString() {
		return "CommunityDTO [c_code=" + c_code + ", c_title=" + c_title + ", c_content=" + c_content + ", c_cnt="
				+ c_cnt + ", c_declaration=" + c_declaration + ", c_scope=" + c_scope + ", c_like=" + c_like + "]";
	}
	
	

}
