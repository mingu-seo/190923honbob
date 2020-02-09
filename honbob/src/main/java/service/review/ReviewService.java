package service.review;

import dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.ReviewVO;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class ReviewService {
    @Autowired
    private ReviewDAO reviewDao;

    public List<ReviewVO> getLatestReviews() {
        List<ReviewVO> results = reviewDao.getReviews();
        // Business Logic here
        return results;
    }
}
