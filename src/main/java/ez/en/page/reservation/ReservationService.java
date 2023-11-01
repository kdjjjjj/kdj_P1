package ez.en.page.reservation;

public interface ReservationService {
	
	//날짜 중복 조회
	public int selectDate(ReservationDTO reservationDTO);
	
	//예약추가
	public void insert(ReservationDTO reservationDTO);

}
