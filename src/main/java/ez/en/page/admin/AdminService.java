package ez.en.page.admin;

import java.util.List;
import java.util.Map;

import ez.en.page.domain.Criteria;
import ez.en.page.user.UserDTO;

public interface AdminService {
	
	public UserDTO adminLogin(UserDTO dto);
	
	public List<UserDTO> userList(Criteria cri);
	
	public int userCount();
	
	public List<UserDTO> search(Map<String, Object> map);
	
	public int searchCount(Map<String, Object> map);
	
	public int userStop(List<String> userList);
	
}
