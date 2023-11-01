package ez.en.page.review;

import java.util.List;
import java.util.Map;

import ez.en.page.camping.CampingDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.user.UserDTO;

public interface ReviewService {

//	 ★★★ 리뷰전체목록
	public List<ReviewDTO> listAll();

//	 ★★★ 리뷰상세목록
	public ReviewDTO selectOne(String r_code);

//	 ★★★ 캠핑장 이름 조회
	public CampingDTO campingName(String rev_code);

//	 ★★★ 리뷰 작성
	public int insert(ReviewDTO dto);

//	 ★★★ 리뷰 작성
	public int update(ReviewDTO dto);

//	 ★★★ 리뷰 삭제
	public int delete(String r_code);
	
//  ★★★ 캠핑장 예약자 이름 조회
	public UserDTO userNick(String rev_code);

//  ★★★ 캠핑장 리뷰갯수 조회
	public int reviewCount(String cam_code);
	
//  ★★★ 리뷰화면 캠핑장 상세에서 보여주기222
	public List<ReviewDTO> camReviewAll(String cam_code);
	
//	★★★ 페이징 처리1
	public List<ReviewDTO> listPage(int page) throws Exception;
	
//	★★★ 페이징 처리2
	public List<ReviewDTO> listCriteria(Criteria cri) throws Exception;

//	★★★ 페이징 수정
	public int listCountCriteria(Criteria cri) throws Exception;

//	★★★ 리뷰잠금/해제
	public int lockUpdate(String r_code);

}
