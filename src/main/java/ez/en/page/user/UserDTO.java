package ez.en.page.user;

public class UserDTO {

	private String id; 
	private String f_code; 
	private String pw;
	private String name; 
	private String nick; 
	private String birth; 
	private String phone;
	private String email;
	private int stop;
	private int admin;
	
	public UserDTO() {
		// TODO Auto-generated constructor stub
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStop() {
		return stop;
	}

	public void setStop(int stop) {
		this.stop = stop;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", f_code=" + f_code + ", pw=" + pw + ", name=" + name + ", nick=" + nick
				+ ", birth=" + birth + ", phone=" + phone + ", email=" + email + ", stop=" + stop + ", admin=" + admin
				+ "]";
	}
	
}
