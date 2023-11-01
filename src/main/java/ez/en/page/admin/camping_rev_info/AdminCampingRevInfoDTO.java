/**
 * cri_area_code varchar(30) PK 
cam_code varchar(30) 
cri_max int 
cri_price int
 */
package ez.en.page.admin.camping_rev_info;

public class AdminCampingRevInfoDTO {
	private String cri_area_code;
	private String cam_code;
	private int cri_max;
	private int cri_price;
//	private String cri_check;
	
	public AdminCampingRevInfoDTO() {}
	


	public AdminCampingRevInfoDTO(String cri_area_code, String cam_code, int cri_max, int cri_price) {
		super();
		this.cri_area_code = cri_area_code;
		this.cam_code = cam_code;
		this.cri_max = cri_max;
		this.cri_price = cri_price;
	}




	public String getCri_area_code() {
		return cri_area_code;
	}



	public void setCri_area_code(String cri_area_code) {
		this.cri_area_code = cri_area_code;
	}



	public String getCam_code() {
		return cam_code;
	}



	public void setCam_code(String cam_code) {
		this.cam_code = cam_code;
	}



	public int getCri_max() {
		return cri_max;
	}



	public void setCri_max(int cri_max) {
		this.cri_max = cri_max;
	}



	public int getCri_price() {
		return cri_price;
	}



	public void setCri_price(int cri_price) {
		this.cri_price = cri_price;
	}



	@Override
	public String toString() {
		return "CampingRevInfoDTO [cri_area_code=" + cri_area_code + ", cam_code=" + cam_code + ", cri_max=" + cri_max
				+ ", cri_price=" + cri_price +  "]";
	}



	
	
	
	


}
