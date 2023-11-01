package ez.en.page.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ez.en.page.coupon.CouponDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.domain.SearchCriteria;
import ez.en.page.file.FileDTO;
import ez.en.page.jjim.JjimDTO;
import ez.en.page.reservation.ReservationDTO;
import ez.en.page.review.ReviewDTO;
import ez.en.page.user.UserDTO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO dao;
	
	// 예약취소
	@Override
	public int revdelete(Object revcode) {
		// TODO Auto-generated method stub
		return dao.revdelete(revcode);
	}
	// 예약상세조회
	@Override
	public Map<String, Object> revdetail2(Object sitecode) {
		// TODO Auto-generated method stub
		return dao.revdetail2(sitecode);
	}
	// 쿠폰조회
	@Override
	public List<CouponDTO> couponlist(Object id) {
		// TODO Auto-generated method stub
		return dao.couponlist(id);
	}
	// 회원정보수정
	@Override
	public int edit(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.edit(dto);
	}
	// 회원정보하나가져오기
	@Override
	public UserDTO info(Object id) {
		// TODO Auto-generated method stub
		return dao.info(id);
	}
	// 비밀번호수정
	@Override
	public int editpassword(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.editpassword(dto);
	}
	// 예약 페이징
	@Override
	public List<ReservationDTO> revlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.revlistCriteria(cri);
	}
	// 예약 페이지 번호
	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}
	// 찜 페이징
	@Override
	public List<JjimDTO> jjimlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.jjimlistCriteria(cri);
	}
	// 찜 페이지 번호
	@Override
	public int jjimlistcountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.jjimcountPaging(cri);
	}
	// 리뷰 페이징
	@Override
	public List<ReviewDTO> reviewlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.reviewlistCriteria(cri);
	}
	// 리뷰 페이지 번호
	@Override
	public int reviewcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.reviewcountPaging(cri);
	}
	// 쿠폰 페이징
	@Override
	public List<CouponDTO> couponlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.couponlistCriteria(cri);
	}
	// 쿠폰 페이지 번호
	@Override
	public int couponcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.couponcountPaging(cri);
	}
	// 회원탈퇴
	@Override
	public int quit(UserDTO dto) {
		// TODO Auto-generated method stub
		return dao.quit(dto);
	}
	// 닉네임 중복체크
	@Override
	public int nickcheck(String id) {
		// TODO Auto-generated method stub
		return dao.nickcheck(id);
	}
	// 프로필사진 수정
	@Override
	public int editProfile(FileDTO dto) {

		return dao.editProfile(dto);
	}
	@Override
	public List<ReservationDTO> listSearchCriteria(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(map);
	}
	@Override
	public int listSearchCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(map);
	}

}
