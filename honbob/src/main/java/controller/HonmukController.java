package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.HonmukDetailService;
import service.HonmukListService;

import org.springframework.web.multipart.MultipartFile;

import mail.SendMail;

import service.HonmukDetailService;
import service.HonmukMainPageService;
import service.HonmukUserService;
import util.Page;
import util.PageInfo;
import vo.GradeVO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;
import vo.ReviewVO;
import vo.UserVO;
import util.Page;
import util.PageInfo;
import vo.RestaurantVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HonmukController {
	
	@Autowired
	private HonmukDetailService hmDetailService;
	@Autowired
	private HonmukMainPageService hmMainService;
	@Autowired
	private HonmukUserService hmUserService;
	
	@Autowired
	HonmukListService hmListService;
	
	//메인페이지에서 키워드로 검색시 경로
	@RequestMapping("/searchList.do")
	public String searchList(Model model, RestaurantVO resVO) {				
		
		if(resVO.getGrade()==0 && resVO.getReadcount() ==0 && resVO.getReviewcount()==0) {
			resVO.setGrade(1);
		}
		model.addAttribute("resVO", resVO);
		
		List<RestaurantVO> searchlist = hmListService.searchList(resVO); 		
		model.addAttribute("searchlist", searchlist);	
		
		return "searchList";  
	}	
	
	@RequestMapping("/listAjax.do")
	public String listAjax(Model model, RestaurantVO resVO, @RequestParam(name="page", required = false) String page,
			@RequestParam(name="filter1", required = false) String filter1) {
			
		if("grade".equals(filter1)) {
			resVO.setGrade(1);
		}else if("reviewcount".equals(filter1)) {
			resVO.setReviewcount(1);
		}else if("readcount".equals(filter1)) {
			resVO.setReadcount(1);
		}
		
		if(resVO.getGrade()==0 && resVO.getReadcount() ==0 && resVO.getReviewcount()==0) {
			resVO.setGrade(1);
		}		
		
		Page Page = new Page();
		int listCount = hmListService.count();
		PageInfo pageInfo = Page.page(page, listCount);
		model.addAttribute("pageInfo", pageInfo);
		
		List<RestaurantVO> searchlist = hmListService.searchList(resVO); 		
		model.addAttribute("searchlist", searchlist);
		
		if(searchlist.size()==0) {			
			model.addAttribute("msg", "식당 정보가 없습니다.");
			model.addAttribute("url", "/Honmuk/searchList.do");			
			return "include/alert";
		}else {
			return "include/listAjax";
		}				
		
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
		//유저가 여기를 평가했는지 확인해야함 평가했으면 별점 안했으면 0으로 줘야할듯
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
	
	
	// =================================================================
	
	// 일단 경로 저장 (추후 삭제)
	@RequestMapping("/index.do") 
	public String index() {
		return "user/index";
	}
	
	// 로그인
	@RequestMapping("/loginForm.do") 
	public String loginForm() {
		return "user/loginForm";
	}
	
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		UserVO login = hmUserService.login(vo);
		if ( login == null ) {
			response.setCharacterEncoding("UTF-8");		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('아이디 또는 비밀번호가\\n올바르지 않습니다.');");
			out.print("location.href='loginForm.do';");
			out.print("</script>");
			return null;
		} else {
			session.setAttribute("Session", login);
			return "redirect:/user/loginForm.do";
		}
	}
	
	
	// 로그아웃
	@RequestMapping("/logOut.do")
	public String logout(HttpSession session, @RequestParam(name="url", required=false) String url) {
		session.invalidate();
		return "redirect:"+url.substring(4);
	}
	
	
	// 아이디 찾기
	@RequestMapping("/search_Id.do")
	public String search_Id() {
		return "user/search_Id";
	}
	
	@RequestMapping("/search_id.do")
	public String search_id(Model model, UserVO vo, HttpServletResponse response) throws IOException {
		UserVO search = hmUserService.search_id(vo);
		if ( search == null ) {
			response.setCharacterEncoding("UTF-8");		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('일치하는 정보가 없습니다.');");
			out.print("location.href='search_Id.do';");
			out.print("</script>");
			return null;
		} else {
			model.addAttribute("search",search);
			return "user/search_Id";
		}
	}
	
	
	// 비밀번호 찾기
	@RequestMapping("/search_Pwd.do")
	public String search_Pwd() {
		return "user/search_Pwd";
	}
	
	@RequestMapping("/search_pwd.do")
	public String search_pwd(Model model, UserVO vo, HttpServletResponse response) throws IOException {
		UserVO search = hmUserService.search_pwd(vo);
		
		if ( search == null ) {
			response.setCharacterEncoding("UTF-8");		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('일치하는 정보가 없습니다.');");
			out.print("location.href='search_Pwd.do';");
			out.print("</script>");
			return null;
		} else {
			model.addAttribute("search",search);
			return "user/search_Pwd";
		}
	}
	
	// 비밀번호 질문,대답 체크
	@RequestMapping("/qwdAnswerCheck.do")
	public String qwdAnswerCheck(Model model,@RequestParam("pwdAnswer") String pwdAnswer) {
		int r = hmUserService.qwdAnswerCheck(pwdAnswer);
		model.addAttribute("value",r);
		return "include/return";
	}
	
	// 회원가입
	@RequestMapping("/userJoinForm.do")
	public String userJoinForm() {
		return "user/userJoinForm";
	}
	
	@RequestMapping("/userJoin.do")
	public String userJoin(UserVO vo, Model model) throws IOException{
		int r = hmUserService.userJoin(vo);
		String msg = "";
		String url = "";
		if ( r > 0 ) {
			msg = "정상적으로 가입되었습니다.";
			url = "/honbab/user/index.do";
		} else {
			msg = "회원가입 실패";
			url = "/honbab/user/userJoinForm.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "include/alert";
	}
	
	
	// 아이디 중복확인
	@RequestMapping("/idCheck.do")
	public String idCheck(Model model, @RequestParam("userId") String userId) {
		int cnt = hmUserService.idCheck(userId);
		model.addAttribute("value",cnt);
		return "include/return";
	}
	
	
	// 이메일 중복확인 // 이메일 인증번호 전송
	@RequestMapping("/emailCheck.do")
	public String emailCheck(Model model, @RequestParam("userEmail") String userEmail, HttpSession session) throws Exception {
		int cnt = hmUserService.emailCheck(userEmail);
		model.addAttribute("value",cnt);
	
		if ( cnt != 0 ) {
			return "include/return";
		} else if ( cnt == 0 ) {
			String emailPwd = hmUserService.emailPass();
			System.out.println("랜덤코드:"+emailPwd);
			SendMail.sendEmail("duwkdutns2@naver.com", userEmail, "안녕하세요^^. [밥먹자] 회원가입 입니다.", " 회원가입 이메일 인증번호 : "+emailPwd);
			session.setAttribute("emailPwd",emailPwd);
			return "include/return";
		}
		return null;
	}
	
	
	// 인증번호 확인
	@RequestMapping("/emailPwdCheck.do")
	public String emailPwdCheck(Model model, @RequestParam("emailPwdNumber") String emailPwdNumber, HttpSession session) throws IOException {
		int r = hmUserService.emailPwdCheck(emailPwdNumber, (String)session.getAttribute("emailPwd"));
		model.addAttribute("value", r);
		return "ajax/return";
	}
	
	
	// 회원상세정보 (마이페이지)
	@RequestMapping("/userInfoView.do")
	public String userInfoView(Model model, HttpSession sess, HttpServletResponse response) throws IOException {
		UserVO uv = (UserVO)sess.getAttribute("Session");
		UserVO vo = hmUserService.userInfoView(uv.getUserNo());
		model.addAttribute("vo",vo);
		return "userInfoView";	
	}
			
	// 비밀번호 변경
	@RequestMapping("/pwdChange.do")
	public String pwdChange(UserVO vo, HttpServletResponse response) throws IOException {
		int r = hmUserService.pwdChange(vo);

		response.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if ( r == 0 ) {
			out.print("<script>");
			out.print("alert('현재 비밀번호가 일치하지 않습니다.');");
			out.print("location.href='index.do';");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('비밀번호 변경 완료되었습니다.');");
			out.print("location.href='index.do';");
			out.print("</script>");
			}
		return null;
		}
	
	
	// 회원탈퇴
	@RequestMapping("/userInfoDeleteForm.do")
	public String userInfoDeleteForm() {
		return "user/userInfoDeleteForm";
	}
	
	@RequestMapping("/userInfoDelete.do")
	public String userInfoDelete(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		int r = hmUserService.userDelete(vo);
		
		response.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if ( r == 0 ) {
			out.print("<script>");
			out.print("alert('정보가 일치하지 않습니다.');");
			out.print("location.href='userInfoDeleteForm.do';");
			out.print("</script>");
		} else {
			session.invalidate();
			out.print("<script>");
			out.print("alert('회원탈퇴 되었습니다.');");
			out.print("location.href='index.do';");
			out.print("</script>");
			}
		return null;
	}
	
	
	// 프로필 변경
	@RequestMapping("/userImageUpdate.do")
	public String imageUpdate(UserVO vo, @RequestParam("userImage_tmp") MultipartFile file, HttpServletRequest req) {
		hmUserService.imageUpdate(vo,file,req);
		return "redirect:/user/myPage.do";			
	}

}
