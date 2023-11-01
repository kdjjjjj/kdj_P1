package ez.en.page.camping_rev_info;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CampingRevInfoDAOImpl implements CampingRevInfoDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "ez.en.page.camping_rev_infoMapper.";
	
	
	//캠핑장 예약정보 조회
	@Override
	public List<CampingRevInfoDTO> select(String cam_code) {
		return sqlSession.selectList(namespace+"select", cam_code);
	}
	
//	@Override
//	public List<CampingRevInfoDTO> selectOne(String cam_code) {
//		return sqlSession.selectOne(namespace+"selectOne", cam_code);
//	}

}
