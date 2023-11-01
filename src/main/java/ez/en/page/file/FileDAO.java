package ez.en.page.file;

import java.util.Map;

public interface FileDAO {

	public int fileupload(FileDTO dto);
	
	public Map<String, Object> myprofile(String id);
	
}
