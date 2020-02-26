package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.HonmukUserDAO;
import util.FileUtil;
import vo.UserVO;
import vo.review.ReviewVO;
import vo.support.SupportVO;

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
		return honmukUserDAO.imageUpdate(vo);
	}
	
	// 별명 변경(마이페이지)
	public int nameUpdate(UserVO vo) {
		return honmukUserDAO.nameUpdate(vo);
	}
	
	// 나의 리뷰글(마이페이지)
	public List<ReviewVO> myReviewList(UserVO uv) {
		return honmukUserDAO.myReviewList(uv);
	}
	
	// 나의 QnA(마이페이지)
	public List<SupportVO> myQnAList(UserVO uv) {
		return honmukUserDAO.myQnAList(uv);
	}
	
	// 페이징 처리(myReview)
	public int ReviewListCount(UserVO uv) {
		int listcount = honmukUserDAO.ReviewListCount(uv);
		return listcount;
	}
	
	// 페이징 처리(myQnA)
	public int QnAListCount(UserVO uv) {
		int listcount = honmukUserDAO.QnAListCount(uv);
		return listcount;
	}
	
	
 	
	// 별명 중복 체크(회원가입)
	public int nameCheck (UserVO vo) {
		return honmukUserDAO.nameCheck(vo);
	}
	
	// 아이디 중복 체크(회원가입)
	public int idCheck (String userId) {
		return honmukUserDAO.idCheck(userId); 
	}
	
	// 이메일 중복 체크(회원가입)
	public int emailCheck (String userEmail) {
		return honmukUserDAO.emailCheck(userEmail);
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
	public int qwdAnswerCheck(String pwdQuestion, String pwdAnswer) {
		Map map = new HashMap();
		map.put("pwdQuestion", pwdQuestion);
		map.put("pwdAnswer", pwdAnswer);
		return honmukUserDAO.qwdAnswerCheck(map);
	}
	
	// 비밀번호 변경(비밀번호 찾기)
	public int pwdUpdate(String userEmail, String pwdNum) {
		UserVO uv = new UserVO();
		uv.setUserEmail(userEmail);
		uv.setUserPassword(pwdNum);
		return honmukUserDAO.pwdUpdate(uv);
	}

}
