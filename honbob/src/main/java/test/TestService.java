package test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface TestService {

	public int memberInsert(TestVO vo, MultipartFile file, HttpServletRequest request);
	public TestVO memberDetail(int id);
	public int memberUpdate(TestVO vo, MultipartFile file, HttpServletRequest request);
	public int memberDelete(int id);
	public TestVO loginCheck(String mail, String pwd);
	
}
