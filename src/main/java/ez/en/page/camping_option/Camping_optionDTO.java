package ez.en.page.camping_option;

public class Camping_optionDTO {
	
	private String option_code; 
	private String option_name;

	public Camping_optionDTO() {}

	public String getOption_code() {
		return option_code;
	}

	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	@Override
	public String toString() {
		return "Camping_optionDTO [option_code=" + option_code + ", option_name=" + option_name + "]";
	}
	
	
	
}
