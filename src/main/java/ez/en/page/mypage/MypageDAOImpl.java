package ez.en.page.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ez.en.page.coupon.CouponDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.domain.SearchCriteria;
import ez.en.page.file.FileDTO;
import ez.en.page.jjim.JjimDTO;
import ez.en.page.reservation.ReservationDTO;
import ez.en.page.review.ReviewDTO;
import ez.en.page.user.UserDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "ez.en.page.mypageMapper.";
	
	// 예약취소
	@Override
	public int revdelete(Object revcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"revdelete", revcode);
	}
	// 예약상세조회
	@Override
	public Map<String, Object> revdetail2(Object sitecode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"revdetail2", sitecode);
	}
	// 쿠폰조회
	@Override
	public List<CouponDTO> couponlist(Object id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"couponlist", id);
	}
	// 회원정보수정
	@Override
	public int edit(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"edit", dto);
	}
	// 회원정보하나 가져오기
	@Override
	public UserDTO info(Object id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"info", id);
	}
	// 비밀번호수정
	@Override
	public int editpassword(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"editpassword", dto);
	}
	// 예약 페이징
	@Override
	public List<ReservationDTO> revlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"revlistCriteria", cri);
	}
	// 예약 페이지 번호
	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"countPaging", cri);
	}
	// 찜 페이징
	@Override
	public List<JjimDTO> jjimlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"jjimlistCriteria", cri);
	}
	// 찜 페이지 번호
	@Override
	public int jjimcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"jjimcountPaging", cri);
	}
	// 리뷰 페이징
	@Override
	public List<ReviewDTO> reviewlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"reviewlistCriteria", cri);
	}
	// 리뷰 페이지 번호
	@Override
	public int reviewcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"reviewcountPaging", cri);
	}
	// 쿠폰 페이징
	@Override
	public List<CouponDTO> couponlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"couponlistCriteria", cri);
	}
	// 쿠폰 페이지 번호
	@Override
	public int couponcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"couponcountPaging", cri);
	}
	// 회원탈퇴
	@Override
	public int quit(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"quit", dto);
	}
	// 닉네임 중복체크
	@Override
	public int nickcheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"nickcheck", id);
	}
	// 프로필 사진수정
	@Override
	public int editProfile(FileDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"editProfile", dto);
	}
	@Override
	public List<ReservationDTO> listSearch(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"listSearch", map);
	}
	@Override
	public int listSearchCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"listSearchCount", map);
	}
}
