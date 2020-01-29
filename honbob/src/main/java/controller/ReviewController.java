package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ReviewController {
    @RequestMapping("/review")
    public ModelAndView reviewListPage(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("reviewList");
        mav.addObject("dataSample", "12345");
        Cookie cookie = new Cookie("hello", "world");
        response.addCookie(cookie);
        return mav;

    }
}
