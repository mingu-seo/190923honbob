package service.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ReviewDAO;
import util.FileUtil;
import util.PagingOption;
import vo.review.ReviewEditRequest;
import vo.review.ReviewVO;

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

    public void insertReview(ReviewVO vo, MultipartFile file, String uploadPath) {
    	// 파일업로드 처리
    	reviewDao.insertReview(vo);
    	
    	if (file != null) {
			FileUtil f = new FileUtil();
			f.fileUpload(file, uploadPath);
			
			Map map = new HashMap();
			map.put("name", f.fileName);
			map.put("parent_id", vo.getId());
			reviewDao.insertFile(map);
    	}
		
    }

    public ReviewVO getReviewDetail(int reviewDocumentId) {
        ReviewVO reviewVO = reviewDao.getReview(reviewDocumentId);
        return reviewVO;
    }

    public void updateReview(ReviewEditRequest requestVo, MultipartFile file, String uploadPath) {
        reviewDao.updateReview(requestVo);
        if (file != null) {
			FileUtil f = new FileUtil();
			f.fileUpload(file, uploadPath);
			
			Map map = new HashMap();
			map.put("name", f.fileName);
			map.put("parent_id", requestVo.getId());
			reviewDao.deleteFile(requestVo.getId());
			reviewDao.insertFile(map);
    	}
    }

    public void deleteReview(int reviewDocumentId) { reviewDao.deleteReview(reviewDocumentId);

    }

//    public void matchingRestr(RestaurantVO vo) {reviewDao.matchingRestr(vo);
//    }
}

