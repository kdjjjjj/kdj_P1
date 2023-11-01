package ez.en.page.onetoone;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OnetooneServiceImpl implements OnetooneService {
	
	@Autowired
	private OnetooneDAO dao;

	@Override
	public List<OnetooneDTO> listAll() {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public int insert(OnetooneDTO dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(OnetooneDTO dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public OnetooneDTO selectOne(int o_code) {
		// TODO Auto-generated method stub
		return dao.selectOne(o_code);
	}

	@Override
	public int delete(int o_code) {
		// TODO Auto-generated method stub
		return dao.delete(o_code);
	}

	@Override
	public List<OnetooneDTO> SELECTONE(String id) {
		// TODO Auto-generated method stub
		return dao.SELECTONE(id);
	}

	@Override
	public int reply(Onetoone_reply onetoone_reply) {
		// TODO Auto-generated method stub
		return dao.reply(onetoone_reply);
	}

	@Override
	public List<Onetoone_reply> getDetail(int rp_code) {
		// TODO Auto-generated method stub
		return dao.getDetail(rp_code);
	}

	@Override
	public Onetoone_reply detailReply(int rp_code) {
		// TODO Auto-generated method stub
		return dao.detailReply(rp_code);
	}

	@Override
	public int replyupdate(Onetoone_reply onetoone_reply) {
		// TODO Auto-generated method stub
		return dao.replyupdate(onetoone_reply);
	}

	@Override
	public int replyDelete(int rp_code) {
		// TODO Auto-generated method stub
		return dao.replyDelete(rp_code);
	}
}