package ez.en.page.reservation;

public class ReservationDTO {
	
	private String rev_code;       
	private String id;             
	private String cri_area_code;  
	private String rev_start_date; 
	private String rev_finish_date;
	
	public ReservationDTO() {}

	public String getRev_code() {
		return rev_code;
	}

	public void setRev_code(String rev_code) {
		this.rev_code = rev_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCri_area_code() {
		return cri_area_code;
	}

	public void setCri_area_code(String cri_area_code) {
		this.cri_area_code = cri_area_code;
	}

	public String getRev_start_date() {
		return rev_start_date;
	}

	public void setRev_start_date(String rev_start_date) {
		this.rev_start_date = rev_start_date;
	}

	public String getRev_finish_date() {
		return rev_finish_date;
	}

	public void setRev_finish_date(String rev_finish_date) {
		this.rev_finish_date = rev_finish_date;
	}

	@Override
	public String toString() {
		return "ReservationDTO [rev_code=" + rev_code + ", id=" + id + ", cri_area_code=" + cri_area_code
				+ ", rev_start_date=" + rev_start_date + ", rev_finish_date=" + rev_finish_date + "]";
	}
	
	

}
