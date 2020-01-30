package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.RestaurantImageVO;
import vo.RestaurantVO;

@Repository
public class HonmukDetailDAO {

	@Autowired
	SqlSessionTemplate sqlSession;	
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		return sqlSession.selectList("Honmuk.searchList", resVO);
	}  
	
	public int count() {
		return sqlSession.selectOne("Honmuk.searchCount");
	}

	public List<RestaurantVO> getList() {
		
		return sqlSession.selectList("Honmuk.getList");
	}

	public int registImageVO(RestaurantImageVO resImageVo) {
		return sqlSession.insert("Honmuk.registImageVO", resImageVo);
	}
}
