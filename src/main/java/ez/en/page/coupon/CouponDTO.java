package ez.en.page.coupon;

public class CouponDTO {
	
	private int use_coupon;
	private String cp_code; 
	private String cp_name; 
	private String cp_content; 
	private int cp_amount;
	private int cp_sale;
	private String cp_start_date; 
	private String cp_end_date;

	public CouponDTO() {}

	public int getUse_coupon() {
		return use_coupon;
	}

	public void setUse_coupon(int use_coupon) {
		this.use_coupon = use_coupon;
	}

	public String getCp_code() {
		return cp_code;
	}

	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getCp_content() {
		return cp_content;
	}

	public void setCp_content(String cp_content) {
		this.cp_content = cp_content;
	}

	public int getCp_amount() {
		return cp_amount;
	}

	public void setCp_amount(int cp_amount) {
		this.cp_amount = cp_amount;
	}

	public int getCp_sale() {
		return cp_sale;
	}

	public void setCp_sale(int cp_sale) {
		this.cp_sale = cp_sale;
	}

	public String getCp_start_date() {
		return cp_start_date;
	}

	public void setCp_start_date(String cp_start_date) {
		this.cp_start_date = cp_start_date;
	}

	public String getCp_end_date() {
		return cp_end_date;
	}

	public void setCp_end_date(String cp_end_date) {
		this.cp_end_date = cp_end_date;
	}

	@Override
	public String toString() {
		return "CouponDTO [cp_code=" + cp_code + ", cp_name=" + cp_name + ", cp_content=" + cp_content + ", cp_amount="
				+ cp_amount + ", cp_sale=" + cp_sale + ", cp_start_date=" + cp_start_date + ", cp_end_date="
				+ cp_end_date + "]";
	}
	
	
}
