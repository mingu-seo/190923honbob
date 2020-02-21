package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import util.PagingOption;
import vo.review.ReviewEditRequest;
import vo.review.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSessionTemplate sqlSession;


	public List<ReviewVO> getReviews(PagingOption pagingOption) {
		return sqlSession.selectList("Review.getReviews", pagingOption);
	}

	public void insertReview(ReviewVO vo) {
		int result = sqlSession.insert("Review.insertReview", vo);
	}

	public ReviewVO getReview(int reviewDocumentId) {
		ReviewVO vo = sqlSession.selectOne("Review.getReview", reviewDocumentId);
		return vo;
	}

	public void updateReview(ReviewEditRequest requestVo) {
		sqlSession.update("Review.updateReview", requestVo);
	}

    public void deleteReview(int reviewDocumentId) { int result = sqlSession.delete("Review.deleteReview", reviewDocumentId);

    }

    public int countReviews() {
		int theNumOfReviews = sqlSession.selectOne("Review.countReviews");
		return theNumOfReviews;
	}
    
    public int insertFile(Map map) {
    	return sqlSession.insert("Review.insertFile", map);
    }
    
    public int deleteFile(int id) {
    	return sqlSession.delete("Review.deleteFile", id);
    }

//    public void matchingRestr(RestaurantVO vo) {sqlSession.
//    }
}

