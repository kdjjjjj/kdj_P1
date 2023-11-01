package ez.en.page.camping_rev_info;

import java.util.List;

public interface CampingRevInfoService {

	//캠핑장 예약정보 추가(admin)
	
	//캠핑장 예약정보 수정(admin)
	
	//캠핑장 예약정보 조회
	
	public List<CampingRevInfoDTO> select(String cam_code);
}
