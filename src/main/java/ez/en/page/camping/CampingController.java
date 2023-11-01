package ez.en.page.camping;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import ez.en.page.camping_thema.ThemaService;
import ez.en.page.domain.Criteria;
import ez.en.page.domain.PageMaker;
import ez.en.page.review.ReviewDTO;
import ez.en.page.review.ReviewService;


@Controller
@RequestMapping("/camping/*")
public class CampingController {
	
	@Inject
	private CampingService campingService;
	@Inject
	private ThemaService themaService;
	
	private static final Logger logger = LoggerFactory.getLogger(CampingController.class);
	
	// kdj 추가함
	@Autowired
	private ReviewService rservice;
	
	@Autowired
	private CampingService camService;
	
	
	//1.캠핑장 등록 (캠핑장 등록 버튼은 admin의 캠핑장 전체목록(list)view -> register) -> 등록 후 list목록으로 (registerPost)
	//캠핑장 등록 폼 (registerGET)
	@GetMapping("/register")
	public void registerGET(CampingDTO campingDTO, Model model) throws Exception {
		logger.info("register GET ====================> ");
		
	}

	//캠핑장 등록 후 데이터 처리 -> list목록으로 (registerPOST)
	@PostMapping("/register")
	public String registerPOST(CampingDTO campingDTO, RedirectAttributes rttr) throws Exception {
		
		logger.info("register POST ===================>");
		logger.info(campingDTO.toString());
		
		campingService.register(campingDTO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/camping/list";
	}
	
	@GetMapping("/list")
	public void list(Model model) throws Exception{
		logger.info("show all list =====================>");
		model.addAttribute("list", campingService.list());
	}
	

	@PostMapping("/remove")
	public String remove(@RequestParam("cam_code") String cam_code,
			RedirectAttributes rttr) throws Exception{
		
		campingService.remove(cam_code);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/camping/list";
	}
	
	@GetMapping("/modify")
	public void modifyGET(String cam_code, Model model) throws Exception{
		
		model.addAttribute("camping", campingService.detail(cam_code));
	}
	
	@PostMapping("/modify")
	public String modifyPOST(CampingDTO campingDTO, RedirectAttributes rttr) throws Exception{
		logger.info("modify post ================>");
		
		campingService.modify(campingDTO);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/camping/list";
	}
	


	//페이징
	@GetMapping("/listCri")
	public void list(Criteria cri, Model model) throws Exception{
		
		logger.info("show list page with Criteria......................");
		
		model.addAttribute("list", campingService.listCriteria(cri));
	}
	

	
	@GetMapping("/listPage")
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", campingService.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMager.setTotalCount(131);
		
		pageMaker.setTotalCount(campingService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	


//	
	
	//5.캠핑장 상세 페이지 (캠핑장 전체 목록에서 캠핑장 이름(cam_name)을 클릭 했을 경우 -> 상세페이지(detail)로 이동
	@GetMapping("/detail")
	public String detail(@RequestParam ("cam_code") String cam_code, Model model, 
			HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int count = rservice.reviewCount(cam_code);
		List<ReviewDTO> rdto = rservice.camReviewAll(cam_code);
		model.addAttribute("count",count);
		model.addAttribute("rrdto", rdto);
		return "camping/detail";
	}
	
	

	//6.캠핑장 예약 정보(캠핑장 상세페이지에서 보여줄 각 캠핑장별 예약 정보)
	
//	 캠핑장 추천에 의한 필요정보 리스트(주연)
//		@GetMapping(value = "/")
//		public ModelAndView home() {
//			ModelAndView mav = new ModelAndView();
//			List<Map<String, Object>> revAvgList = camService.revAvg();
//			List<CampingDTO> camList = camService.camList(revAvgList);
//			mav.addObject("camList", camList);
//			mav.setViewName("index");
//			return mav;
//		}

}
