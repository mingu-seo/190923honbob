package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.support.SupportService;
import vo.support.SupportEditRequest;
import vo.support.SupportVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SupportController {
    @Autowired
    private SupportService supportService;

    public void setSupportService(SupportService supportService) {
        this.supportService = supportService;
    }

    @RequestMapping(path = "/supportList", method = RequestMethod.GET)
    public ModelAndView supportList(HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        TestVO testVO = (TestVO) session.getAttribute("adminSession");
//        int userId = testVO.getId();
        // TODO 로그인 미구현이므로, 세션에서 유저 정보를 가져올 수 가 없는 상태
        int userId = 1;
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportList";
        mav.setViewName(pageName);
        List<SupportVO> supports = supportService.getLatestSupports(userId);
        System.out.print(supports);
        mav.addObject("supports", supports);
        return mav;

    }

    @RequestMapping(path = "/supportDetail/{supportDocumentId}", method = RequestMethod.GET)
    public ModelAndView supportDetail(@PathVariable int supportDocumentId) {
        ModelAndView mav = new ModelAndView();
        SupportVO supportVO = supportService.getSupportDetail(supportDocumentId);
        String pageName = "support/supportDetail";
        mav.setViewName(pageName);
        mav.addObject("support", supportVO);
        return mav;
    }

    @RequestMapping(path = "/supportDelete/{supportDocumentId}", method = RequestMethod.POST)
    public ModelAndView supportDelete(@PathVariable int supportDocumentId) {
        ModelAndView mav = new ModelAndView();
        supportService.deleteSupport(supportDocumentId);
        String pageName = "redirect:/supportList";
        mav.setViewName(pageName);
        return mav;
    }

    @RequestMapping(path = "/supportEdit/{supportDocumentId}", method = RequestMethod.GET)
    public ModelAndView supportEdit(@PathVariable int supportDocumentId) {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportEdit";
        mav.setViewName(pageName);
        SupportVO support = supportService.getSupportDetail(supportDocumentId);
        mav.addObject("support", support);
        return mav;
    }

    @RequestMapping(path = "/supportEdit", method = RequestMethod.POST)
    public ModelAndView supportEdit(SupportEditRequest requestVo) {
        ModelAndView mav = new ModelAndView();
        // DB UPDATE
        supportService.updateSupport(requestVo);

        // AFTER DB UPDATE
        mav.addObject("message", "정상적으로 변경되었습니다.");
        mav.addObject("url", "/supportList");
        //String pageName = "redirect:/supportList";
        String pageName = "common/alert";
        mav.setViewName(pageName);
        return mav;
    }

    @RequestMapping(path = "/supportWrite", method = RequestMethod.GET)
    public ModelAndView supportWrite() {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportWrite";
        mav.setViewName(pageName);
        return mav;
    }

    @RequestMapping(path = "/supportWrite", method = RequestMethod.POST)
    public ModelAndView supportWrite(SupportVO vo) {
        ModelAndView mav = new ModelAndView();
        // Call SupportWrite Service Method Call
        supportService.insertSupport(vo);
        System.out.println(vo);
        ////
        String pageName = "redirect:/supportList";
        mav.setViewName(pageName);
        return mav;
    }
}

