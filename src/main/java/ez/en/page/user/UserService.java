package ez.en.page.user;

import java.util.Map;

public interface UserService {

	public UserDTO login(UserDTO dto);
	
	public int signup(UserDTO dto);
	
	public String idchk(String id);
	
	public String nickchk(String nick);
	
	public String idFind(UserDTO dto);
	
	public String pwFind(UserDTO dto);
	
	public int pwFind2(UserDTO dto);
	
	public int pwchange(UserDTO dto);
	
}
