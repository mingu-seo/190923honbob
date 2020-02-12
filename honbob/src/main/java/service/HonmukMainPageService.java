package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HonmukMainPageDAO;
import vo.review.ReviewVO;

@Service
public class HonmukMainPageService {
	
	@Autowired
	private HonmukMainPageDAO mainpageDAO;
	
	public List<ReviewVO> mainReview(ReviewVO rvo){
		return mainpageDAO.mainReview(rvo);
	}

	

}
