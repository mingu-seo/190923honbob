package vo;

import java.io.File;
import java.sql.Date;

public class UserVO {
	//회원번호
	private int userNo;
	//아이디
	private String userId;
	//별명
	private String userName;
	//이메일
	private String userEmail;
	//비밀번호
	private String userPassword;
	//비번확인질문
	private int pwdQuestion;
	//비번 확인 답변
	private String pwdAnswer;
	//회원가입 날짜
	private Date userJoinDate;
	//프로필 사진
	private String userImage;
	
	//비밀번호 확인 및 비밀번호 변경
	private String password1;
	
	// 추가 필드
	private int page; // 사용자가 요청한 페이지 번호
	private int limit; // 페이지당 로우 수
	private int startIndex; // limit 시작 인덱스
	private int maxPage; // 총페이지수
	
	public UserVO() {
		this.page = 1; // 사용자가 요청한 페이지번호가 없으면 초기값 1
		this.limit = 5; // 페이지당 로우수가 지정이 안되면 초기값 10
	}

	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStartIndex() {
		return (this.page-1)*this.limit;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getPwdQuestion() {
		return pwdQuestion;
	}
	public void setPwdQuestion(int pwdQuestion) {
		this.pwdQuestion = pwdQuestion;
	}
	public String getPwdAnswer() {
		return pwdAnswer;
	}
	public void setPwdAnswer(String pwdAnswer) {
		this.pwdAnswer = pwdAnswer;
	}
	public Date getUserJoinDate() {
		return userJoinDate;
	}
	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

}


