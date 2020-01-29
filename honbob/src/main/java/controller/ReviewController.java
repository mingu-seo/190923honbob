package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import vo.ReviewVO;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ReviewController {
    @RequestMapping(value = "/reviews", method = RequestMethod.GET)
    public ModelAndView reviewListPage(HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("review/reviewList");

        List<ReviewVO> samples = new ArrayList<>();
        ReviewVO review = new ReviewVO();
        review.setSubject("first review");
        review.setContent("N/A");

        ReviewVO review2 = new ReviewVO();
        review2.setSubject("second review");
        review2.setContent("N/A");

        ReviewVO review3 = new ReviewVO();
        review3.setSubject("first review");
        review3.setContent("N/A");

        samples.add(review);
        samples.add(review2);
        samples.add(review3);

        mav.addObject("samples", samples);

        Cookie cookie = new Cookie("hello", "world");
        response.addCookie(cookie);
        return mav;
    }
}
