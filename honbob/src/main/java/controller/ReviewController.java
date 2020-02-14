package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.review.ReviewService;
import util.PagingHelper;
import util.PagingOption;
import vo.review.ReviewEditRequest;
import vo.review.ReviewVO;


import java.util.List;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    public void setReviewService(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    //리뷰 목록
    @RequestMapping(path="/reviewList", method=RequestMethod.GET)
    public ModelAndView reviewList(@RequestParam(required = false) Integer page) {
        System.out.println("page: " + page);
        page = (page==0)?1:page;

        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewList";
        mav.setViewName(pageName);
        PagingOption pagingOption = new PagingOption(PagingHelper.ITEM_PER_PAGE, page);

        List<ReviewVO> reviews = reviewService.getLatestReviews(pagingOption);
        mav.addObject("reviews", reviews);
        int totalReviews = reviewService.countReviews();
        int totalPages = PagingHelper.calculateTotalPages(totalReviews);
        mav.addObject("totalPages", totalPages);
        mav.addObject("currentPage", page);
        return mav;
    }

    //리뷰 작성폼 불러오기
    @RequestMapping(path ="/reviewWrite", method = RequestMethod.GET)
    public ModelAndView reviewWrite(){
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewWrite";
        mav.setViewName(pageName);
        return mav;
    }

    //리뷰 작성내용 DB저장
    @RequestMapping(path = "/reviewWrite", method = RequestMethod.POST)
    public ModelAndView reviewWrite(ReviewVO vo) {
        ModelAndView mav = new ModelAndView();
        reviewService.insertReview(vo);
        String pageName = "redirect:/reviewList";
        mav.setViewName(pageName);
        return mav;
    }

    //리뷰 상세보기
    @RequestMapping(path = "/reviewDetail/{reviewDocumentId}", method = RequestMethod.GET)
    public ModelAndView reviewDetail(@PathVariable int reviewDocumentId) {
        ModelAndView mav = new ModelAndView();
        ReviewVO reviewVO = reviewService.getReviewDetail(reviewDocumentId);
        String pageName = "review/reviewDetail";
        mav.setViewName(pageName);
        mav.addObject("review", reviewVO);
        return mav;
    }

    //리뷰 수정폼 불러오기
    @RequestMapping(path = "/reviewEdit/{reviewDocumentId}", method = RequestMethod.GET)
    public ModelAndView reviewEdit(@PathVariable int reviewDocumentId) {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewEdit";
        mav.setViewName(pageName);
        ReviewVO review = reviewService.getReviewDetail(reviewDocumentId);
        mav.addObject("review", review);
        return mav;
    }

    //리뷰 수정내용 DB저장
    @RequestMapping(path = "/reviewEdit", method = RequestMethod.POST)
    public ModelAndView reviewEdit(ReviewEditRequest requestVo) {
        ModelAndView mav = new ModelAndView();
        // DB UPDATE
        reviewService.updateReview(requestVo);

        // AFTER DB UPDATE
        String pageName = "redirect:/reviewList";
        mav.setViewName(pageName);
        return mav;
    }

    //리뷰 삭제
    @RequestMapping(path = "/reviewDelete/{reviewDocumentId}", method = RequestMethod.POST)
    public ModelAndView reviewDelete(@PathVariable int reviewDocumentId) {
        ModelAndView mav = new ModelAndView();
        reviewService.deleteReview(reviewDocumentId);
        String pageName = "redirect:/reviewList";
        mav.setViewName(pageName);
        return mav;
    }

}
