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
import vo.RestaurantImageVO;
import vo.RestaurantVO;
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
	@RequestMapping("/DetailView.do")
	public String DetailRes(Model model, @RequestParam(name = "res_num", required = true)int res_num) {
		//식당정보 가져오기
		RestaurantVO restDetail = hmDetailService.getRestaurantById(res_num);
		//식당사진 가져오기
		List<RestaurantImageVO> imageList = hmDetailService.getRestaurantImageById(res_num);
		//추천식당 3개정도 가져오기
		
		//리뷰가져오기
		
		//조회수 올리기
		int upCount = hmDetailService.upViewCount(res_num);
		if(upCount==1) {
			System.out.println("up");
		}else {
			System.out.println("fail");
		}
		//별점 올리기
		
		//별점 내리기
		
		//모델에 넣기
		model.addAttribute("restaurantDetail", restDetail);
		model.addAttribute("imageList", imageList);
		
		return "detail/detailView";
	}
	
	
}
