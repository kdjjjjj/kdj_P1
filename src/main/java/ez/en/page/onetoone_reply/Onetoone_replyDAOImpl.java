package ez.en.page.onetoone_reply;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Onetoone_replyDAOImpl implements Onetoone_replyDAO {
	private static final String namespace = "ez.en.page.onetoone_replyMapper.";

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<Onetoone_replyDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + "list2");
	}

	@Override
	public Onetoone_replyDTO selectOne2(int rp_code) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + "selectOne2", rp_code);
	}

	@Override
	public int insert2(Onetoone_replyDTO rdto) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace + "insert2", rdto);
	}

	@Override
	public int update2(Onetoone_replyDTO rdto) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + "update2", rdto);
	}

	@Override
	public int delete2(int rp_code) {
		// TODO Auto-generated method stub
		return sqlsession.delete(namespace + "delete2", rp_code);
	}
}

