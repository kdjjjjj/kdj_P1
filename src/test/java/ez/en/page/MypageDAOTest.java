package ez.en.page;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ez.en.page.camping.CampingDAO;
import ez.en.page.camping.CampingDTO;
import ez.en.page.camping_rev_info.CampingRevInfoDAO;
import ez.en.page.camping_rev_info.CampingRevInfoDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.jjim.JjimDTO;
import ez.en.page.mypage.MypageDAO;
import ez.en.page.reservation.ReservationDAO;
import ez.en.page.reservation.ReservationDTO;
import ez.en.page.review.ReviewDAO;
import ez.en.page.review.ReviewDTO;
import ez.en.page.review_recommend.Review_recommendDTO;
import ez.en.page.user.UserDAO;
import ez.en.page.user.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class MypageDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOTest.class);
	
	@Autowired
	private MypageDAO dao;
	
	@Autowired
	private UserDAO udao;
	
	@Autowired
	private CampingDAO cdao;
	
	
//	@Test
//	public void testreviewListPage() throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		int page = 3;
//		String id = "user01";
//		String r_code = "r000";
//		map.put("r_code", r_code);
//		map.put("id", id);
//		map.put("page", page);
//		List<ReviewDTO> list = dao.reviewlistPage(map);
//		for (ReviewDTO reviewDTO : list) {
//			logger.info(reviewDTO.getR_code() + ":" + reviewDTO.getRev_code());
//		}
//	}
//	@Test
//	public void testListCriteria() throws Exception {
//		Criteria cri = new Criteria();
//		cri.setId("user01");
//		cri.setPage(2);
//		cri.setPerPageNum(20);
//		
//		List<ReviewDTO> list = dao.reviewlistCriteria(cri);
//		
//		for (ReviewDTO reviewDTO : list) {
//			logger.info(reviewDTO.getR_code() + ":" + reviewDTO.getRev_code());
//		}
//	}
	
//	@Test
//	public void userAdd() throws InterruptedException {
//		for (int i = 61; i < 70; i++) {
//			UserDTO dto = new UserDTO();
//			dto.setId("user"+i);
//			dto.setPw("user"+i);
//			dto.setName("유저"+i);
//			dto.setNick("유저"+i);
//			dto.setBirth("19960218");
//			dto.setPhone("00000010002");
//			udao.signup(dto);
//			Thread.sleep(1000);
//		}
//	}
	
//	@Test
//	public void camAdd() throws InterruptedException {
//		
//		for (int i = 0; i < 20; i++) {
//			CampingDTO dto = new CampingDTO("cam0"+i, "area001", "" ,"캠핑장"+i, "캠핑장주소"+i, "01000000000","오후 3시", "익일 오전 11시", "tm02,tm04,tm05,tm11", "op02,op03,op04", 'N');
//			cdao.register(dto);
//			
//			Thread.sleep(1000);
//		}
//		
//	}
	@Test
	public void test() {
		
		List<Map<String, Object>> list = cdao.revAvg();
		
		List<CampingDTO> camlist = cdao.camList(list);
		for (CampingDTO campingDTO : camlist) {
			logger.info("캠핑장 이름 : " + campingDTO.getCam_name());
		}
		
	}
	

	
}
