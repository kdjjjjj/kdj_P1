package ez.en.page.camping_thema;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ThemaDAOImpl implements ThemaDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String namespace = "ez.en.page.themaMapper.";
	
	@Override
	public ThemaDTO selectOne(String thema_code) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+"selectOne", thema_code);
	}

	@Override
	public List<ThemaDTO> list() {
		return sqlsession.selectList(namespace+"list");
	}

}
