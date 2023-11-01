package ez.en.page.reservation;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "ez.en.page.reservationMapper.";
	
	@Override
	public void insert(ReservationDTO reservationDTO) {
		sqlSession.insert(namespace+"insert", reservationDTO);
	}

	@Override
	public int selectDate(ReservationDTO reservationDTO) {
		return sqlSession.selectOne(namespace+"selectDate", reservationDTO);
	}

}
