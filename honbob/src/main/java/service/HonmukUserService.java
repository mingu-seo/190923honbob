package service;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.HonmukUserDAO;
import util.FileUtil;
import vo.UserVO;

@Service
public class HonmukUserService {

	@Autowired
	HonmukUserDAO honmukUserDAO;
	
	// 로그인
	public UserVO login(UserVO vo) {
		return honmukUserDAO.login(vo);
	}
	
	// 회원가입
	public int userJoin(UserVO vo) {
		return honmukUserDAO.userJoin(vo);
	}
	
	// 아이디 찾기
	public UserVO search_id (UserVO vo) {
		return honmukUserDAO.search_id(vo);
	}
	
	// 비밀번호 찾기
	public UserVO search_pwd (UserVO vo) {
		return honmukUserDAO.search_pwd(vo);
	}
	
	// 비밀번호 변경(마이페이지)
	public int pwdChange (UserVO vo) {
		return honmukUserDAO.pwdChange(vo);
	}
	
	// 내정보(마이페이지)
	public UserVO userInfoView (int userNo) {
		return honmukUserDAO.userInfoView(userNo);
	}
	
	// 사진 변경(마이페이지)
	public int imageUpdate(UserVO vo, MultipartFile file, HttpServletRequest req) {
		FileUtil fu = new FileUtil();
		fu.fileUpload(file,req.getRealPath("/images/"));
		vo.setUserImage(fu.fileName);
		return honmukUserDAO.imageUpdate(vo);
	}
	
	// 아이디 중복 체크(회원가입)
	public int idCheck (String userId) {
		return honmukUserDAO.idCheck(userId);
	}
	
	// 이메일 중복 체크(회원가입)
	public int emailCheck (String userEmail) {
		return honmukUserDAO.idCheck(userEmail);
	}
	
	// 이메일 중복 체크(회원가입)
	public int emailPwdCheck(String emailPwdNumber, String emailPwd) {
		int r = 0;
		
		if (emailPwdNumber.equals(emailPwd)) {
			r = 1;
		}
		return r;
	}
	
	// 회원탈퇴
	public int userDelete (UserVO vo) {
		return honmukUserDAO.userDelete(vo);
	}
	
	// 랜덤 12자리 (특문+숫자+영문) 생성
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
	
	// 질문과 질문에 대한 답 체크(비밀번호 찾기)
	public int qwdAnswerCheck(String pwdAnswer) {
		return honmukUserDAO.qwdAnswerCheck(pwdAnswer);
	}
	
	// 비밀번호 변경(비밀번호 찾기)
	public int pwdUpdate(String pwdNum) {
		return honmukUserDAO.pwdUpdate(pwdNum);
	}

}
