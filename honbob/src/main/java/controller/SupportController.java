package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.support.SupportService;
import util.PagingHelper;
import util.PagingOption;
import vo.support.SupportEditRequest;
import vo.support.SupportVO;

@Controller
public class SupportController {
    @Autowired
    private SupportService supportService;

    public void setSupportService(SupportService supportService) {
        this.supportService = supportService;
    }

    //문의 목록 (내가 작성한 문의만 노출)
    @RequestMapping(path = "/supportList", method = RequestMethod.GET)
    public ModelAndView supportList(HttpServletRequest request, @RequestParam(required = false) Integer page) {
    	page = (page==null)?1:page;
    	PagingOption pagingOption = new PagingOption(PagingHelper.ITEM_PER_PAGE, page);
    	int totalReviews = supportService.countSupport();
        int totalPages = PagingHelper.calculateTotalPages(totalReviews);
        
//        HttpSession session = request.getSession();
//        TestVO testVO = (TestVO) session.getAttribute("adminSession");
//        int userId = testVO.getId();
        // TODO 로그인 미구현이므로, 세션에서 유저 정보를 가져올 수 가 없는 상태
        int userId = 1;
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportList";
        mav.setViewName(pageName);
        List<SupportVO> supports = supportService.getLatestSupports(pagingOption);
        System.out.print(supports);
        mav.addObject("supports", supports);
        mav.addObject("totalPages", totalPages);
        mav.addObject("currentPage", page);
        return mav;

    }

    //문의 상세보기
    @RequestMapping(path = "/supportDetail", method = RequestMethod.GET)
    public ModelAndView supportDetail(@RequestParam("supportDocumentId") int supportDocumentId) {
        ModelAndView mav = new ModelAndView();
        SupportVO supportVO = supportService.getSupportDetail(supportDocumentId);
        String pageName = "support/supportDetail";
        mav.setViewName(pageName);
        mav.addObject("support", supportVO);
        return mav;
    }

    //문의 삭제
    @RequestMapping(path = "/supportDelete", method = RequestMethod.POST)
    public ModelAndView supportDelete(@RequestParam("supportDocumentId") int supportDocumentId) {
        ModelAndView mav = new ModelAndView();
        supportService.deleteSupport(supportDocumentId);
        String pageName = "redirect:/supportList";
        mav.setViewName(pageName);
        return mav;
    }

    //문의 수정폼 불러오기
    @RequestMapping(path = "/supportEdit", method = RequestMethod.GET)
    public ModelAndView supportEdit(@RequestParam("supportDocumentId") int supportDocumentId) {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportEdit";
        mav.setViewName(pageName);
        SupportVO support = supportService.getSupportDetail(supportDocumentId);
        mav.addObject("support", support);
        return mav;
    }

    //문의 수정내용 DB저장
    @RequestMapping(path = "/supportEdit", method = RequestMethod.POST)
    public ModelAndView supportEdit(SupportEditRequest requestVo) {
        ModelAndView mav = new ModelAndView();
        // DB UPDATE
        supportService.updateSupport(requestVo);

        // AFTER DB UPDATE
        mav.addObject("message", "정상적으로 변경되었습니다.");
        mav.addObject("url", "/honbob/supportList");
        //String pageName = "redirect:/supportList";
        String pageName = "common/alert";
        mav.setViewName(pageName);
        return mav;
    }

    //문의 작성폼 불러오기
    @RequestMapping(path = "/supportWrite", method = RequestMethod.GET)
    public ModelAndView supportWrite() {
        ModelAndView mav = new ModelAndView();
        String pageName = "support/supportWrite";
        mav.setViewName(pageName);
        return mav;
    }

    //문의 작성내용 DB저장
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

