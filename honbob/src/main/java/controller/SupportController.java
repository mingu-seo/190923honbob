package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.support.SupportService;
import vo.SupportVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SupportController {

    @Autowired
    private SupportService supportService;

    public void setSupportService(SupportService supportService) {this.supportService = supportService; }

    @RequestMapping(path="/supportList", method=RequestMethod.GET)
    public ModelAndView supportList(HttpServletRequest request) {
        HttpSession session = request.getSession();
//        int userId = (int) session.getAttribute("userId");
        int userId = 1;
        /////
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportList";
        mav.setViewName(pageName);
        List<SupportVO> supports = supportService.getLatestSupports(userId);
        System.out.print(supports);
        mav.addObject("supports", supports);
        return mav;

    }
    @RequestMapping(path = "/supportDetail", method = RequestMethod.GET)
    public ModelAndView supportDetail(){
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportDetail";
        mav.setViewName(pageName);
        return mav;
    }

    /*
    @RequestMapping(path = "/supportReply", method = RequestMethod.GET)
    public ModelAndView supportReply(){
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportDetail";
        mav.setViewName(pageName);
        return mav;
    } */

//    @RequestMapping(path = "/supportReply", method = RequestMethod.POST)
//    public ModelAndView supportReply(HttpServletRequest request){
//        ModelAndView mav = new ModelAndView();
//        String pageName = "support/supportDetail";
//        mav.setViewName(pageName);
//        request.getParameter(user_id);
//
//        return mav;
//    }
//

    @RequestMapping(path="/supportEdit", method=RequestMethod.GET)
    public ModelAndView supportEdit() {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportEdit";
        mav.setViewName(pageName);
        return mav;
    }

    @RequestMapping(path = "/supportWrite", method=RequestMethod.GET)
    public ModelAndView supportWrite(){
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportWrite";
        mav.setViewName(pageName);
        return mav;
    }
    /*
    @RequestMapping (path="/supportSave", method=RequestMethod.POST)
    public ModelAndView supportSave(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportWrite";
        mav.setViewName(pageName);
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        System.out.println(subject+""+content);
        return mav;
    }
    */



}
