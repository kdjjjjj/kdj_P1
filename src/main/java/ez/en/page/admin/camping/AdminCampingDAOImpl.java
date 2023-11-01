package ez.en.page.admin.camping;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ez.en.page.domain.Criteria;
import ez.en.page.domain.SearchCriteria;

@Repository
public class AdminCampingDAOImpl implements AdminCampingDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "ez.en.page.adminCampingMapper.";
	
	//캠핑장 등록
	@Override
	public void register(AdminCampingDTO adminCampingDTO) {
		sqlSession.insert(namespace+"register", adminCampingDTO);
	}

	//캠핑장 수정
	@Override
	public void modify(AdminCampingDTO adminCampingDTO) {
		sqlSession.update(namespace+"modify", adminCampingDTO);
	}

	//캠핑장 삭제
	@Override
	public void remove(String cam_code) {
		sqlSession.delete(namespace+"remove", cam_code);
	}

	//캠핑장 전체 조회
	@Override
	public List<AdminCampingDTO> list() {
		return sqlSession.selectList(namespace+"list");
	}

	//캠핑장 상세페이지
	@Override
	public AdminCampingDTO detail(String cam_code) {
		return sqlSession.selectOne(namespace+"detail", cam_code);
	}

	@Override
	public List<AdminCampingDTO> listPage(int page) throws Exception {
		if(page<=0) {
			page=1;
		}
		page=(page-1) * 10;
		
		return sqlSession.selectList(namespace+"listPage", page);
	}

	@Override
	public List<AdminCampingDTO> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"countPaging", cri);
	}

	@Override
	public List<AdminCampingDTO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"listSearchCount", cri);
	}

//	//캠핑장 예약정보
//	@Override
//	public Map selectAll(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
