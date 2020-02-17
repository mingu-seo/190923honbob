package dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository
public class HonmukUserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 로그인
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne("user.login",vo);
	}
	// 회원가입
	public int userJoin(UserVO vo) {
		return sqlSession.insert("user.userJoin",vo);
	}
	// 아이디 찾기
	public UserVO search_id(UserVO vo) {
		return sqlSession.selectOne("user.search_id",vo);
	}
	// 비밀번호 찾기
	public UserVO search_pwd(UserVO vo) {
		return sqlSession.selectOne("user.search_pwd",vo);
	}
	// 비밀번호 변경(마이페이지)
	public int pwdChange(UserVO vo) {
		return sqlSession.update("user.pwdChange",vo);
	}
	// 내정보(마이페이지)
	public UserVO userInfoView(int userNo) {
		return sqlSession.selectOne("user.userInfoView",userNo);
	}
	// 사진 변경(마이페이지)
	public int imageUpdate(UserVO vo) {
		return sqlSession.update("user.imageUpdate",vo);
	}
	
	// 별명 변경(마이페이지)
	public int nameUpdate(UserVO vo) {
		return sqlSession.update("user.nameUpdate",vo);
	}
	// 별명 중복 체크(마이페이지)
	public int nameCheck(UserVO vo) {
		return sqlSession.selectOne("user.nameCheck",vo);
	}
	// 아이디 중복 체크(회원가입)
	public int idCheck(String userId) {
		return sqlSession.selectOne("user.idCheck",userId);
	}
	// 이메일 체크(회원가입)
	public int emailCheck(String userEmail) {
		return sqlSession.selectOne("user.emailCheck",userEmail);
	}
	// 회원탈퇴
	public int userDelete(UserVO vo) {
		return sqlSession.delete("user.userDelete",vo);
	}
	// 질문과 질문에 대한 답 체크(비밀번호 찾기)
	public int qwdAnswerCheck(Map map) {
		return sqlSession.selectOne("user.qwdAnswerCheck",map);
	}
	// 비밀번호 변경(비밀번호 찾기)
	public int pwdUpdate (UserVO vo) {
		return sqlSession.update("user.pwdUpdate",vo);
	}
}
