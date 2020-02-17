package controller;


import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import mail.SendMail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.HonmukDetailService;
import service.HonmukListService;
import service.HonmukMainPageService;
import service.HonmukUserService;
import util.FileUtil;
import util.Page;
import util.PageInfo;
import vo.GradeVO;
import vo.RestaurantImageVO;
import vo.RestaurantVO;
import vo.UserVO;
import vo.review.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
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
	
//식당 리스트 mapping-----------------------------------------------------------------------------------------------------------
	
	//기본 페이지 호출 경로
	@RequestMapping("/searchList.do")
	public String searchList(HttpServletRequest req, RestaurantVO resVO) {
		req.setAttribute("resVO", resVO);
		
		return "searchList";  
	}	
	
	//내부영역 식당리스트 결과 ajax로 뿌리는 경로
	@RequestMapping("/listAjax.do")
	public String listAjax(Model model, RestaurantVO resVO, @RequestParam(name="page", required = false) String page,
			@RequestParam(name="filter1", required = false) String filter1, HttpSession session) {
			
		//초기 검색시 별점순으로
		if(resVO.getGrade()==0 && resVO.getReadcount() ==0 && resVO.getReviewcount()==0) {
			resVO.setGrade(1);
		}
		
		//카테고리 별점순,리뷰순,조회순 선택한 것으로 설정
		if("grade".equals(filter1)) {
			resVO.setGrade(1);
		}else if("reviewcount".equals(filter1)) {
			resVO.setReviewcount(1);
		}else if("readcount".equals(filter1)) {
			resVO.setReadcount(1);
		}		
		
		//방문 리스트 데이터 받아오기
		if(session.getAttribute("visit_num") != null) {
			List<String> visit_num = (List<String>)session.getAttribute("visit_num");			
			List<RestaurantVO> visitList = hmListService.visitList(visit_num);
			model.addAttribute("visitList", visitList);
		}
		
		
		
		//검색결과를 받아옴
		List<RestaurantVO> searchlist = hmListService.searchList(resVO); 		
		model.addAttribute("searchlist", searchlist);
		
		//하단부 페이징 관련
		Page Page = new Page();
		int listCount = hmListService.count(resVO);
		PageInfo pageInfo = Page.page(page, listCount);	
		model.addAttribute("pageInfo", pageInfo);		
		
		//검색결과가 없을시 안내문
		if(searchlist.size()==0) {			
			model.addAttribute("msg", "식당 정보가 없습니다.");
			model.addAttribute("url", "/honbob/searchList.do");
			return "include/alert";
		}else {
			return "include/listAjax";
		}				
		
	}	
//----------------------------------------------------------------------------------------------------------------------
	
	
	@RequestMapping("/registImage")
	public String registImage() {
		
		RestaurantImageVO imageres = new RestaurantImageVO();
		int random_1=(int) (Math.random()*5+1);
		int random_2=(int) (Math.random()*25+1);		
		List<RestaurantVO> resList = hmDetailService.getList();
		int[] fullsize = new int[5];
		boolean noDupl = false;
		String food="";
		for(int i = 0;i<resList.size();i++) {
			System.out.println(resList.get(i).getRes_num());
			
			if(resList.get(i).getJapanfood()==1) {
				food = "japan";
			}else if(resList.get(i).getKoreafood()==1) {
				food = "korea";
			}else if(resList.get(i).getChinafood()==1) {
				food = "China";
			}else if(resList.get(i).getWesternfood()==1) {
				food = "western";
			}else if(resList.get(i).getEtcfood()==1) {
				food = "etc";
			}
			
			random_1=(int) (Math.random()*5+1);
			System.out.println(random_1);
			for(int j=0; j<random_1; j++) {
				noDupl = true;
				System.out.println(fullsize[j]);
				fullsize[j] = (int) (Math.random()*25+1);
				for(int k=0;k<j;k++) {
					if(fullsize[j] ==fullsize[k]) {
						j--;
					}
				}
			}
			for(int j = 0; j <random_1;j++) {
				imageres.setRes_image_num(resList.get(i).getRes_num()*100+j);
				imageres.setRes_image_name(food+fullsize[j]+".jpg");
				imageres.setRes_num(resList.get(i).getRes_num());
				if(j==0) {
					imageres.setBest_image(1);
				}else {
					imageres.setBest_image(0);
				}
				hmDetailService.registImageVO(imageres);
			}
			
			
			
		}
		
		return "";
	}
	@RequestMapping("/DetailView.do")
	public String DetailRes(Model model, @RequestParam(name = "res_num", required = true)int res_num,HttpServletRequest req,
			HttpSession session) {
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
		//별점준 사람 수를 구해오기
		int gradeCnt = hmDetailService.getGradeCnt(res_num);
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
		//추천식당 3개의 별점을 가져오기
		List<String> recomGradeList = hmDetailService.getRecommandGrade(recomRest);
		//리뷰가져오기
		List<ReviewVO> reviewList = hmDetailService.getReviewList(res_num);
		reviewList = null;
		int reviewcount = 0;
		restDetail.setGradecount(gradeCnt);
		
		
		//최근 방문 식당 res_num 세션 저장	
		List<String> visit_res;
		if (session.getAttribute("visit_num") != null) {
			visit_res = (List<String>)session.getAttribute("visit_num");
		} else {
			visit_res = new ArrayList<String>();
		}
		if (visit_res.size() < 5) {
			if (!visit_res.contains(String.valueOf(res_num))) {
				visit_res.add(String.valueOf(res_num));
			}
		} else {
			visit_res.remove(0);
			visit_res.add(String.valueOf(res_num));
		}
		session = req.getSession();
		session.setAttribute("visit_num", visit_res);		
		
		
		//모델에 넣기
		model.addAttribute("restaurantDetail", restDetail);
		model.addAttribute("imageList", imageList);
		model.addAttribute("res_grade",String.format("%.1f", res_grade));
		model.addAttribute("recomList",recomRest);
		model.addAttribute("userGrade", userGrade);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("recomImageList", recomImageList);
		model.addAttribute("recomGradeList", recomGradeList);
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
		
		//새롭게 적용된 별점과 카운트를 넘겨준다.
		int current_grade_count = hmDetailService.getGradeCnt(res_num);
		Double current_res_grade = hmDetailService.getGrade(res_num);
		
		model.addAttribute("star_count", star_count);
		model.addAttribute("current_grade_count", current_grade_count);
		model.addAttribute("current_res_grade", current_res_grade);
		
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
			out.print("alert('아이디 또는 비밀번호가 올바르지 않습니다.');");
			out.print("location.href='loginForm.do';");
			out.print("</script>");
			return null;
		} else {
			session.setAttribute("Session", login);
			return "redirect:/loginForm.do";
		}
	}
	
	
	// 로그아웃
	@RequestMapping("/logOut.do")
	public String logout(HttpSession session, @RequestParam(name="url", required=false) String url) {
		session.invalidate();
		// 로그아웃한 페이지로 다시 돌아간다.
		return "redirect:/mainPage.do";
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
	public String search_pwd(Model model, UserVO vo, HttpServletResponse response, HttpSession session) throws IOException {
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
			session.setAttribute("userEmail", search);
			return "user/search_Pwd";
		}
	}
	
	// 비밀번호 질문,대답 체크
	@RequestMapping("/qwdAnswerCheck.do")
	public String qwdAnswerCheck(Model model,@RequestParam("pwdQuestion") String pwdQuestion,@RequestParam("pwdAnswer") String pwdAnswer) {
		int r = hmUserService.qwdAnswerCheck(pwdQuestion, pwdAnswer);
		model.addAttribute("value",r);
		return "user/ajax/return";
	}
	
	
	// 이메일로 임시비밀번호 전송
	@RequestMapping("/pwdSearch.do")
	public String pwdSearch(Model model, @RequestParam("userEmail") String userEmail, UserVO vo) throws Exception {
		// 랜덤 12자리 받아오기
		String pwdNum = hmUserService.emailPass();
		// 12자리로 비밀번호 변경 후
		int r = hmUserService.pwdUpdate(userEmail, pwdNum);
		// 이메일로 임시 비밀번호 전송
		SendMail.sendEmail("duwkdutns2@naver.com", userEmail, "안녕하세요^^. [밥먹자] 임시 비밀번호 발급 입니다.", " 회원가입 이메일 인증번호 : "+ pwdNum);
		model.addAttribute("value",r);
		return "user/ajax/return";

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
			url = "/honbob/user/index.do";
		} else {
			msg = "회원가입 실패";
			url = "/honbob/user/userJoinForm.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "user/ajax/alert";
	}
	
	
	// 아이디 중복확인
	@RequestMapping("/idCheck.do")
	public String idCheck(Model model, @RequestParam("userId") String userId) {
		int cnt = hmUserService.idCheck(userId);
		model.addAttribute("value",cnt);
		return "user/ajax/return";
	}
	
	
	// 이메일 중복확인 // 이메일 인증번호 전송
	@RequestMapping("/emailCheck.do")
	public String emailCheck(Model model, @RequestParam("userEmail") String userEmail, HttpSession session) throws Exception {
		int cnt = hmUserService.emailCheck(userEmail);
		model.addAttribute("value",cnt);
	
		if ( cnt != 0 ) {
			return "user/ajax/return";
		} else if ( cnt == 0 ) {
			String emailPwd = hmUserService.emailPass();
			SendMail.sendEmail("duwkdutns2@naver.com", userEmail, "안녕하세요^^. [밥먹자] 회원가입 입니다.", " 회원가입 이메일 인증번호 : "+emailPwd);
			session.setAttribute("emailPwd",emailPwd);
			return "user/ajax/return";
		}
		return null;
	}
	
	
	// 인증번호 확인
	@RequestMapping("/emailPwdCheck.do")
	public String emailPwdCheck(Model model, @RequestParam("emailPwdNumber") String emailPwdNumber, HttpSession session) throws IOException {
		int r = hmUserService.emailPwdCheck(emailPwdNumber, (String)session.getAttribute("emailPwd"));
		model.addAttribute("value", r);
		return "user/ajax/return";
	}
	
	
	// 회원상세정보 (마이페이지)
	@RequestMapping("/userInfoView.do")
	public String userInfoView(Model model, HttpSession sess, HttpServletResponse response) throws IOException {
		UserVO uv = (UserVO)sess.getAttribute("Session");
		UserVO vo = hmUserService.userInfoView(uv.getUserNo());
		model.addAttribute("vo",vo);
		return "user/userInfoView";	
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
	
	
	// 프로필 수정 페이지 (마이페이지)
	@RequestMapping("/profileForm.do")
	public String profileForm(Model model, HttpSession sess,UserVO vo) {
		// 세션에 있는 userNo로 테이블에서 조회해서 model
		UserVO uv = (UserVO)sess.getAttribute("Session");
		UserVO user = hmUserService.userInfoView(uv.getUserNo());
		model.addAttribute("vo",user);
		return "user/profileForm";
	}
	
	// 프로필 사진 or 별명 수정
	@RequestMapping("profileFormUpdate.do")
	public String profileFormUpdate(UserVO vo, @RequestParam("userImage_tmp") MultipartFile file, HttpServletRequest req) {
		// 프로필 사진 수정
		FileUtil fu = new FileUtil();
		fu.fileUpload(file,req.getRealPath("/images/"));
		vo.setUserImage(fu.fileName);
		
		if (vo.getUserImage() != null) {
			hmUserService.imageUpdate(vo,file,req);
		}
		// 프로필 별명 수정
		if (vo.getUserName() != null) {
			hmUserService.nameUpdate(vo);
		}
			return "redirect:/profileForm.do";
	}
	
	// 나의 QnA 질문과 답변 리스트
	@RequestMapping("/myQnA.do")
	public String myQnAList() {
		return "user/myQnA";
	}
	
	/*// 나의 리뷰글(마이페이지)
	@RequestMapping("/myReview.do")
	public String myReview(Model model,ReviewVO vo, HttpSession sess) {
		int r = hmUserService.myReviewList();
		return "user/myReview";
	}*/
	
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
	
	// 만드는중
	@RequestMapping("/bobmukEmail.do")
	public String bobmukEmail() {
		return "user/bobmukEmail";
	}
	

}
