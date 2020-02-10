package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.RestaurantVO;
import vo.ReviewVO;

import java.util.List;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSessionTemplate sqlSession;	
	
//	public List<RestaurantVO> searchList(RestaurantVO resVO){
//		return sqlSession.selectList("Honmuk.searchList", resVO);
//	}

	public List<ReviewVO> getReviews() {
		return sqlSession.selectList("Review.getReviews");
	}

}
