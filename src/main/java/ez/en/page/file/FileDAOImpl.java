package ez.en.page.file;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl implements FileDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NS = "ez.en.page.fileMapper.";
	
	@Override
	public int fileupload(FileDTO dto) {
		return sqlSession.insert(NS+"fileupload", dto);
	}

	@Override
	public Map<String, Object> myprofile(String id) {
		return sqlSession.selectOne(NS+"myprofile", id);
	}
	
}
