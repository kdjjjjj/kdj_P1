package ez.en.page.onetoone;

import java.util.List;

public interface OnetooneDAO {

	public List<OnetooneDTO> listAll();

	public List<OnetooneDTO> SELECTONE(String id);

	public OnetooneDTO selectOne(int o_code);

	public int insert(OnetooneDTO dto);

	public int update(OnetooneDTO dto);

	public int delete(int o_code);
	//댓글 쓰기
	public int reply(Onetoone_reply onetoone_reply); 
	//게시물번호에 해당하는 댓글 조회
	public List<Onetoone_reply> getDetail(int rp_code);
	//댓글 수정보기를 위한 메소드(수정폼)
	public Onetoone_reply detailReply(int rp_code);
	//댓글수정을 처리하기위한 메소드
	public int replyupdate(Onetoone_reply onetoone_reply);
	//댓글 삭제를 처리하기 위한 메소드
	public int replyDelete(int rp_code);

}
