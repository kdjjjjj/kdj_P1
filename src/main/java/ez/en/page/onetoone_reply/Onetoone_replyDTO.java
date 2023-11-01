package ez.en.page.onetoone_reply;

public class Onetoone_replyDTO {
	
	private int rp_code; 
	private int o_code;
	private String id;
	private String f_code; 
	private String rp_content;
	private int rp_depth;
	private String rp_w_date;
	
	public Onetoone_replyDTO() {}

	public int getRp_code() {
		return rp_code;
	}

	public void setRp_code(int rp_code) {
		this.rp_code = rp_code;
	}

	public int getO_code() {
		return o_code;
	}

	public void setO_code(int o_code) {
		this.o_code = o_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getF_code() {
		return f_code;
	}

	public void setF_code(String f_code) {
		this.f_code = f_code;
	}

	public String getRp_content() {
		return rp_content;
	}

	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}

	public int getRp_depth() {
		return rp_depth;
	}

	public void setRp_depth(int rp_depth) {
		this.rp_depth = rp_depth;
	}

	public String getRp_w_date() {
		return rp_w_date;
	}

	public void setRp_w_date(String rp_w_date) {
		this.rp_w_date = rp_w_date;
	}

	@Override
	public String toString() {
		return "Onetoone_replyDTO [rp_code=" + rp_code + ", o_code=" + o_code + ", id=" + id + ", f_code=" + f_code
				+ ", rp_content=" + rp_content + ", rp_depth=" + rp_depth + ", rp_w_date=" + rp_w_date + "]";
	}

	
}
