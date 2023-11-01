package ez.en.page.jjim;


public class JjimDTO {
	
	private String cam_name;
	private int j_num;
	private String cam_code; 
	private String id;
	private int is_jjim;
	
	public JjimDTO() {}
	
	public String getCam_name() {
		return cam_name;
	}

	public void setCam_name(String cam_name) {
		this.cam_name = cam_name;
	}

	public int getJ_num() {
		return j_num;
	}

	public void setJ_num(int j_num) {
		this.j_num = j_num;
	}

	public String getCam_code() {
		return cam_code;
	}

	public void setCam_code(String cam_code) {
		this.cam_code = cam_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getIs_jjim() {
		return is_jjim;
	}

	public void setIs_jjim(int is_jjim) {
		this.is_jjim = is_jjim;
	}

	@Override
	public String toString() {
		return "JjimDTO [j_num=" + j_num + ", cam_code=" + cam_code + ", id=" + id + ", is_jjim=" + is_jjim + "]";
	}
	
	

}
