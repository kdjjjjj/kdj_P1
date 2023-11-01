package ez.en.page.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ez.en.page.domain.Criteria;
import ez.en.page.user.UserDTO;

@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	private AdminDAO dao;
	
	@Override
	public UserDTO adminLogin(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.adminLogin(dto);
	}
	
	@Override
	public List<UserDTO> userList(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.userList(cri);
	}
	
	@Override
	public int userCount() {
		// TODO Auto-generated method stub
		return dao.userCount();
	}
	
	@Override
	public List<UserDTO> search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.search(map);
	}

	@Override
	public int searchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchCount(map);
	}
	
	@Override
	public int userStop(List<String> userList) {
		// TODO Auto-generated method stub
		return dao.userStop(userList);
	}


}
