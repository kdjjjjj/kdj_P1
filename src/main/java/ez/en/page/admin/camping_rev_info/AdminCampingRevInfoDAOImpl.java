package ez.en.page.admin.camping_rev_info;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCampingRevInfoDAOImpl implements AdminCampingRevInfoDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "ez.en.page.admincamping_rev_infoMapper.";
	
	
	//캠핑장 예약정보 조회
	@Override
	public List<AdminCampingRevInfoDTO> select(String cam_code) {
		return sqlSession.selectList(namespace+"select", cam_code);
	}


	@Override
	public void insert(AdminCampingRevInfoDTO adminCampingRevInfoDTO) {
		sqlSession.insert(namespace+"insert", adminCampingRevInfoDTO);
	}


	@Override
	public void update(Map<String, Object> map) {
		sqlSession.update(namespace+"update", map);
	}


	@Override
	public void delete(String cri_area_code) {
		sqlSession.delete(namespace+"delete", cri_area_code);
	}


	@Override
	public List<AdminCampingRevInfoDTO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}


	@Override
	public AdminCampingRevInfoDTO selectArea(String cri_area_code) {
		return sqlSession.selectOne(namespace+"selectArea", cri_area_code);
	}

}
