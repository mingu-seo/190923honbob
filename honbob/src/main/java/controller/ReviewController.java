package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.review.ReviewService;
import vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    public void setReviewService(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @RequestMapping(path="/reviewDetail", method=RequestMethod.GET)
    public ModelAndView reviewDetail() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewDetail";
        mav.setViewName(pageName);
        return mav;
    }

    /* @RequestMapping(path="/reviewReply", method=RequestMethod.GET)
     public ModelAndView reviewReply() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewDetail";
        mav.setViewName(pageName);
        return mav;

    reviewDetail 페이지에 함께 보여지며 작성 시 바로 업데이트
    댓글보여주는 매핑과 댓글작성 매핑을 별개로 제작? */


    @RequestMapping(path="/reviewEdit", method=RequestMethod.GET)
    public ModelAndView reviewEdit() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewEdit";
        mav.setViewName(pageName);
        return mav;
    }

    /* @RequestMapping(path="/reviewSave", method=RequestMethod.GET)
    jsp페이지도 없고 ModelAndView도 아닐거같음*/

    /* @RequestMapping(path="/reviewDelete", method=RequestMethod.GET)
    jsp페이지도 없고 ModelAndView도 아닐거같음*/

    @RequestMapping(path="/reviewList", method=RequestMethod.GET)
    public ModelAndView reviewList() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewList";
        mav.setViewName(pageName);
        List<ReviewVO> reviews = reviewService.getLatestReviews();
        mav.addObject("reviews", reviews);
        return mav;
    }



    /* @RequestMapping(path="/supportDelete", method=RequestMethod.GET)
    jsp페이지도 없고 ModelAndView도 아닐거같음*/

    @RequestMapping(path="/reviews", method=RequestMethod.POST)
    public ModelAndView reviews(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewWrite";
        mav.setViewName(pageName);
        String boardName = request.getParameter("board_name");
        String boardPass = request.getParameter("board_pass");
        System.out.println(boardName + " " + boardPass);
        return mav;
    }

    @RequestMapping(path="/writeForm", method=RequestMethod.GET)
    public ModelAndView writeForm() {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/writeForm";
        mav.setViewName(pageName);
        return mav;
    }

}
