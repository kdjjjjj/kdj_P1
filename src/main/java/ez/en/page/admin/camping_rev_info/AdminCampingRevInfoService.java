package ez.en.page.admin.camping_rev_info;

import java.util.List;
import java.util.Map;

public interface AdminCampingRevInfoService {
	
	//캠핑장 예약정보 추가(admin)
	public void insert(AdminCampingRevInfoDTO adminCampingRevInfoDTO);
	
	//캠핑장 예약정보 수정(admin)
	public void update(Map<String, Object> map);
	
	//캠핑장 예약정보 삭제(admin)
	public void delete(String cri_area_code);
	
	//캠핑장 예약정보 조회
	public List<AdminCampingRevInfoDTO> select(String cam_code);
	
	//캠핑장 예약정보 조회(구역 -수정,삭제용)
	public AdminCampingRevInfoDTO selectArea(String cri_area_code);
	
	//캠핑장 예약 정보 전체 조회
	public List<AdminCampingRevInfoDTO> selectAll();


}
