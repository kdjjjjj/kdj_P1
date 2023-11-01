package ez.en.page.onetoone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ez.en.page.user.UserDTO;

@Controller
public class Onetoonecontroller {

	private static final Logger logger = LoggerFactory.getLogger(Onetoonecontroller.class);

	@Autowired
	private OnetooneService service;

	@GetMapping("onetoone/list1")
	public ModelAndView list1() {
		ModelAndView mav = new ModelAndView();
		List<OnetooneDTO> list1 = service.listAll();
		mav.addObject("list1", list1);
		mav.setViewName("onetoone/list1");
		return mav;
	}

	@GetMapping("onetoone/selectOne1")
	public ModelAndView selectOne1(@RequestParam("o_code") int o_code) {
		ModelAndView mav = new ModelAndView();
		OnetooneDTO dto = service.selectOne(o_code);
		mav.addObject("onetoone", dto);
//		mav.setViewName("onetoone/selectOne1");
		List<Onetoone_reply> replylist = service.getDetail(o_code);
		mav.addObject("list1", replylist);
		mav.setViewName("onetoone/selectOne1");
		return mav;

	}

	@GetMapping("onetoone/SELECTONE")
	public ModelAndView SELECTONE(HttpSession session) {
		logger.info(session.getAttribute("user") + "===============================");
		ModelAndView mav = new ModelAndView();
		UserDTO dto = (UserDTO) session.getAttribute("user");
		List<OnetooneDTO> list2 = service.SELECTONE(dto.getId());
		mav.addObject("onetoone", list2);
		mav.setViewName("onetoone/SELECTONE");
		return mav;
	}
//	@PostMapping("onetoone/SELECTONE")
//	public ModelAndView SELECTONE(@RequestParam("id")String id) {
//		ModelAndView mav= new ModelAndView();
//		service.SELECTONE(id);
//		List<OnetooneDTO> list1 = service.listAll();
//		mav.addObject("list1",list1);
//		mav.setViewName("onetoone/SELECTONE");
//		return mav;
//	}

	@GetMapping("onetoone/insert1")
	public ModelAndView insert1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("onetoone/insert1");
		return mav;
	}

	@PostMapping("onetoone/insert1")
	public ModelAndView insert1(OnetooneDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.insert(dto);
		List<OnetooneDTO> list1 = service.listAll();
		mav.addObject("list1", list1);
		mav.setViewName("redirect:/onetoone/list1");
		return mav;
	}

	@GetMapping("onetoone/update1")
	public ModelAndView update1(@RequestParam("o_code") int o_code) {
		ModelAndView mav = new ModelAndView();
		OnetooneDTO dto = service.selectOne(o_code);
		mav.addObject("onetoone", dto);
		mav.setViewName("onetoone/update1");
		return mav;
	}

	@PostMapping("onetoone/update1")
	public ModelAndView update1(OnetooneDTO dto) {
		System.out.println(dto + "나는 오류종자다.");
		ModelAndView mav = new ModelAndView();
		List<OnetooneDTO> list1 = service.listAll();
		if (dto.getO_title().equals("") || dto.getO_content().equals("")) {
			mav.setViewName("update");
			OnetooneDTO dtoo = service.selectOne(dto.getO_code());
			mav.addObject("onetoone", dtoo);
		} else {
			mav.addObject("list1", list1);
			mav.setViewName("redirect:/onetoone/list1");
			service.update(dto);

		}
		return mav;
	}

	@GetMapping("onetoone/delete1")
	public ModelAndView delete1(int o_code) {
		service.delete(o_code);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list1", service.listAll());
		mav.setViewName("onetoone/list1");
		return mav;
	}

	@ResponseBody
	@PostMapping(value = "onetoone/replylist")
	public List<Onetoone_reply> replylist(@RequestParam("o_code") int o_code) {
		return service.getDetail(o_code);
	}

	@ResponseBody
	@PostMapping(value = "onetoone/reply2")
	public int reply2(Onetoone_reply Onetoone_reply) {
		return service.reply(Onetoone_reply);
	}

	@ResponseBody
	@PostMapping(value = "onetoone/replyupdate2")
	public Map<String, Object> replyupdate2(Onetoone_reply onetoone_reply) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.replyupdate(onetoone_reply);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "Fail");
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "onetoone/replyDelete")
	public int replyDelete(int rp_code) {
		System.out.println(rp_code);
		return service.replyDelete(rp_code);
	}
}
