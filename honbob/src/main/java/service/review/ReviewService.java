package service.review;

import dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.PagingOption;
import vo.review.ReviewEditRequest;
import vo.review.ReviewVO;
import vo.support.SupportEditRequest;

import java.util.Calendar;
import java.util.List;

@Service
public class ReviewService {
    @Autowired
    private ReviewDAO reviewDao;

    public int countReviews() {
        return reviewDao.countReviews();
    }

    public List<ReviewVO> getLatestReviews(PagingOption pagingOption) {
        List<ReviewVO> results = reviewDao.getReviews(pagingOption);
        // Business Logic here
        return results;
    }

    public void insertReview(ReviewVO vo) {
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        vo.setRegistdate(date);
        vo.setUser_userId("1");
        reviewDao.insertReview(vo);
    }

    public ReviewVO getReviewDetail(int reviewDocumentId) {
        ReviewVO reviewVO = reviewDao.getReview(reviewDocumentId);
        return reviewVO;
    }

    public void updateReview(ReviewEditRequest requestVo) {
        reviewDao.updateReview(requestVo);
    }

    public void deleteReview(int reviewDocumentId) { reviewDao.deleteReview(reviewDocumentId);

    }
}

