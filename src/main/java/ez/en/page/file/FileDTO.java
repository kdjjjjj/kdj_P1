package ez.en.page.file;

public class FileDTO {
	
	private String f_code;
	private String f_realroot;
	private String f_root;
	private String f_name;
                         
	
	public FileDTO() {}


	public String getF_code() {
		return f_code;
	}


	public void setF_code(String f_code) {
		this.f_code = f_code;
	}


	public String getF_root() {
		return f_root;
	}


	public void setF_root(String f_root) {
		this.f_root = f_root;
	}


	public String getF_name() {
		return f_name;
	}


	public void setF_name(String f_name) {
		this.f_name = f_name;
	}


	public String getF_realroot() {
		return f_realroot;
	}


	public void setF_realroot(String f_realroot) {
		this.f_realroot = f_realroot;
	}


	@Override
	public String toString() {
		return "FileDTO [f_code=" + f_code + ", f_root=" + f_root + ", f_name=" + f_name + ", f_realroot=" + f_realroot + "]";
	}


	
}
