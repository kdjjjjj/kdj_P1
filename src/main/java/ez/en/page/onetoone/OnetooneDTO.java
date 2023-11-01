package ez.en.page.onetoone;

public class OnetooneDTO {

	private int o_code;
	private String id;
	private String f_code;
	private String o_title;
	private String o_content;
	private String o_w_date;

	public OnetooneDTO() {
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

	public String getO_title() {
		return o_title;
	}

	public void setO_title(String o_title) {
		this.o_title = o_title;
	}

	public String getO_content() {
		return o_content;
	}

	public void setO_content(String o_content) {
		this.o_content = o_content;
	}

	public String getO_w_date() {
		return o_w_date;
	}

	public void setO_w_date(String o_w_date) {
		this.o_w_date = o_w_date;
	}

	@Override
	public String toString() {
		return "OnetooneDTO [o_code=" + o_code + ", id=" + id + ", f_code=" + f_code + ", o_title=" + o_title
				+ ", o_content=" + o_content + ", o_w_date=" + o_w_date + "]";
	}
	
}
