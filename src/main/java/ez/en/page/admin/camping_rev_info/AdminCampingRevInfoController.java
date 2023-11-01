package ez.en.page.admin.camping_rev_info;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ez.en.page.camping_rev_info.CampingRevInfoDTO;



@Controller
@RequestMapping("/admin/campingrevinfo/*") //admin->campingrevinfo
public class AdminCampingRevInfoController {
	@Inject
	private AdminCampingRevInfoService adminCampingRevInfoService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminCampingRevInfoController.class);
	
//		캠핑장 예약정보 추가 (admin)
	@GetMapping("/insert")
	public void insertGET(@RequestParam("cam_code")String cam_code, AdminCampingRevInfoDTO adminCampingRevInfoDTO, Model model) throws Exception {
		logger.info("insert GET ====================> ");
		logger.info("adminCampingRevInfoDTO : " + adminCampingRevInfoDTO);
		
		model.addAttribute("ac_revinfo", adminCampingRevInfoDTO);
		model.addAttribute("cam_code", cam_code);
	}
	
	@PostMapping("/insert")
	public String insertPOST(@RequestParam("cam_code")String cam_code,Model model, AdminCampingRevInfoDTO adminCampingRevInfoDTO, RedirectAttributes rttr) throws Exception {
		
		logger.info("insert POST ===================>");
		logger.info(adminCampingRevInfoDTO.toString());
		
		adminCampingRevInfoService.insert(adminCampingRevInfoDTO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/campingrevinfo/c_revinfo?cam_code="+cam_code;
	}
	
//	구역별 상세페이지
	@GetMapping("/selectArea")
	public void read(@RequestParam("cri_area_code")String cri_area_code, Model model) throws Exception{
		AdminCampingRevInfoDTO adminCampingRevInfoDTO = new AdminCampingRevInfoDTO();
		model.addAttribute("ac_revinfo", adminCampingRevInfoDTO);
		model.addAttribute("ac_revinfo", adminCampingRevInfoService.selectArea(cri_area_code));
		model.addAttribute(adminCampingRevInfoService.selectArea(cri_area_code));
	}
			
//		캠핑장 예약정보 수정 (admin)	
	@GetMapping("/update")
	public void updateGET(String cri_area_code,@RequestParam("cam_code") String cam_code, Model model) throws Exception{
		
		model.addAttribute("ac_revinfo", adminCampingRevInfoService.selectArea(cri_area_code));
		logger.info("update GET =========================>");
		logger.info("캠핑장 코드 ========================> " + cam_code);
		logger.info("구역 코드 ========================> " + cri_area_code);
		
		model.addAttribute("cam_code", cam_code);
	}
	
	@PostMapping("/update")
	public String updatePOST(@RequestParam("cri_area_code")String cri_area_code, 
							Model model,@RequestParam("cam_code") String cam_code, AdminCampingRevInfoDTO adminCampingRevInfoDTO, RedirectAttributes rttr) throws Exception{
		logger.info("update POST =========================>");
		
		logger.info("cri_area_code : " + cri_area_code);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri_area_code", cri_area_code);
		map.put("cri_max", adminCampingRevInfoDTO.getCri_max());
		map.put("cri_price", adminCampingRevInfoDTO.getCri_price());
		
		adminCampingRevInfoService.update(map);
		
		logger.info("update map : " + map);
				
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/campingrevinfo/c_revinfo?cam_code="+cam_code;
//		return null;
	}
			
//		캠핑장 예약정보 삭제 (admin)
	@GetMapping("/delete")
	public String delete(@RequestParam("cri_area_code") String cri_area_code, @RequestParam("cam_code") String cam_code, Model model, RedirectAttributes rttr) throws Exception{
		System.out.println("삭제 ==============> " + cri_area_code);
		logger.info("삭제 ==============> " + cri_area_code);
		adminCampingRevInfoService.delete(cri_area_code);
		rttr.addFlashAttribute("msg", "SUCCESS");

		
		return "redirect:/admin/campingrevinfo/c_revinfo?cam_code="+cam_code;
	}
	

		
//		캠핑장 예약정보 전체조회 (admin)
				
	@GetMapping("/c_revinfo")
	public String c_revinfo(@RequestParam("cam_code") String cam_code, Model model, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
//		캠핑장 예약정보 캠핑장별 조회(선택조회)
		logger.info("나와라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ" + cam_code);
//		model.addAttribute("c_revinfo", campingRevInfoService.select(cam_code));
		logger.info("리스트 정보 : "+ adminCampingRevInfoService.select(cam_code));
		List<AdminCampingRevInfoDTO> list = adminCampingRevInfoService.select(cam_code);
//		logger.info(list.get(0).getCam_code());
		
		model.addAttribute("ac_revinfo", list);
		model.addAttribute("cam_code", cam_code);
		if(list.size() == 0) {
			model.addAttribute("msg", "FAIL");
//			model.addAttribute("cam_code", cam_code);
		}
		
		return "admin/campingrevinfo/c_revinfo";
//		return "admin/campingrevinfo/c_revinfo?cam_code="+cam_code;
//		return null;
	}
	

//	

	
	

}
