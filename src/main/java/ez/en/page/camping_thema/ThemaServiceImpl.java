package ez.en.page.camping_thema;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ThemaServiceImpl implements ThemaService {

	@Inject
	private ThemaDAO themaDAO;
	
	@Override
	public ThemaDTO selectOne(String Thema_code) {
		// TODO Auto-generated method stub
		return themaDAO.selectOne(Thema_code);
	}

	@Override
	public List<ThemaDTO> list() {
		// TODO Auto-generated method stub
		return themaDAO.list();
	}

}
