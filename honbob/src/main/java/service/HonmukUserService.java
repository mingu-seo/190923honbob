package service;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class HonmukUserService {

	@Autowired
	HonmukUserDAO honmukUserDAO;
	
	
	public UserVO login(UserVO vo) {
		return honmukUserDAO.login(vo);
	}

	public int userJoin(UserVO vo) {
		return honmukUserDAO.userJoin(vo);
	}
	
	public UserVO search_id (UserVO vo) {
		return honmukUserDAO.search_id(vo);
	}
	
	public UserVO search_pwd (UserVO vo) {
		return honmukUserDAO.search_pwd(vo);
	}
	
	public int pwdChange (UserVO vo) {
		return honmukUserDAO.pwdChange(vo);
	}
	
	public UserVO userInfoView (int userNo) {
		return honmukUserDAO.userInfoView(userNo);
	}
	
	public int idCheck (String userId) {
		return honmukUserDAO.idCheck(userId);
	}
	
	public int emailCheck (String userEmail) {
		return honmukUserDAO.idCheck(userEmail);
	}
	
	public int userDelete (UserVO vo) {
		return honmukUserDAO.userDelete(vo);
	}

	public int adminLogin(AdminVO vo) {
		return honmukUserDAO.adminLogin(vo);
	}
	
	public int imageUpdate(UserVO vo, MultipartFile file, HttpServletRequest req) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file,req.getRealPath("/images/"));
		vo.setUserImage(fu.fileName);
		return honmukUserDAO.imageUpdate(vo);
	}
	
	public String emailPass() {
		char[] emailPwd = { 'A','B','C','D','E','F','G','H','I','J','K','L',
				   'M','N','O','P','Q','R','S','T','U','V','W','X',
				   'Y','Z','!','#','$','%','&','*','1','2','3','4',
				   '5','6','7','8','9','0'};
		
		Random random = new Random(System.currentTimeMillis());
		StringBuffer buf = new StringBuffer();
		int length = emailPwd.length;
		
		for (int i=0 ; i<12 ; i++) {
			buf.append(emailPwd[random.nextInt(length)]);
		}
		return buf.toString();
	}
	
	
	
	public int emailPwdCheck(String emailPwdNumber, String emailPwd) {
		int r = 0;
		
		if (emailPwdNumber.equals(emailPwd)) {
			r = 1;
		}
		return r;
	}
	
	
	public int qwdAnswerCheck(String pwdAnswer) {
		return honmukUserDAO.qwdAnswerCheck(pwdAnswer);
	}

}
