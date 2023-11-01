package ez.en.page.reservation;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Inject
	private ReservationDAO reservationDAO;
	
	@Override
	public void insert(ReservationDTO reservationDTO) {
		reservationDAO.insert(reservationDTO);
	}

	@Override
	public int selectDate(ReservationDTO reservationDTO) {
		return reservationDAO.selectDate(reservationDTO);
	}

}
