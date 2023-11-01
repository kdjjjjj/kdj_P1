package ez.en.page.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ez.en.page.my_coupon.My_couponDTO;
import ez.en.page.user.UserDTO;

@Repository
public class CouponDAOImpl implements CouponDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namepace = "ez.en.page.couponMapper.";
	
	@Override
	public List<CouponDTO> listAll() {
		return sqlSession.selectList(namepace + "listAll");
	}

	@Override
	public CouponDTO selectOne(String cp_code) {
		return sqlSession.selectOne(namepace + "selectOne",cp_code);
	}
	@Override
	public int update(CouponDTO dto) {
		return sqlSession.update(namepace + "update" , dto);
	}

	@Override
	public int insert(CouponDTO dto) {
		return sqlSession.insert(namepace + "insert", dto);
	}
	
	@Override
	public int delete(String cp_code) {
		return sqlSession.delete(namepace + "delete", cp_code);
	}
	
	@Override
	public int birthlist(String birth) {
		return sqlSession.selectOne(namepace + "birthlist",birth);
	}
	
	@Override
	public int updatenum(String cp_code) {
		return sqlSession.update(namepace + "updatenum", cp_code);
	}

	@Override
	public int couponissue(My_couponDTO mydto) {
		return sqlSession.insert(namepace + "couponissue", mydto);
	}

	@Override
	public int mycouponCheck(My_couponDTO mydto) {
		return sqlSession.selectOne(namepace + "mycouponCheck" , mydto);
	}

	@Override
	public int birthday(String id) {
		return sqlSession.selectOne(namepace + "birthday", id);
	}

	@Override
	public int reservationNom(String id) {
		return sqlSession.selectOne(namepace + "reservationNom", id);
	}
}
