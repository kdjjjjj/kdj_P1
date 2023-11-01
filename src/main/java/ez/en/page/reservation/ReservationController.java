package ez.en.page.reservation;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ez.en.page.camping.CampingDTO;


@Controller
//@RequestMapping("/reservation/*/")
public class ReservationController {
	
	@Inject
	private ReservationService reservationService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class); 
	
	
	//날짜 중복 조회
//	public int selectDate(@RequestParam("cri_area_code")String cri_area_code) {
//		
//		return 
//	}
	
	//예약 추가(form)
	@GetMapping("/reservation")
	public void insertGET(@RequestParam("cri_area_code") String cri_area_code, Model model, ReservationDTO reservationDTO) {
		logger.info("reservation GET =========================>" + cri_area_code);
		logger.info("reservationDTO ===========>" + reservationDTO);
		
		model.addAttribute("reservation", reservationDTO);
	}
	
	//예약 추가(POST)
	
	@PostMapping("/reservatoin")
	public String reservationPOST(ReservationDTO reservationDTO, RedirectAttributes rttr) throws Exception{
		
		logger.info("reservation POST ======================>");
		logger.info(reservationDTO.toString());
		
		reservationService.insert(reservationDTO);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
//		rttr.addFlashAttribute("msg", "FAIL");
		
		return "redirect:/mypage/revlistPage";
	}
	

		
	
	
	
	//예약 수정
	
	//예약 취소

}
