/**
 * cam_code varchar(30) PK 
region_code varchar(10) 
f_code varchar(300) 
cam_name varchar(40) 
cam_address varchar(100) 
cam_tel varchar(50) 
cam_start_time varchar(30) 
cam_finish_time varchar(30) 
thema_code varchar(1000) 
option_code varchar(1000) 
cam_hide varchar(1) 
cam_regdate varchar(45)
 */

package ez.en.page.admin.camping;

public class AdminCampingDTO {
	private String cam_code;
	private String region_code;
	private String f_code;
	private String cam_name;
	private String cam_address;
	private String cam_tel;
	private String cam_start_time;
	private String cam_finish_time;
	private String thema_code;
	private String option_code;
	private char cam_hide;
	private String cam_regdate;
	private String cam_modifydate;	//구현 안됨
//	private String thema_name;
//	private String option_name;
	
	public AdminCampingDTO() {}

	

//	public CampingDTO(String cam_code, String region_code, String f_code, String cam_name, String cam_address,
//			String cam_tel, String cam_start_time, String cam_finish_time, String thema_code, String option_code,
//			char cam_hide, String cam_regdate, String thema_name, String option_name) {
//		super();
//		this.cam_code = cam_code;
//		this.region_code = region_code;
//		this.f_code = f_code;
//		this.cam_name = cam_name;
//		this.cam_address = cam_address;
//		this.cam_tel = cam_tel;
//		this.cam_start_time = cam_start_time;
//		this.cam_finish_time = cam_finish_time;
//		this.thema_code = thema_code;
//		this.option_code = option_code;
//		this.cam_hide = cam_hide;
//		this.cam_regdate = cam_regdate;
//		this.thema_name = thema_name;
//		this.option_name = option_name;
//	}
//	
	

	public AdminCampingDTO(String cam_code, String region_code, String f_code, String cam_name, String cam_address,
			String cam_tel, String cam_start_time, String cam_finish_time, String thema_code, String option_code,
			char cam_hide, String cam_regdate) {
		super();
		this.cam_code = cam_code;
		this.region_code = region_code;
		this.f_code = f_code;
		this.cam_name = cam_name;
		this.cam_address = cam_address;
		this.cam_tel = cam_tel;
		this.cam_start_time = cam_start_time;
		this.cam_finish_time = cam_finish_time;
		this.thema_code = thema_code;
		this.option_code = option_code;
		this.cam_hide = cam_hide;
		this.cam_regdate = cam_regdate;
	}



	public String getCam_code() {
		return cam_code;
	}

	public void setCam_code(String cam_code) {
		this.cam_code = cam_code;
	}

	public String getRegion_code() {
		return region_code;
	}

	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}

	public String getF_code() {
		return f_code;
	}

	public void setF_code(String f_code) {
		this.f_code = f_code;
	}

	public String getCam_name() {
		return cam_name;
	}

	public void setCam_name(String cam_name) {
		this.cam_name = cam_name;
	}

	public String getCam_address() {
		return cam_address;
	}

	public void setCam_address(String cam_address) {
		this.cam_address = cam_address;
	}

	public String getCam_tel() {
		return cam_tel;
	}

	public void setCam_tel(String cam_tel) {
		this.cam_tel = cam_tel;
	}

	public String getCam_start_time() {
		return cam_start_time;
	}

	public void setCam_start_time(String cam_start_time) {
		this.cam_start_time = cam_start_time;
	}

	public String getCam_finish_time() {
		return cam_finish_time;
	}

	public void setCam_finish_time(String cam_finish_time) {
		this.cam_finish_time = cam_finish_time;
	}

	public String getThema_code() {
		return thema_code;
	}

	public void setThema_code(String thema_code) {
		this.thema_code = thema_code;
	}

	public String getOption_code() {
		return option_code;
	}

	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}

	public char getCam_hide() {
		return cam_hide;
	}

	public void setCam_hide(char cam_hide) {
		this.cam_hide = cam_hide;
	}

	public String getCam_regdate() {
		return cam_regdate;
	}

	public void setCam_regdate(String cam_regdate) {
		this.cam_regdate = cam_regdate;
	}
	
	



	public String getCam_modifydate() {
		return cam_modifydate;
	}



	public void setCam_modifydate(String cam_modifydate) {
		this.cam_modifydate = cam_modifydate;
	}



	@Override
	public String toString() {
		return "CampingDTO [cam_code=" + cam_code + ", region_code=" + region_code + ", f_code=" + f_code
				+ ", cam_name=" + cam_name + ", cam_address=" + cam_address + ", cam_tel=" + cam_tel
				+ ", cam_start_time=" + cam_start_time + ", cam_finish_time=" + cam_finish_time + ", thema_code="
				+ thema_code + ", option_code=" + option_code + ", cam_hide=" + cam_hide + ", cam_regdate="
				+ cam_regdate + "]";
	}
	
	

//	public String getThema_name() {
//		return thema_name;
//	}
//
//
//
//	public void setThema_name(String thema_name) {
//		this.thema_name = thema_name;
//	}
//
//
//
//	public String getOption_name() {
//		return option_name;
//	}
//
//
//
//	public void setOption_name(String option_name) {
//		this.option_name = option_name;
//	}



//	@Override
//	public String toString() {
//		return "CampingDTO [cam_code=" + cam_code + ", region_code=" + region_code + ", f_code=" + f_code
//				+ ", cam_name=" + cam_name + ", cam_address=" + cam_address + ", cam_tel=" + cam_tel
//				+ ", cam_start_time=" + cam_start_time + ", cam_finish_time=" + cam_finish_time + ", thema_code="
//				+ thema_code + ", option_code=" + option_code + ", cam_hide=" + cam_hide + ", cam_regdate="
//				+ cam_regdate + ", thema_name=" + thema_name + ", option_name=" + option_name + "]";
//	}
	
	


	
	
}
