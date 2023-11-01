package ez.en.page.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAOImpl dao;

	@Override
	public List<NoticeDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public int insert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public NoticeDTO selectOne(int n_code) {
		// TODO Auto-generated method stub
		return dao.selectOne(n_code);
	}

	@Override
	public int delete(int n_code) {
		// TODO Auto-generated method stub
		return dao.delete(n_code);
	}
}
