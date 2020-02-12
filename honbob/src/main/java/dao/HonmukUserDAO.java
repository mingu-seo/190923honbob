package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository
public class HonmukUserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne("user.login",vo);
	}
	
	public int userJoin(UserVO vo) {
		return sqlSession.insert("user.userJoin",vo);
	}
	
	public UserVO search_id(UserVO vo) {
		return sqlSession.selectOne("user.search_id",vo);
	}
	
	public UserVO search_pwd(UserVO vo) {
		return sqlSession.selectOne("user.search_pwd",vo);
	}
	
	public int pwdChange(UserVO vo) {
		return sqlSession.update("user.pwdChange",vo);
	}
	
	public UserVO userInfoView(int userNo) {
		return sqlSession.selectOne("user.userInfoView",userNo);
	}
	
	public int idCheck(String userId) {
		return sqlSession.selectOne("user.idCheck",userId);
	}
	
	public int emailCheck(String userEmail) {
		return sqlSession.selectOne("user.emailCheck",userEmail);
	}
	
	public int userDelete(UserVO vo) {
		return sqlSession.delete("user.userDelete",vo);
	}
	
	public int imageUpdate(UserVO vo) {
		return sqlSession.update("user.imageUpdate",vo);
	}
	
	public int qwdAnswerCheck(String pwdAnswer) {
		return sqlSession.selectOne("user.qwdAnswerCheck",pwdAnswer);
	}
}
