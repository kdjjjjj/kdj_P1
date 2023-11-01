package ez.en.page.community_like;

public class Community_likeDTO {
	
	private int l_code; 
	private int is_like;
	
	public Community_likeDTO() {}

	public int getL_code() {
		return l_code;
	}

	public void setL_code(int l_code) {
		this.l_code = l_code;
	}

	public int getIs_like() {
		return is_like;
	}

	public void setIs_like(int is_like) {
		this.is_like = is_like;
	}

	@Override
	public String toString() {
		return "Community_likeDTO [l_code=" + l_code + ", is_like=" + is_like + "]";
	}
	
	

}
