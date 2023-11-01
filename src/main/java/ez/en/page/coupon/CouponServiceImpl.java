package ez.en.page.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ez.en.page.my_coupon.My_couponDTO;
import ez.en.page.user.UserDTO;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO dao;
	
	@Override
	public List<CouponDTO> listAll() {
		return dao.listAll();
	}

	@Override
	public CouponDTO selectOne(String cp_code) {
		return dao.selectOne(cp_code);
	}

	@Override
	public int update(CouponDTO dto) {
		return dao.update(dto);
	}
	
	@Override
	public int insert(CouponDTO dto) {
		return dao.insert(dto);
	}
	
	@Override
	public int delete(String cp_code) {
		return dao.delete(cp_code);
	}
	
	@Override
	public int birthlist(String birth) {
		return dao.birthlist(birth);
	}
	@Override
	public int updatenum(String cp_code) {
		return dao.updatenum(cp_code);
	}

	@Override
	public int couponissue(My_couponDTO mydto) {
		return dao.couponissue(mydto);
	}

	@Override
	public int mycouponCheck(My_couponDTO mydto) {
		return dao.mycouponCheck(mydto);
	}

	@Override
	public int birthday(String id) {
		return dao.birthday(id);
	}

	@Override
	public int reservationNom(String id) {
		return dao.reservationNom(id);
	}
}
