package ez.en.page.onetoone_reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ez.en.page.onetoone.OnetooneDTO;

@Controller
public class Onetoone_replyController {
	private static final Logger logger = LoggerFactory.getLogger(Onetoone_replyController.class);

	@Autowired
	private Onetoone_replyService service;

	@GetMapping("onetoone_reply/list2")
	public ModelAndView list2() {
		ModelAndView mav = new ModelAndView();
		List<Onetoone_replyDTO> list2 = service.listAll();
		mav.addObject("list2", list2);
		mav.setViewName("onetoone_reply/list2");
		return mav;
	}

	@GetMapping("onetoone_reply/selectOne2")
	public ModelAndView selectOne2(@RequestParam("rp_code") int rp_code) {
		ModelAndView mav = new ModelAndView();
		Onetoone_replyDTO dto = service.selectOne2(rp_code);
		mav.addObject("onetoone_reply", dto);
		mav.setViewName("onetoone_reply/selectOne2");
		return mav;
	}

	@GetMapping("onetoone_reply/insert2")
	public ModelAndView insert2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("onetoone_reply/insert2");
		return mav;
	}

	@PostMapping("onetoone_reply/insert2")
	public ModelAndView insert2(Onetoone_replyDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.insert2(dto);
		List<Onetoone_replyDTO> list2 = service.listAll();
		mav.addObject("list2", list2);
		mav.setViewName("onetoone_reply/list2");
		return mav;

	}

	@GetMapping("onetoone_reply/update2")
	public ModelAndView update2(@RequestParam("rp_code") int rp_code) {
		ModelAndView mav = new ModelAndView();
		Onetoone_replyDTO dto = service.selectOne2(rp_code);
		mav.addObject("onetoone_reply", dto);
		mav.setViewName("onetoone_reply/update2");
		return mav;
	}

	@PostMapping("onetoone_reply/update2")
	public ModelAndView update2(Onetoone_replyDTO dto) {
		System.out.println(dto + "나는 오류종자다.");
		ModelAndView mav = new ModelAndView();
		List<Onetoone_replyDTO> list2 = service.listAll();
		if (dto.getId().equals("") || dto.getRp_content().equals("")) {
			mav.setViewName("update");
			Onetoone_replyDTO dtoo = service.selectOne2(dto.getO_code());
			mav.addObject("onetoone_reply", dtoo);
		} else {
			mav.addObject("list2", list2);
			mav.setViewName("redirect:/onetoone_reply/list2");
			service.update2(dto);

		}
		return mav;
	}

	@GetMapping("onetoone_reply/delete2")
	public ModelAndView delete2(int rp_code) {
		service.delete2(rp_code);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list2", service.listAll());
		mav.setViewName("onetoone_reply/list2");
		return mav;
	}

	
}
