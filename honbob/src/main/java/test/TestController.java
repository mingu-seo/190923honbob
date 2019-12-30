package test;

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
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TestController {
	@Autowired
	private TestDAO testDao;
	
	@Autowired
	private TestService tService;
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model, 
			HttpServletRequest req, 
			@RequestParam(value="email", required = false) String email, 
			TestVO vo) {
		/*
		 * 리퀘스트 값 받는 방법
		 * - HttpServletRequest
		 * - @RequestParam
		 * - Command 객체로
		 */
		System.out.println("requst:"+req.getParameter("email"));
		System.out.println("RequestParam:"+email);
		System.out.println("Command:"+vo.getEmail());
		
		List<TestVO> list = testDao.memberList(vo);
		model.addAttribute("list", list); 
		return "memberList";
	}
	
	// jstl 안쓰고, 일자 검색기능 추가
	@RequestMapping("/memberList2.do")
	public String memberList2(Model model, 
			HttpServletRequest req, 
			@RequestParam(value="email", required = false) String email, 
			TestVO vo) {
		
		List<TestVO> list = testDao.memberList(vo);
		// 장수정 수정
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "memberList2";
	}
	

	@RequestMapping("/test.do")
	public String test(Model model) {
		
		model.addAttribute("name", "홍길동");
		return "test";
	}
	
	@RequestMapping("/member.do")
	public String member(Model model) {
		
		model.addAttribute("name", "김길동");
		return "test";
	}
	
	@RequestMapping("/memberForm.do")
	public String memberForm() {
		return "memberForm";
	}
	
	@RequestMapping("memberInsert.do")
	public String memberInsert(TestVO vo, @RequestParam("image") MultipartFile file, HttpServletRequest request) {
		tService.memberInsert(vo, file, request);
		return "redirect:/memberList2.do";
	}
	
	@RequestMapping("memberDetail.do")
	public String memberDetail(Model model, @RequestParam("id") int id) {
		TestVO vo = tService.memberDetail(id);
		model.addAttribute("vo", vo);
		return "memberDetail";
	}
	
	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm(Model model, @RequestParam("id") int id) {
		TestVO vo = tService.memberDetail(id);
		model.addAttribute("vo", vo);
		return "memberUpdateForm";
	}
	
	@RequestMapping("memberUpdate.do")
	public String memberUpdate(TestVO vo, @RequestParam("image") MultipartFile file, HttpServletRequest request) {
		tService.memberUpdate(vo, file, request);
		return "redirect:memberList2.do";
	}
	
	@RequestMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") int id) {
		tService.memberDelete(id);
		return "redirect:memberList2.do";
	}
	
	// 관리자 인터셉터처리
	
	@RequestMapping("/admin/index.do")
	public String adminIndex() {
		return "admin/index";
	}
	
	@RequestMapping("/admin/login.do")
	public String adminLogin() {
		return "admin/login";
	}
	
	@RequestMapping("/admin/loginProcess.do")
	public String loginProcess(HttpSession session, HttpServletResponse response,
			@RequestParam("mail") String mail, 
			@RequestParam("pwd") String pwd) throws IOException {
		// DB 확인
		TestVO vo = tService.loginCheck(mail, pwd);
		if (vo == null) {
			// 로그인실패
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('아이디/비밀번호가 올바르지 않습니다.');");
			out.print("location.href='/sample/admin/login.do';");
			out.print("</script>");
			return null;
		} else {
			// 로그인성공
			session.setAttribute("adminSession", vo);
			return "redirect:/admin/index.do";
		}
		
		
	}
	
	@RequestMapping("/admin/logout.do")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.setAttribute("adminSession", null);
		return "redirect:/admin/login.do";
	}
	
	
	
	
	
	
	
	
	
	
}
