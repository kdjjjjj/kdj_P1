package ez.en.page.onetoone_reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Onetoone_replyServiceImpl implements Onetoone_replyService {
	
	@Autowired
	Onetoone_replyDAOImpl dao;

	@Override
	public List<Onetoone_replyDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public Onetoone_replyDTO selectOne2(int rp_code) {
		// TODO Auto-generated method stub
		return dao.selectOne2(rp_code);
	}

	@Override
	public int insert2(Onetoone_replyDTO rdto) {
		// TODO Auto-generated method stub
		return dao.insert2(rdto);
	}

	@Override
	public int update2(Onetoone_replyDTO rdto) {
		// TODO Auto-generated method stub
		return dao.update2(rdto);
	}

	@Override
	public int delete2(int rp_code) {
		// TODO Auto-generated method stub
		return dao.delete2(rp_code);
	}
}

