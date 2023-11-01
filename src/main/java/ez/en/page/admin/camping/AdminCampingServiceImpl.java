package ez.en.page.admin.camping;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ez.en.page.domain.Criteria;
import ez.en.page.domain.SearchCriteria;

@Service
public class AdminCampingServiceImpl implements AdminCampingService {

	@Inject
	private AdminCampingDAO campingDAO;
	
	//캠핑장 등록
	@Override
	public void register(AdminCampingDTO adminCampingDTO) {
		campingDAO.register(adminCampingDTO);
	}
	
	//캠핑장 수정
	@Override
	public void modify(AdminCampingDTO adminCampingDTO) {
		campingDAO.modify(adminCampingDTO);
	}

	//캠핑장 삭제
	@Override
	public void remove(String cam_code) {
		campingDAO.remove(cam_code);
	}

	//캠핑장 전체 목록
	@Override
	public List<AdminCampingDTO> list() {
		return campingDAO.list();
	}

	//캠핑장 상세페이지
	@Override
	public AdminCampingDTO detail(String cam_code) {
		return campingDAO.detail(cam_code);
	}

	@Override
	public List<AdminCampingDTO> listCriteria(Criteria cri) throws Exception {
		return campingDAO.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return campingDAO.countPaging(cri);
	}

	@Override
	public List<AdminCampingDTO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return campingDAO.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return campingDAO.listSearchCount(cri);
	}

//	//캠핑장 예약 정보
//	@Override
//	public Map selectAll(Map<String, Object> map) {
//		return campingDAO.selectAll(map);
//	}

}
