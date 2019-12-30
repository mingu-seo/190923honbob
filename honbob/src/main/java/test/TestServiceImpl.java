package test;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO testDao;
	
	public int memberInsert(TestVO vo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/test/"));
		vo.setProfile(fu.fileName);
		int r = testDao.memberInsert(vo);
		return r;
	}

	@Override
	public TestVO memberDetail(int id) {
		TestVO vo = testDao.memberDetail(id);
		return vo;
	}

	@Override
	public int memberUpdate(TestVO vo, MultipartFile file, HttpServletRequest request) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, request.getRealPath("/upload/test/"));
		if (fu.fileName != null && !"".equals(fu.fileName)) {
			vo.setProfile(fu.fileName);
		}
		int r = testDao.memberUpdate(vo);
		return r;
	}

	@Override
	public int memberDelete(int id) {
		int r = testDao.memberDelete(id);
		return r;
	}

	@Override
	public TestVO loginCheck(String mail, String pwd) {
		HashMap hm = new HashMap();
		hm.put("mail", mail);
		hm.put("pwd", pwd);
		TestVO vo = testDao.loginCheck(hm);
		return vo;
	}
}
