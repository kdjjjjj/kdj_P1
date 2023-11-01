package ez.en.page.mypage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ez.en.page.domain.Criteria;
import ez.en.page.domain.PageMaker;
import ez.en.page.file.FileDTO;
import ez.en.page.file.FileService;
import ez.en.page.user.UserDTO;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;
	@Autowired
	private FileService fservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	// sjs의 흔적
	//예약 취소
	@PostMapping(value = "revdelete")
	public ModelAndView revdelete(@RequestParam Map<String, Object> map,
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		mav.addObject("revdetail2", service.revdelete(map));
		mav.setViewName("mypage/revlistPage");
		return mav;
	}
	// sjs의 흔적
	// 예약상세조회
	@GetMapping(value = "revdetail")
	public ModelAndView revdetail(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("revdetail2", service.revdetail2(map));
		mav.setViewName("mypage/revdetail");
		
		return mav;
	}
	// sjs의 흔적
	// 회원정보수정form이동
	@GetMapping(value = "edit")
	public ModelAndView edit(HttpSession session,UserDTO dto,FileDTO fdto) {
		ModelAndView mav = new ModelAndView();
		dto = (UserDTO)session.getAttribute("user");
		mav.addObject("fuser", fservice.myprofile(dto.getId()));
		mav.addObject("user", service.info(dto.getId()));
		mav.setViewName("mypage/edit");
		
		return mav;
	}
	// sjs의 흔적
	// 회원정보수정 완료
	@PostMapping(value = "edit")
	public ModelAndView edit(MultipartFile profile,HttpServletRequest request,
		UserDTO dto, HttpSession session) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		
		if(profile.getOriginalFilename() != "") {
			
			FileDTO fdto = new FileDTO();
			String path = request.getServletContext().getRealPath("resources/images");
			fdto.setF_root(request.getContextPath()+"/resources/images");
			fdto.setF_realroot(path);
			String file_code = dto.getId()+"_profile";
			fdto.setF_name("s_"+dto.getId()+"_"+profile.getOriginalFilename());
			fdto.setF_code(file_code);
			dto.setF_code(fdto.getF_code());
			// 이미지 파일을 업로드 및 섬네일 생성
			profile(profile, request, dto.getId());
			service.editProfile(fdto);
			mav.addObject("map", service.edit(dto));
			mav.addObject("list", service.info(session.getAttribute("user")));
			mav.setViewName("index");
			
			return mav;
		}
		mav.addObject("map", service.edit(dto));
		mav.addObject("list", service.info(session.getAttribute("user")));
		mav.setViewName("index");
		
		return mav;
	}
	//sjs의 흔적
	// 비밀번호수정form 이동
	@PostMapping(value = "editpasswordform")
	public ModelAndView editpasswordform(@RequestParam("id")String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		dto.setId(id);
		mav.addObject("user", service.info(dto));
		mav.setViewName("mypage/editpassword");
		return mav;
	}
	// sjs의 흔적
	// 비밀번호수정 완료
	@PostMapping(value = "editpassword")
	public ModelAndView editpassword(HttpSession session,HttpServletRequest request,@RequestParam("pw")String pw) throws Exception{
		request.setCharacterEncoding("utf-8");
		UserDTO dto = (UserDTO)session.getAttribute("user");
		dto.setPw(pw);
		ModelAndView mav = new ModelAndView();
		service.editpassword(dto);
		mav.setViewName("index");
		return mav;
	}
	// 리뷰목록 페이징
	@GetMapping(value = "reviewlistPage")
	public ModelAndView revlistCri(Criteria cri,HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		UserDTO dto =  (UserDTO)session.getAttribute("user");
		cri.setId(dto.getId());
		logger.info(cri.toString());
		mav.addObject("reviewlist", service.reviewlistCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.reviewcountPaging(cri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("mypage/reviewlistPage");
		return mav;
	}
	// 예약목록 페이징
	@GetMapping(value = "revlistPage")
	public ModelAndView revlistPage(Criteria cri,HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		logger.info(cri.toString());
		cri.setId(dto.getId());
		mav.addObject("revlist", service.revlistCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countPaging(cri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("mypage/revlistPage");
		return mav;
	}
//	예약코드 검색
	@PostMapping(value = "revsearch")
	public ModelAndView revSearch(HttpSession session,Criteria cri,@RequestParam("revcode")String revcode)throws Exception {
		ModelAndView mav = new ModelAndView();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		cri.setId(dto.getId());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("revcode", revcode);
		map.put("id", dto.getId());
		pageMaker.setTotalCount(service.listSearchCount(map));
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		mav.addObject("revlist", service.listSearchCriteria(map));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("mypage/revlistPage");
		return mav;
	}
	// 찜 전체조회
	@GetMapping(value = "jjimlistPage")
	public ModelAndView jjimlistPage(Criteria cri,HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		logger.info(cri.toString());
		cri.setId(dto.getId());
		mav.addObject("jjimlist", service.jjimlistCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.jjimlistcountCriteria(cri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("mypage/jjimlistPage");
		return mav;
	}
	// 쿠폰 페이징
	@GetMapping(value = "couponlistPage")
	public ModelAndView couponlistPage(Criteria cri,HttpSession session)throws Exception {
		ModelAndView mav = new ModelAndView();
		UserDTO dto =  (UserDTO)session.getAttribute("user");
		cri.setId(dto.getId());
		logger.info(cri.toString());
		mav.addObject("couponlist", service.couponlistCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.couponcountPaging(cri));
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("mypage/couponlistPage");
		return mav;
	}
	// 회원탈퇴
	@PostMapping(value = "freedom")
	public ModelAndView freedom(UserDTO dto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		dto = (UserDTO)session.getAttribute("user");
		
		service.quit(dto);
		session.invalidate();
		mav.setViewName("index");
		return mav;
	}
	// 닉네임중복체크
	@ResponseBody
	@PostMapping(value = "nickcheck")
	public Map<String, Object> nickcheck(@RequestBody String nick,HttpSession session,
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		int count = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		count = service.nickcheck(nick);
		map.put("cnt", count);
		
		return map;
	}
	// 파일 업로드
	@ResponseBody
	@PostMapping(value = "myprofileUpload")
	public FileDTO profile(MultipartFile uploadFile, HttpServletRequest request, String userId) {
		FileDTO dto = new FileDTO();
		logger.info(uploadFile.getOriginalFilename()+"==========");
		String fileName = uploadFile.getOriginalFilename();
			if(userId != null) {
				fileName = userId+"_"+uploadFile.getOriginalFilename();
			}
			String uploadFolder = request.getServletContext().getRealPath("resources/images");
			dto.setF_name(fileName);
			logger.info("파일이름 : "+ fileName);
			logger.info("업로드 경로 : "+ uploadFolder);
			File savaFile = new File(uploadFolder, fileName);
			try {
				uploadFile.transferTo(savaFile);
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" + fileName));
				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
				
				thumbnail.close();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return dto;
	}
	
	@ResponseBody
	@GetMapping("myshowproFile")
	public ResponseEntity<byte[]> showproFile(@RequestParam("fileName") String fileName, HttpServletRequest request) {
		String folderPath = request.getServletContext().getRealPath("/")+"resources/images";
		
		logger.info("파일이름: " + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		File file = new File(folderPath + fileName);
		HttpHeaders header = new HttpHeaders();
		
		logger.info("경로가 지정된 파일명" + file);
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),
					header, HttpStatus.OK);
					
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
