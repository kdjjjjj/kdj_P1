package ez.en.page.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	private static final String namespace = "ez.en.page.noticeMapper.";

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<NoticeDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + "list");
	}

	@Override
	public int insert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace + "insert", dto);
	}

	@Override
	public int update(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + "update", dto);
	}

	@Override
	public NoticeDTO selectOne(int n_code) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + "selectOne",n_code);
	}

	@Override
	public int delete(int n_code) {
		// TODO Auto-generated method stub
		return sqlsession.delete(namespace + "delete",n_code);
	}

}
