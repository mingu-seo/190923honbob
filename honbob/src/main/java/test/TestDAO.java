package test;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TestVO> memberList(TestVO vo) {
		return sqlSession.selectList("test.selectMember", vo);
	}
	
	public int memberInsert(TestVO vo) {
		return sqlSession.insert("test.insertMember", vo);
	}
	
	public TestVO memberDetail(int id) {
		return sqlSession.selectOne("test.memberDetail", id);
	}
	
	public int memberUpdate(TestVO vo) {
		return sqlSession.update("test.updateMember", vo);
	}
	
	public int memberDelete(int id) {
		return sqlSession.delete("test.deleteMember", id);
	}
	
	public TestVO loginCheck(HashMap hm) {
		return sqlSession.selectOne("test.loginCheck", hm);
	}
	
	
	
	
	
	
	
	
	
}
