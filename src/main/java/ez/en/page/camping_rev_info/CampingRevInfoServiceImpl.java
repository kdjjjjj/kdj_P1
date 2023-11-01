package ez.en.page.camping_rev_info;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CampingRevInfoServiceImpl implements CampingRevInfoService {
	
	@Inject
	private CampingRevInfoDAO campingRevInfoDAO;

	
	//캠핑장 예약정보 조회
	@Override
	public List<CampingRevInfoDTO> select(String cam_code) {
		return campingRevInfoDAO.select(cam_code);
	}
	
	
}
