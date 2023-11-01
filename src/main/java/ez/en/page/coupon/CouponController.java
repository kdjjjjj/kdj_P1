package ez.en.page.coupon;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ez.en.page.domain.Criteria;
import ez.en.page.domain.PageMaker;
import ez.en.page.my_coupon.My_couponDTO;
import ez.en.page.mypage.MypageController;
import ez.en.page.mypage.MypageService;
import ez.en.page.user.UserDTO;


@Controller
//@RequestMapping("/coupon/*")
public class CouponController {
	@Autowired
	private CouponService service;
	
	@Autowired
	private MypageService mService;
	
//	@Autowired
//	private My_couponDTO mydto;
	
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
//	전체조회_관리자
	@GetMapping("coupon")
	public ModelAndView coupon(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView model = new ModelAndView();
		List<CouponDTO>listAll = service.listAll();
		logger.info("전체조회" + listAll);
		
		model.addObject("listAll", listAll);
		model.setViewName("coupon/list");
		return model;
	}
	
//	전체조회_유저
	@GetMapping("/coupon_user")
	public ModelAndView coupon_user(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView model = new ModelAndView();
		List<CouponDTO>listAll = service.listAll();
		logger.info("전체조회" + listAll);
		
		model.addObject("listAll", listAll);
		model.setViewName("coupon/list_user");
		return model;
	}
	
//	선택조회
	@GetMapping("coudetail")
	public ModelAndView coudetail(@RequestParam("cp_code") String cp_code) {
		ModelAndView model = new ModelAndView();
		CouponDTO coupon = service.selectOne(cp_code);
		model.addObject("coupon", coupon);
		model.setViewName("coupon/detail");
		return model;
	}
	
//	수정
	@GetMapping("update")
	public ModelAndView update(@RequestParam("cp_code") String cp_code) {
		ModelAndView model = new ModelAndView();
		CouponDTO coupon = service.selectOne(cp_code);
		model.addObject("coupon", coupon);
		model.setViewName("coupon/update");
		return model;
	}

	@PostMapping("update")
	public ModelAndView update(CouponDTO dto) {
		ModelAndView model = new ModelAndView();
		int up = service.update(dto);
		if(up==0) { // 수정실패
			String cp_code = dto.getCp_code();
			CouponDTO coupon = service.selectOne(cp_code);
			model.addObject("coupon", coupon);
			model.setViewName("coupon/update");
		} else { // 수정 성공
			List<CouponDTO>listAll = service.listAll();
			model.addObject("listAll", listAll);
			model.setViewName("coupon/list");
		}
		return model;
	}
	
//	추가
	@GetMapping("insert")
	public ModelAndView insert() {
		ModelAndView model = new ModelAndView();
		model.setViewName("coupon/insert");
		return model;
	}
	
	@PostMapping("insert")
	public ModelAndView insert(CouponDTO dto) {
		ModelAndView model = new ModelAndView();
		logger.info("테스틎ㅇ");
		int up = service.insert(dto);
		if(up == 0) { // 추가 실패
			String cp_code = dto.getCp_code();
			CouponDTO coupon = service.selectOne(cp_code);
			model.addObject("coupon", coupon);
			model.setViewName("coupon/insert");
		} else { // 추가 성공
			List<CouponDTO>listAll = service.listAll();
			model.addObject("listAll", listAll);
			model.setViewName("coupon/list");
		}
		return model;
	}
	
//	삭제
	@GetMapping("delete")
	public ModelAndView delete(String cp_code) {
		ModelAndView model = new ModelAndView();
//		logger.info("테스틎ㅇ");
		service.delete(cp_code);
		List<CouponDTO>listAll = service.listAll();
		model.addObject("listAll", listAll);
		model.setViewName("coupon/list");
		return model;
	}
	
//	쿠폰 발급
	@GetMapping("mypage/couponlistPage")
	public ModelAndView couponlist(My_couponDTO mydto, HttpSession session, Criteria cri) throws Exception {
		//logger.info("쿠폰 이름 : "+cp_name);
		ModelAndView mav = new ModelAndView();
		//logger.info("쿠폰코드 : " + mydto.getCp_code());
		UserDTO udto = (UserDTO)session.getAttribute("user");
		logger.info("아이디 : " + udto.getId());
		
		mydto.setId(udto.getId());
		service.couponissue(mydto);  //쿠폰발급
		
		cri.setId(udto.getId());
		logger.info(cri.toString());
		List<CouponDTO> list = mService.couponlistCriteria(cri);
		mav.addObject("couponlist", list);
		for (CouponDTO couponDTO : list) {
			logger.info("쿠폰 정보 : "+couponDTO);
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mService.couponcountPaging(cri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("mypage/couponlistPage");
		return mav;
	}
	
//	쿠폰 발급(ajax)
	@ResponseBody
	@PostMapping(value = "couponchk")
	public Map<String, Object> couponchk(@RequestParam("cp_code") String cp_code, HttpSession session, @RequestParam("cp_amount") int cp_amount){
		My_couponDTO mydto = new My_couponDTO();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		mydto.setCp_code(cp_code);
		mydto.setId(dto.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		int result = service.mycouponCheck(mydto);
		int birth = service.birthday(dto.getId());
		int reservation = service.reservationNom(dto.getId());
		if(cp_amount == 0) { // 쿠폰 수량 0일때
			
			map.put("msg", "쿠폰 수량이 초과되어 발급 불가합니다.");  
			
		}else if(result == 1) { // 중복 발급시
			map.put("msg", "이미 발급된 쿠폰입니다.");
			
		}else if(birth == 0 && cp_code.equals("cp002") ) {
			map.put("msg", "차월이 생일인 회원만 발급 가능한 쿠폰입니다.");
			
		}else if(reservation < 4 && cp_code.equals("cp003")) {
			map.put("msg", "5회 이상 예약 시 발급 가능한 쿠폰입니다.");
			
		} else{ // 쿠폰 수량 0이 아닐때 && 쿠폰함에 중복이 없을 때 발급 + 수량 감소
			map.put("msg", "쿠폰발급에 성공하셨습니다");
			service.couponissue(mydto);
//			logger.info("cp_code값 : " +cp_code);
//			updatenum(수량 감소 id)
			service.updatenum(cp_code); // 수량감소
		}
		return map;
	}
	
//	차월 회원조회(ajax)
	@ResponseBody
	@PostMapping(value = "birthdaylist")
	public Map<String, Object> birthdaylist(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		//logger.info("생일회원 조회 : "+id);
		if(service.birthday(id) == 0) {
			map.put("msg", "차월이 생일인 회원만 발급 가능한 쿠폰입니다.");
		} else {
			service.birthday(id);
		}
		
		return map;
	}
	
//	ID 별 예약 갯수 조회(ajax)
	@ResponseBody
	@PostMapping(value = "reservationlist")
	public Map<String, Object> reservationlist(String id){
		Map<String, Object> map = new HashMap<String, Object>();
		if(service.reservationNom(id) < 4) {
			map.put("msg", "5회 이상 예약 시 발급 가능한 쿠폰입니다.");
		} else {
			service.reservationNom(id);
		}
		return map;
	}
	
	
}
