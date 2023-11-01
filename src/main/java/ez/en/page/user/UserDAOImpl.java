package ez.en.page.user;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NS = "ez.en.page.userMapper.";
	
	@Override
	public UserDTO login(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"login", dto);
	}

	@Override
	public String idchk(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"idchk", id);
	}
	
	@Override
	public String nickchk(String nick) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"nickchk", nick);
	}
	
	@Override
	public int signup(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NS+"signup", dto);
	}
	
	@Override
	public String idFind(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"idFind", dto);
	}
	
	@Override
	public String pwFind(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"pwFind", dto);
	}
	
	@Override
	public int pwFind2(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"pwFind2", dto);
	}
	
	@Override
	public int pwchange(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS+"pwchange", dto);
	}
	

	

	

	

	

	

	

	

}
