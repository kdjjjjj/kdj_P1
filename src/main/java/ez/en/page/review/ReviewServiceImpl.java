package ez.en.page.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ez.en.page.camping.CampingDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.user.UserDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO dao;
	
//	 전체 리뷰글 조회
	@Override
	public List<ReviewDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	
//	 리뷰글 상세 조회
	@Override
	public ReviewDTO selectOne(String r_code) {
		// TODO Auto-generated method stub
		return dao.selectOne(r_code);
	}
//	 캠핑장 이름 가져오기
	public CampingDTO campingName(String rev_code) {
		// TODO Auto-generated method stub
		return dao.campingName(rev_code);
	}
	
//	 리뷰 작성
	public int insert(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

//	 리뷰 수정
	public int update(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}
	
//	 리뷰 수정
	public int delete(String r_code) {
		// TODO Auto-generated method stub
		return dao.delete(r_code);
	}

//	 유저 닉네임 조회
	@Override
	public UserDTO userNick(String rev_code) {
		// TODO Auto-generated method stub
		return dao.userNick(rev_code);
	}

//	리뷰 수 카운트
	@Override
	public int reviewCount(String cam_code) {
		// TODO Auto-generated method stub
		return dao.reviewCount(cam_code);
	}

//	캠핑장 상세에서 리뷰
	@Override
	public List<ReviewDTO> camReviewAll(String cam_code) {
		// TODO Auto-generated method stub
		return dao.camReviewAll(cam_code);
	}

//	페이징 처리1
	@Override
	public List<ReviewDTO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(page);
	}

//	페이징 처리2
	@Override
	public List<ReviewDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

//	페이징 수정
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

//	리뷰잠금/해제
	@Override
	public int lockUpdate(String r_code) {
		// TODO Auto-generated method stub
		return dao.lockUpdate(r_code);
	}
}
