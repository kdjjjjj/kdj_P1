package ez.en.page.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	@Override
	public UserDTO login(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public String idchk(String id) {
		// TODO Auto-generated method stub
		return dao.idchk(id);
	}
	
	@Override
	public String nickchk(String nick) {
		// TODO Auto-generated method stub
		return dao.nickchk(nick);
	}
	
	@Override
	public int signup(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.signup(dto);
	}
	
	@Override
	public String idFind(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.idFind(dto);
	}
	
	@Override
	public String pwFind(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.pwFind(dto);
	}
	
	@Override
	public int pwFind2(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.pwFind2(dto);
	}
	
	@Override
	public int pwchange(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.pwchange(dto);
	}
	

	

	

	

}
