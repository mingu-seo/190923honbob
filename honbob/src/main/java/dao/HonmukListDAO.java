package dao;

import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.RestaurantVO;

@Repository
public class HonmukListDAO {

	@Autowired
	SqlSessionTemplate sqlSession;	
	
	public List<RestaurantVO> searchList(RestaurantVO resVO){		
		return sqlSession.selectList("Honmuk.searchList", resVO); 
	}  
	
	public int count(RestaurantVO resVO) {
		return sqlSession.selectOne("Honmuk.searchCount", resVO);
	}
	
	public List<RestaurantVO> visitList(List<String> visit_num){
		RestaurantVO resVO = new RestaurantVO();
		resVO.setVisit_num(visit_num);
		return sqlSession.selectList("Honmuk.visitList", resVO);
	}
	
}
