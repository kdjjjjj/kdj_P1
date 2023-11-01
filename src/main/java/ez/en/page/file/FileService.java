package ez.en.page.file;

import java.util.Map;

public interface FileService {
	
	public int fileupload(FileDTO dto);
	
	public Map<String, Object> myprofile(String id);
	
}
