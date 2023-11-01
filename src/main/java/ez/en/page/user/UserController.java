package ez.en.page.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ez.en.page.camping.CampingController;
import ez.en.page.camping.CampingDTO;
import ez.en.page.camping.CampingService;
import ez.en.page.file.FileDTO;
import ez.en.page.file.FileService;
import ez.en.page.review.ReviewService;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewService rservice;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private CampingController camController;
	@Autowired
	private CampingService camService;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping(value = "detail")
	public String detail(HttpSession session, Model model, HttpServletRequest request) {
		UserDTO dto = (UserDTO)session.getAttribute("user");
		model.addAttribute("file", fileService.myprofile(dto.getId()));
		int count = rservice.reviewCount("cam001");
		model.addAttribute("count",count);
		return "camdetail";
	}
	
	// 캠핑장 추천에 의한 필요정보 리스트(주연)
	@GetMapping(value = "/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> revAvgList = camService.revAvg();
		List<CampingDTO> camList = camService.camList(revAvgList);
		mav.addObject("camList", camList);
		mav.setViewName("index");
		return mav;
	}

	@GetMapping(value = "login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@PostMapping(value = "login")
	public ModelAndView login(UserDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO udto = userService.login(dto);
		if(udto == null) {
			mav.addObject("msg", "아이디와 비밀번호를 다시 입력해주세요");
			mav.setViewName("login");
			
		}else if(udto.getStop() == 1) {
			mav.addObject("msg", "stop");
			mav.setViewName("index");
		}else {
			session.setAttribute("user", userService.login(dto));
			mav.setViewName("index");
		}
		List<Map<String, Object>> revAvgList = camService.revAvg();
		List<CampingDTO> camList = camService.camList(revAvgList);
		mav.addObject("camList", camList);
		return mav;
	}
	
	@GetMapping(value = "signup")
	public ModelAndView signup() {
		ModelAndView mav = new ModelAndView();
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		String today = day.format(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, -20);
		mav.addObject("year", cal.get(Calendar.YEAR));
		mav.addObject("today", today);
		mav.setViewName("signup");
		return mav;
	}
	
	@PostMapping(value = "idchk")
	@ResponseBody
	public Map<String, Object> idmsg(@RequestParam("id") String id, HttpSession session) {
		Map<String, Object>map = new HashMap<String, Object>();
		if(userService.idchk(id) == null) {
			map.put("chk", true);
		}else {
			map.put("chk", false);
			session.setAttribute("id", userService.idchk(id));
		}
		
		return map;
	}
	
	
	@PostMapping(value = "nickchk")
	@ResponseBody
	public Map<String, Object> nickmsg(@RequestParam("nick") String nick) {
		Map<String, Object>map = new HashMap<String, Object>();
		if(userService.nickchk(nick) == null) {
			map.put("chk", true);
		}else {
			map.put("chk", false);
		}
		
		return map;
	}
	@ResponseBody
	@PostMapping(value = "profileUpload")
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return dto;
	}
	
	@ResponseBody
	@GetMapping("showproFile")
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@PostMapping(value = "signup")
	public ModelAndView signup(MultipartFile profile ,UserDTO dto, HttpServletRequest request) {
		logger.info("경로 : " + request.getContextPath());
		if(profile.getOriginalFilename() != "") {
			
			FileDTO fdto = new FileDTO();
			String path = request.getServletContext().getRealPath("resources/images");
			fdto.setF_root(request.getContextPath()+"/resources/images");
			fdto.setF_realroot(path);
			String file_code = dto.getId()+"_profile";
			fdto.setF_name("s_"+dto.getId()+"_"+profile.getOriginalFilename());
			fdto.setF_code(file_code);
			fileService.fileupload(fdto);
			dto.setF_code(file_code);
			// 이미지 파일을 업로드 및 섬네일 생성
			profile(profile, request, dto.getId());
		}
		userService.signup(dto);
		return home();
	}

//	아이디 찾기 페이지 이동
	@GetMapping(value = "idfind")
	public ModelAndView idfind() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idfind");
		return mav;
	}
	
//	아이디 찾기
	@PostMapping(value = "idfind")
	public ModelAndView idfind(UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", userService.idFind(dto));
		mav.setViewName("idfindResult");
		return mav;
	}
	
//	비밀번호 찾기 페이지 이동
	@GetMapping(value = "serachid")
	public ModelAndView serachid() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("serachid");
		return mav;
	}
	
	@GetMapping(value = "pwfind")
	public ModelAndView pwfind() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pwfind");
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value = "userDataFind")
	public Map<String, Object> pwfind(HttpSession session, UserDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		dto.setId(session.getAttribute("id")+"");
		int result = userService.pwFind2(dto);
		if(result == 0) {
			map.put("msg", "조회되는 정보가 없습니다.");
		}else {
			map.put("msg", "성공");
		}
		return map;
	}
	
	@PostMapping(value = "pwfind")
	public ModelAndView pwchange() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pwchange");
		return mav;
	}
	
	@PostMapping(value = "pwchange")
	public ModelAndView pwchange(@RequestParam("pw") String pw, HttpSession session) {
		logger.info("pw : " + pw);
		UserDTO dto = new UserDTO();
		dto.setId(session.getAttribute("id")+"");
		dto.setPw(pw);
		userService.pwchange(dto);
		return home();
	}
	
	// sjs의 흔적
	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
