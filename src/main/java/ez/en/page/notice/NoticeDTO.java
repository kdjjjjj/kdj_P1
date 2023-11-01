package ez.en.page.notice;

public class NoticeDTO {
	
	private int n_code; 
	private String f_code;
	private String n_title; 
	private String n_content; 
	private String n_w_date;
	private String n_writer;
	
	public NoticeDTO() {}

	public int getN_code() {
		return n_code;
	}

	public void setN_code(int n_code) {
		this.n_code = n_code;
	}

	public String getF_code() {
		return f_code;
	}

	public void setF_code(String f_code) {
		this.f_code = f_code;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_w_date() {
		return n_w_date;
	}

	public void setN_w_date(String n_w_date) {
		this.n_w_date = n_w_date;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	@Override
	public String toString() {
		return "NoticeDTO [n_code=" + n_code + ", f_code=" + f_code + ", n_title=" + n_title + ", n_content="
				+ n_content + ", n_w_date=" + n_w_date + ", n_writer=" + n_writer + "]";
	}
	
	
}
