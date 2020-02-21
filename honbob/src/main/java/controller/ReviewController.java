package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.review.ReviewService;
import util.PagingHelper;
import util.PagingOption;
import vo.RestaurantVO;
import vo.review.ReviewEditRequest;
import vo.review.ReviewVO;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @Autowired


    public void setReviewService(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    //리뷰 목록
    @RequestMapping(path="/reviewList", method=RequestMethod.GET)
    public ModelAndView reviewList(@RequestParam(required = false) Integer page) {
        System.out.println("page: " + page);
        page = (page==null)?1:page;

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
    //식당번호 삽입 시 수정할 부분? => @PathVariable restraurantId
    // 리뷰 작성 페이지를 불러오는 부분부터 식당_ID를 들고 시작
    @RequestMapping(path ={"/reviewWrite"}, method = RequestMethod.GET)
    public ModelAndView reviewWrite(@RequestParam(name="restaurantId", required = false) Integer restaurantId){
        System.out.println("oo");
        if (restaurantId == null) restaurantId = 0;
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewWrite";
        mav.setViewName(pageName);
        mav.addObject("restaurantId", restaurantId);
        return mav;
    }

    //리뷰 작성내용 DB저장
    @RequestMapping(path = "/reviewWrite", method = RequestMethod.POST)
    public ModelAndView reviewWrite(ReviewVO vo, @RequestParam("filename") MultipartFile file, HttpServletRequest request) {
        
    	
        ModelAndView mav = new ModelAndView();
        reviewService.insertReview(vo, file, request.getRealPath("/upload/board/"));
        String pageName = "redirect:/reviewList?page=1";
        mav.setViewName(pageName);
        return mav;
    }

    //리뷰 상세보기
    @RequestMapping(path = "/reviewDetail", method = RequestMethod.GET)
    public ModelAndView reviewDetail(@RequestParam("reviewDocumentId") int reviewDocumentId) {
        ModelAndView mav = new ModelAndView();
        ReviewVO reviewVO = reviewService.getReviewDetail(reviewDocumentId);
        String pageName = "review/reviewDetail";
        mav.setViewName(pageName);
        mav.addObject("review", reviewVO);
        return mav;
    }

    //리뷰 수정폼 불러오기
    @RequestMapping(path = "/reviewEdit", method = RequestMethod.GET)
    public ModelAndView reviewEdit(@RequestParam("reviewDocumentId") int reviewDocumentId) {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewEdit";
        mav.setViewName(pageName);
        ReviewVO review = reviewService.getReviewDetail(reviewDocumentId);
        mav.addObject("review", review);
        return mav;
    }

    //리뷰 수정내용 DB저장
    @RequestMapping(path = "/reviewEdit", method = RequestMethod.POST)
    public ModelAndView reviewEdit(ReviewEditRequest requestVo, @RequestParam("filename") MultipartFile file, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        // DB UPDATE
        reviewService.updateReview(requestVo, file, request.getRealPath("/upload/board/"));

        // AFTER DB UPDATE
        String pageName = "redirect:/reviewList";
        mav.setViewName(pageName);
        return mav;
    }

    //리뷰 삭제
    @RequestMapping(path = "/reviewDelete", method = RequestMethod.POST)
    public ModelAndView reviewDelete(@RequestParam("reviewDocumentId") int reviewDocumentId) {
        ModelAndView mav = new ModelAndView();
        reviewService.deleteReview(reviewDocumentId);
        String pageName = "redirect:/reviewList";
        mav.setViewName(pageName);
        return mav;
    }

    //식당 이름 검색
    @RequestMapping(path ="/searchRestr", method = RequestMethod.GET)
    public ModelAndView searchRestr(){
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewWrite";
        mav.setViewName(pageName);
        return mav;
    }

    //리뷰에 식당 이름 걸기
   @RequestMapping(path = "/matchingRestr", method = RequestMethod.POST)
    public ModelAndView matchingRestr(RestaurantVO vo) {
        ModelAndView mav = new ModelAndView();
//        reviewService.matchingRestr(vo);
        String pageName = "redirect:/reviewList";
        mav.setViewName(pageName);
        return mav;
    }

}
