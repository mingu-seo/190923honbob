package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.ReviewVO;



@Repository
public class HonmukMainPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ReviewVO> mainReview(ReviewVO rvo){
		return sqlSession.selectList("Honmuk.mainReview", rvo);
	}
	
	 
	
	

}
