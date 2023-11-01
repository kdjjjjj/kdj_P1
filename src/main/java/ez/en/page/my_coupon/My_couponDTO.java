package ez.en.page.my_coupon;

public class My_couponDTO {
	
	private int cp_num; 
	private String cp_code; 
	private String id; 
	private int use_coupon;
	
	public My_couponDTO() {}

	public int getCp_num() {
		return cp_num;
	}

	public void setCp_num(int cp_num) {
		this.cp_num = cp_num;
	}

	public String getCp_code() {
		return cp_code;
	}

	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUse_coupon() {
		return use_coupon;
	}

	public void setUse_coupon(int use_coupon) {
		this.use_coupon = use_coupon;
	}

	@Override
	public String toString() {
		return "My_couponDTO [cp_num=" + cp_num + ", cp_code=" + cp_code + ", id=" + id + ", use_coupon=" + use_coupon
				+ "]";
	}
	
	

}
