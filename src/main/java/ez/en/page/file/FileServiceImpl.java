package ez.en.page.file;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO dao;
	
	
	@Override
	public int fileupload(FileDTO dto) {
		// TODO Auto-generated method stub
		return dao.fileupload(dto);
	}


	@Override
	public Map<String, Object> myprofile(String id) {
		// TODO Auto-generated method stub
		return dao.myprofile(id);
	}

}
