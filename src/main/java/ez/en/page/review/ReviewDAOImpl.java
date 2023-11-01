package ez.en.page.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ez.en.page.camping.CampingDTO;
import ez.en.page.domain.Criteria;
import ez.en.page.user.UserDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "ez.en.page.reviewMapper.";

	
//	 리뷰전체조회
	@Override
	public List<ReviewDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "listAll");
	}
	
//	 리뷰상세조회
	@Override
	public ReviewDTO selectOne(String r_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"selectOne", r_code);
	}
	
//	 캠핑장이름 조회
	@Override
	public CampingDTO campingName(String rev_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "campingName", rev_code);
	}
	
//	 리뷰 작성
	@Override
	public int insert(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "insert", dto);
	}
	
	
//	 리뷰 수정
	@Override
	public int update(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "update", dto);
	}

//	 리뷰 삭제
	@Override
	public int delete(String r_code) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "delete", r_code);
	}

//	 예약자 닉네임 조회
	@Override
	public UserDTO userNick(String rev_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "userNick", rev_code);
	}
// 	 캠핑장 리뷰갯수 카운트 조회
	@Override
	public int reviewCount(String cam_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "reviewCount", cam_code);
	}

//	 캠핑장 상세보기에서 리뷰22
	@Override
	public List<ReviewDTO> camReviewAll(String cam_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "camReviewAll", cam_code);
	}

	// 페이징처리1
	@Override
	public List<ReviewDTO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if(page <= 0) {
			page = 1;
		}
		page = (page-1) * 10;
		return sqlSession.selectList(namespace + "listPage", page);
	}
	// 페이징처리2
	@Override
	public List<ReviewDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "listCriteria", cri);
	}

	// 페이징카운트
	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "countPaging", cri);
	}

	// 리뷰잠금/해제
	@Override
	public int lockUpdate(String r_code) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "lockUpdate", r_code);
	}
}
