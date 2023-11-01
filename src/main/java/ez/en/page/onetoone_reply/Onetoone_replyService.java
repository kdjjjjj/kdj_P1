package ez.en.page.onetoone_reply;

import java.util.List;

public interface Onetoone_replyService {
	
	public List<Onetoone_replyDTO> listAll();
	
	public Onetoone_replyDTO selectOne2(int rp_code);
	
	public int insert2(Onetoone_replyDTO rdto);
	
	public int update2(Onetoone_replyDTO rdto);
	
	public int delete2(int rp_code);	
}
