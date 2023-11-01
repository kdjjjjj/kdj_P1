package ez.en.page.camping;

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
@RequestMapping("/scamping/*")
public class SearchCampingController {
	

	private static final Logger logger = LoggerFactory.getLogger(SearchCampingController.class);
	@Inject
	private CampingService campingService;
	@Inject
	private ReviewService rservice;
	

	
//	검색기능 추가 후 조회 
	@GetMapping("/list")
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
//		model.addAttribute("list", campingService.listCriteria(cri));
		model.addAttribute("list", campingService.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
//		pageMaker.setTotalCount(campingService.listCountCriteria(cri));
		pageMaker.setTotalCount(campingService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
//	상세 조회
	@GetMapping("/detail")
	public void detail(@RequestParam("cam_code") String cam_code, @ModelAttribute("cri") SearchCriteria cri, Model model, 
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		int count = rservice.reviewCount(cam_code);
		List<ReviewDTO> rdto = rservice.camReviewAll(cam_code);
		logger.info("리뷰 개수 : " + count);
//		if(count==0) {
//			model.addAttribute("count", 0);
//		}else {
			model.addAttribute("count",count);
//		}
	    model.addAttribute("rrdto", rdto);
		
		model.addAttribute("camping", campingService.detail(cam_code));
	}
	
	
	
//	삭제
	@PostMapping("/removePage")
	public String remove(@RequestParam("cam_code") String cam_code, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		campingService.remove(cam_code);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/scamping/list";
	}
	
//	수정
	@GetMapping("/modifyPage")
	public void modifyPagingGET(String cam_code, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		model.addAttribute("camping", campingService.detail(cam_code));
	}
	
	@PostMapping("/modifyPage")
	public String modifyPagingPOST(CampingDTO campingDTO, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		logger.info(cri.toString());
		campingService.modify(campingDTO);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/scamping/list";
	}
	
//	등록
	@GetMapping("/register")
	public void registGET() throws Exception{
		
		logger.info("regist get .........................");
	}
	
	@PostMapping("/register")
	public String registPOST(CampingDTO campingDTO, RedirectAttributes rttr) throws Exception{
		logger.info("regist post ..................");
		logger.info(campingDTO.toString());
		
		campingService.register(campingDTO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/scamping/list";
	}
}
