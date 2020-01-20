package vo;

import java.sql.Date;

public class UserVO {
	//회원번호
	private int UserNo;
	//아이디
	private String userId;
	//이름
	private String userName;
	//이메일
	private String UserEmail;
	//비밀번호
	private String UserPassword;
	//비번확인질문
	private String pwdQuestion;
	//비번 확인 답변
	private String pwdAnswer;
	//회원가입 날짜
	private Date userJoinDate;
	//관리자 번호
	private int admin;
	//프로필 사진
	private String userImage;
	
	
	public int getUserNo() {
		return UserNo;
	}
	public void setUserNo(int userNo) {
		UserNo = userNo;
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
		return UserEmail;
	}
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}
	public String getPwdQuestion() {
		return pwdQuestion;
	}
	public void setPwdQuestion(String pwdQuestion) {
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
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

}
