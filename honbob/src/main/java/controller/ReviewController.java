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

    @RequestMapping(path="/reviewEdit", method=RequestMethod.GET)
    public ModelAndView reviewEdit() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewEdit";
        mav.setViewName(pageName);
        return mav;
    }

    @RequestMapping(path="/reviewList", method=RequestMethod.GET)
    public ModelAndView reviewList() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewList";
        mav.setViewName(pageName);
        List<ReviewVO> reviews = reviewService.getLatestReviews();
        mav.addObject("reviews", reviews);
        return mav;
    }

    @RequestMapping(path="/reviewWritePage", method=RequestMethod.GET)
    public ModelAndView reviewWritePage() {
        ModelAndView mav = new ModelAndView();
        String pageName = "review/reviewWrite";
        mav.setViewName(pageName);
        return mav;
    }

}
