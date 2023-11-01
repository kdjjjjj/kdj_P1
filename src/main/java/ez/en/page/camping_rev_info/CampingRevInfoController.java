package ez.en.page.camping_rev_info;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ez.en.page.camping.CampingController;


@Controller
@RequestMapping("/scamping/*") //c_revinfo
public class CampingRevInfoController {
	@Inject
	private CampingRevInfoService campingRevInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(CampingController.class);
	
	//캠핑장 예약정보 추가(admin)
	
	//캠핑장 예약정보 수정(admin)
	
	//캠핑장 예약정보 조회
//	@GetMapping("/c_revinfo")
//	public void c_revinfo(@RequestParam("cam_code") String cam_code, 
//			@ModelAttribute("cri") SearchCriteria cri, Model model,
//			HttpServletRequest request) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		logger.info("ㅇ야야야 ================== cam_code:"+ cam_code);
//		model.addAttribute("c_revinfo", campingRevInfoService.select(cam_code));
//	}
	
	@GetMapping("/c_revinfo")
	public String c_revinfo(@RequestParam("cam_code") String cam_code, Model model, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		logger.info("나와라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ" + cam_code);
//		model.addAttribute("c_revinfo", campingRevInfoService.select(cam_code));
		logger.info("리스트 정보 : "+ campingRevInfoService.select(cam_code));
		List<CampingRevInfoDTO> list = campingRevInfoService.select(cam_code);
		logger.info(list.get(0).getCam_code());
		model.addAttribute("c_revinfo", list);
		return "scamping/c_revinfo";
//		return null;
	}
	

//	

	
	

}
