package ez.en.page.camping_area;

public class Camping_areaDTO {
	
	private String area_code; 
	private String area_name;
    
	public Camping_areaDTO() {}

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	@Override
	public String toString() {
		return "Camping_areaDTO [area_code=" + area_code + ", area_name=" + area_name + "]";
	}
	
	
	
}
