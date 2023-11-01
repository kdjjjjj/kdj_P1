package ez.en.page.review;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import ez.en.page.camping.CampingDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.domain.PageMaker;
import ez.en.page.domain.SearchCriteria;
import ez.en.page.user.UserDTO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	private ReviewService service;
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

//	리뷰글 전체목록조회
	@GetMapping("/reviewList")
	public ModelAndView review(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		List<ReviewDTO> list = service.listAll();
		logger.info("전체조회!!!!!!" + list);
		mav.addObject("listAll", list);
		mav.setViewName("review/reviewList");
		return mav;
	}
	
	
//	리뷰글 상세조회
	@GetMapping("/reviewDetail")
	public ModelAndView reviewDetail (@RequestParam("r_code") String r_code, @RequestParam("rev_code") String rev_code, 
			HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		ReviewDTO dto = service.selectOne(r_code);
		CampingDTO name = service.campingName(rev_code);
		UserDTO nick = service.userNick(rev_code);
//		logger.info("선택조회!!!!" + dto);
//		logger.info("선택조회!!!!" + name);
		mav.addObject("selectOne", dto);   //뷰에 전달하는 값
		mav.addObject("campingName", name);
		mav.addObject("userNick1", nick);
		mav.setViewName("review/reviewDetail");
		return mav;
	}
	
//	리뷰 작성 form
	@GetMapping("/reviewInsert")
	public ModelAndView reviewInsert (@RequestParam("rev_code") String rev_code) {
		ModelAndView mav = new ModelAndView();
		logger.info(rev_code + "예약번호입니다.");
		CampingDTO name = service.campingName(rev_code);
		UserDTO nick = service.userNick(rev_code);
		mav.addObject("campingName3", name);
		mav.addObject("userNick3", nick);
		mav.setViewName("review/reviewInsert");
		return mav;
	}
	
//	리뷰 작성
	@PostMapping("/reviewInsert")
	public ModelAndView reviewInsert(ReviewDTO dto, HttpServletRequest request, Criteria cri) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		System.out.println(dto);
		logger.info(dto.getId() + "아이디입니다.");
		service.insert(dto);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		mav.addObject("pageMaker", pageMaker);
		
		mav.addObject("plist", service.listCriteria(cri));
		mav.setViewName("review/reviewlistPage");
		return mav;
	}
	
//	리뷰 수정 form
	@GetMapping("/reviewUpdate")
	public ModelAndView reviewUpdate(@RequestParam("r_code") String r_code , @RequestParam("rev_code") String rev_code) {
		ModelAndView mav = new ModelAndView();
		ReviewDTO dto = service.selectOne(r_code);
		CampingDTO name = service.campingName(rev_code);
		UserDTO nick = service.userNick(rev_code);
//		logger.info("리뷰수정안의 선택조회!!!"+ dto);
		mav.addObject("selectOne2", dto);
		mav.addObject("campingName2", name);
		mav.addObject("userNick2", nick);
		mav.setViewName("review/reviewUpdate");
		return mav;
	}
	
//	리뷰 수정
	@PostMapping("/reviewUpdate")
	public ModelAndView reviewUpdate(ReviewDTO dto, HttpServletRequest request, Criteria cri) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		service.update(dto);
//		logger.info("리뷰수정???!!!!!" + dto);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		mav.addObject("pageMaker", pageMaker);
		
		mav.addObject("plist", service.listCriteria(cri));
		mav.setViewName("review/reviewlistPage");
		return mav;
	}
	
//	리뷰 삭제
	@GetMapping("/reviewDelete")
	public ModelAndView reviewDelete(@RequestParam("r_code") String r_code, HttpServletRequest request, Criteria cri) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		service.delete(r_code);
//		List<ReviewDTO> list = service.listAll();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		mav.addObject("pageMaker", pageMaker);
		
		mav.addObject("plist", service.listCriteria(cri));
		mav.setViewName("review/reviewlistPage");
		return mav;
	}
	
//	페이징처리 1
	@GetMapping("previewlistCri")
	public ModelAndView rlist(Criteria cri) throws Exception{
		ModelAndView mav = new ModelAndView();
		logger.info("show list page with Criteria......................");
		
		mav.addObject("reviewlist",service.listCriteria(cri));
		mav.setViewName("review/reviewlistCri");
		return mav;
	}
	
//	페이징처리 
	@GetMapping("previewlistPage")
	public ModelAndView rlistPage(Criteria cri) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("plist", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("review/reviewlistPage");
		return mav;
	}
	
//	리뷰 잠금/해제
	@GetMapping("/reviewLock")
	public ModelAndView lockUpdate(@RequestParam("r_code") String r_code, Criteria cri) throws Exception{
		service.lockUpdate(r_code);
		return rlistPage(cri);
	}
	


	
	

}
