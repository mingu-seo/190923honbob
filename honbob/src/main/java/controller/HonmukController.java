package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.HonmukDetailService;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import util.PageInfo;
import util.Page;


@Controller
public class HonmukController {
	
	@Autowired
	private HonmukDetailService hmDetailService;
	
	//메인페이지에서 키워드로 검색시 경로
	@RequestMapping("/searchList.do")
	public String searchKeyword(Model model, RestaurantVO resVO, @RequestParam(name="page", required = false) String page,
			HttpServletRequest request, @RequestParam(name="filter1", required = false) String filter1,
			@RequestParam(name="keyword", required = false) String keyword) {
		
		//필터창 정렬순 지정
		if("grade".equals(filter1)) {
			resVO.setGrade(1);
		}else if("reviewcount".equals(filter1)) {
			resVO.setReviewcount(1);
		}else if("readcount".equals(filter1)) {
			resVO.setReadcount(1);
		}
		
		//기본 검색값 별점순
		if(resVO.getGrade()==0 && resVO.getReadcount() ==0 && resVO.getReviewcount()==0) {
			resVO.setGrade(1);
		}
		
		//하단부 페이징
		Page Page = new Page();
		int listCount = hmDetailService.count();
		PageInfo pageInfo = Page.page(page, listCount);
		model.addAttribute("pageInfo", pageInfo);
		
		model.addAttribute("resVO", resVO);
		
		
		//데이터로 검색결과 받는 경로		
		List<RestaurantVO> searchlist = hmDetailService.searchList(resVO); 
		model.addAttribute("searchlist", searchlist);	
		
		
		return "searchList";
	}
	
}
