package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.RestaurantVO;
import vo.review.ReviewVO;



@Repository
public class HonmukMainPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<RestaurantVO> mainList(vo.RestaurantVO rvo){
		return sqlSession.selectList("Honmuk.mainList", rvo);
	}
	
	 
	
	

}
