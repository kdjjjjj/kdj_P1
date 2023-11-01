package ez.en.page.notice;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	// kws의 흔적
	// 전체 공지사항 조회
	@GetMapping("notice/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> list = service.listAll();
		mav.addObject("list", list);
		mav.setViewName("notice/list");
		return mav;
	}

	// kws의 흔적
	// 공지사항 상세조회
	@GetMapping("notice/selectOne")
	public ModelAndView selectOne(@RequestParam("n_code") int n_code) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = service.selectOne(n_code);
		mav.addObject("notice", dto);
		mav.setViewName("notice/selectOne");
		return mav;
	}

	// 공지사항 추가
	@GetMapping("notice/insert")
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/insert");
		return mav;

	}

	// 공지사항 추가
	@PostMapping("notice/insert")
	public ModelAndView insert(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.insert(dto);
		List<NoticeDTO> list = service.listAll();
		mav.addObject("list", list);
		mav.setViewName("notice/list");
		return mav;
	}

	// 공지사항 수정
	@GetMapping("notice/update")
	public ModelAndView update(@RequestParam("n_code") int n_code) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = service.selectOne(n_code);
		mav.addObject("notice", dto);
		mav.setViewName("notice/update");
		return mav;
	}

	// 공지사항 수정
	@PostMapping("notice/update")
	public ModelAndView update(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> list = service.listAll();
		if (dto.getN_title().equals("") || dto.getN_content().equals("")) {
			mav.setViewName("update");
			NoticeDTO dtoo = service.selectOne(dto.getN_code());
			mav.addObject("notice", dtoo);
		} else {
			mav.addObject("list", list);
			mav.setViewName("redirect:/notice/list");
			service.update(dto);
		}
		return mav;
	}

	// 공지사항 삭제
	@GetMapping("notice/delete")
	public ModelAndView delete(int n_code) {
		service.delete(n_code);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.listAll());
		mav.setViewName("notice/list");
		return mav;
	}
}
