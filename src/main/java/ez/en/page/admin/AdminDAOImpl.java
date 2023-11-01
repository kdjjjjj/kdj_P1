package ez.en.page.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ez.en.page.domain.Criteria;
import ez.en.page.user.UserDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NS = "ez.en.page.adminMapper.";
	
	@Override
	public UserDTO adminLogin(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"adminLogin", dto);
	}
	
	@Override
	public List<UserDTO> userList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+"userList", cri);
	}
	
	@Override
	public int userCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"userCount");
	}
	
	@Override
	public List<UserDTO> search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+"search", map);
	}

	@Override
	public int searchCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"searchCount", map);
	}
	
	@Override
	public int userStop(List<String> userList) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS+"userStop", userList);
	}
}
