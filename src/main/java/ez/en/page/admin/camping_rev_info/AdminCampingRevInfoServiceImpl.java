package ez.en.page.admin.camping_rev_info;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AdminCampingRevInfoServiceImpl implements AdminCampingRevInfoService {
	
	@Inject
	private AdminCampingRevInfoDAO adminCampingRevInfoDAO;

	
	//캠핑장 예약정보 조회
	@Override
	public List<AdminCampingRevInfoDTO> select(String cam_code) {
		return adminCampingRevInfoDAO.select(cam_code);
	}


	@Override
	public void insert(AdminCampingRevInfoDTO adminCampingRevInfoDTO) {
		adminCampingRevInfoDAO.insert(adminCampingRevInfoDTO);
	}


	@Override
	public void update(Map<String, Object> map) {
		adminCampingRevInfoDAO.update(map);
	}


	@Override
	public void delete(String cri_area_code) {
		adminCampingRevInfoDAO.delete(cri_area_code);
	}


	@Override
	public List<AdminCampingRevInfoDTO> selectAll() {
		return adminCampingRevInfoDAO.selectAll();
	}


	@Override
	public AdminCampingRevInfoDTO selectArea(String cri_area_code) {
		return adminCampingRevInfoDAO.selectArea(cri_area_code);
	}
	
	
}
