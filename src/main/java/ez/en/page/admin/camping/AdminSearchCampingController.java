package ez.en.page.admin.camping;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ez.en.page.domain.PageMaker;
import ez.en.page.domain.SearchCriteria;
import ez.en.page.review.ReviewDTO;
import ez.en.page.review.ReviewService;

@Controller
@RequestMapping("/admin/scamping/*")
public class AdminSearchCampingController {
	

	private static final Logger logger = LoggerFactory.getLogger(AdminSearchCampingController.class);
	@Inject
	private AdminCampingService adminCampingService;
	@Inject
	private ReviewService rservice;
	
//	검색기능 추가 후 조회 
	@GetMapping("/list")
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", adminCampingService.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(adminCampingService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
//	상세 조회
	@GetMapping("/detail")
	public void detail(@RequestParam("cam_code") String cam_code, @ModelAttribute("cri") SearchCriteria cri, Model model, 
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		int count = rservice.reviewCount(cam_code);
		List<ReviewDTO> rdto = rservice.camReviewAll(cam_code);
		
		 model.addAttribute("count",count);
	      model.addAttribute("rrdto", rdto);
		
		model.addAttribute("acamping", adminCampingService.detail(cam_code));
	}
	
	
	
//	삭제
	@PostMapping("/removePage")
	public String remove(@RequestParam("cam_code") String cam_code, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		adminCampingService.remove(cam_code);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/scamping/list";
	}
	
//	수정
	@GetMapping("/modifyPage")
	public void modifyPagingGET(String cam_code, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		model.addAttribute("acamping", adminCampingService.detail(cam_code));
	}
	
	@PostMapping("/modifyPage")
	public String modifyPagingPOST(AdminCampingDTO adminCampingDTO, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		adminCampingService.modify(adminCampingDTO);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/admin/scamping/list";
	}
	
//	등록
	@GetMapping("/register")
	public void registGET() throws Exception{
		
		logger.info("regist get .........................");
	}
	
	@PostMapping("/register")
	public String registPOST(AdminCampingDTO adminCampingDTO, RedirectAttributes rttr) throws Exception{
		logger.info("regist post ..................");
		logger.info(adminCampingDTO.toString());
		
		adminCampingService.register(adminCampingDTO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/scamping/list";
	}
}
