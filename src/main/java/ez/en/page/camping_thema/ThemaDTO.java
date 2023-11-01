/**
 * thema_code varchar(10) PK 
thema_name varchar(50) 
thema_hide varchar(1)
 */
package ez.en.page.camping_thema;

public class ThemaDTO {
	private String thema_code;
	private String thema_name;
	private char thema_hide;
	
	public ThemaDTO() {}
	
	public ThemaDTO(String thema_code, String thema_name, char thema_hide) {
		super();
		this.thema_code = thema_code;
		this.thema_name = thema_name;
		this.thema_hide = thema_hide;
	}

	public String getThema_code() {
		return thema_code;
	}

	public void setThema_code(String thema_code) {
		this.thema_code = thema_code;
	}

	public String getThema_name() {
		return thema_name;
	}

	public void setThema_name(String thema_name) {
		this.thema_name = thema_name;
	}

	public char getThema_hide() {
		return thema_hide;
	}

	public void setThema_hide(char thema_hide) {
		this.thema_hide = thema_hide;
	}

	@Override
	public String toString() {
		return "ThemaDTO [thema_code=" + thema_code + ", thema_name=" + thema_name + ", thema_hide=" + thema_hide + "]";
	}
	
	
	

}
