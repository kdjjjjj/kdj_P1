package ez.en.page.coupon;

import java.util.List;

import ez.en.page.my_coupon.My_couponDTO;
import ez.en.page.user.UserDTO;

public interface CouponService {

	/**
	 * 쿠폰 전체조회
	 * @return
	 */
	public List<CouponDTO> listAll();

	/**
	 * 쿠폰 선택조회
	 * @param cp_code
	 * @return
	 */
	public CouponDTO selectOne(String cp_code);
	
	/**
	 * 쿠폰 수정
	 * @param cp_code
	 * @return
	 */
	public int update(CouponDTO dto);

	/**
	 * 쿠폰 추가
	 * @param dto
	 * @return
	 */
	public int insert(CouponDTO dto);
	
	/**
	 * 쿠폰 삭제
	 * @param cp_code
	 * @return
	 */
	public int delete(String cp_code);
	/**
	 * 차월 생일 회원 조회
	 * @param birth
	 * @return
	 */
	public int birthlist(String birth);
	/**
	 * 쿠폰수량 감소
	 * @param cp_code
	 * @return
	 */
	public int updatenum(String cp_code);
	
	/**
	 * 쿠폰발급
	 * @param mydto
	 * @return
	 */
	public int couponissue(My_couponDTO mydto);
	/**
	 * 쿠폰함에 해당쿠폰 있는지 여부 조회
	 * @return
	 */
	public int mycouponCheck(My_couponDTO mydto);
	
	/**
	 * 차월 생일 회원조회
	 * @param udto
	 * @return
	 */
	public int birthday(String id);
	/**
	 * ID 별 예약 갯수 조회
	 * @param id
	 * @return
	 */
	public int reservationNom(String id);
}
