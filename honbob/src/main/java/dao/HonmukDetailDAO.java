package dao;

import org.springframework.stereotype.Repository;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
}