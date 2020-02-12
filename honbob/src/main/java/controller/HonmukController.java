package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.HonmukDetailService;
import service.HonmukMainPageService;
import util.Page;
import util.PageInfo;
import vo.GradeVO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;
import vo.review.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HonmukController {
	
	@Autowired
	private HonmukDetailService hmDetailService;
	@Autowired
	private HonmukMainPageService hmMainService;
	
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
	public String DetailRes(Model model, @RequestParam(name = "res_num", required = true)int res_num,HttpServletRequest req) {
		//조회수 올리기
		int upCount = hmDetailService.upViewCount(res_num);
		if(upCount==1) {
			System.out.println("up");
		}else {
			System.out.println("fail");
		}
		//식당정보 가져오기
		RestaurantVO restDetail = hmDetailService.getRestaurantById(res_num);
		//별점 가져오기
		Double res_grade = hmDetailService.getGrade(res_num);
		//유저가 여기를 평가했는지 확인해야함 평가했으면 별점 안했으면 -1로 줘야할듯
		//유저 번호 가져오기 나중에..
		int userNo = 111;
		GradeVO gradevo = new GradeVO();
		gradevo.setUserNo(userNo);
		gradevo.setRes_num(res_num);
		int userGrade = hmDetailService.getUserGrade(gradevo);
		//식당사진 가져오기
		List<RestaurantImageVO> imageList = hmDetailService.getRestaurantImageById(res_num);
		//추천식당 3개정도 가져오기 !! 현재 있는 식당은 목록에 안나오게 해야함;
		List<RestaurantVO> recomRest = hmDetailService.getRecommandRestuarant(restDetail);
		//추천식당 3개의 사진을 가져오기
		List<RestaurantImageVO> recomImageList = hmDetailService.getRecommandImage(recomRest);
		//리뷰가져오기
		List<ReviewVO> reviewList = hmDetailService.getReviewList(res_num);
		reviewList = null;
		int reviewcount = 0;
		
		
		
		//모델에 넣기
		model.addAttribute("restaurantDetail", restDetail);
		model.addAttribute("imageList", imageList);
		model.addAttribute("res_grade",String.format("%.1f", res_grade));
		model.addAttribute("recomList",recomRest);
		model.addAttribute("userGrade", userGrade);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("recomImageList", recomImageList);
		return "detail/detailView";
	}
	//별점
	
	@RequestMapping("starAjax.do")
	public String gradeControl(@RequestParam(name = "res_num", required = true)int res_num,@RequestParam(name = "star_count", required = true)int star_count,Model model) {
		//서버에 있는 별점이랑 가지고 있는 별점이랑 비교해서 별점을 줘야한다.
		//서버에 이 유저가 이 식당에 별점을 줬는지 확인해보자
		System.out.println(star_count);
		System.out.println(res_num);
		int userNo = 111;
		GradeVO gradevo = new GradeVO();
		gradevo.setUserNo(userNo);
		gradevo.setRes_num(res_num);
		gradevo.setGrade(star_count);
		int userGrade = hmDetailService.getUserGrade(gradevo);
		//서버에 없으면 -1 있으면 1~5의 숫자가 나올것이다.
		//서버에 없으면 새로 넣어준다.
		if(userGrade == 0) {
			int insertGrade = hmDetailService.insertGrade(gradevo);
		}
		//서버에 있고, 별점이 같은 숫자가 왔으면, 삭제하고 0을 리턴
		else if(userGrade == star_count) {
			int deleteGrade = hmDetailService.deleteGrade(gradevo);
			System.out.println("delete");
			star_count = 0;
		}
		//서버에 있고, 별점이 다른 숫자가 왔으면, 업데이트
		else {
			int updateGrade = hmDetailService.updateGrade(gradevo);
			System.out.println("update");
		}
		model.addAttribute("star_count", star_count);
		return "detail/detailAjax";
	}
	
	@RequestMapping("/mainPage.do")
	public String mainPage(Model model,ReviewVO rvo){
		List<ReviewVO> review = hmMainService.mainReview(rvo);		
		model.addAttribute("reviewList",review);
		
		
		return "mainPage";
	}
	
}
