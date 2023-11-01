package ez.en.page.camping_thema;

import java.util.List;

public interface ThemaDAO {
	
	public ThemaDTO selectOne(String Thema_code);
	public List<ThemaDTO> list();

}
