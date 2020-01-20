package vo;

import java.sql.Date;

public class SupportVO {
	//
	private int id;
	//
	private String subject;
	//
	private String content;
	//
	private Date registdate;
	//
	private boolean lock;
	//
	private boolean sendemail;
	//
	private int file_num;
	//
	private String user_userId;
	//
	private int comment_num;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}
	public boolean isLock() {
		return lock;
	}
	public void setLock(boolean lock) {
		this.lock = lock;
	}
	public boolean isSendemail() {
		return sendemail;
	}
	public void setSendemail(boolean sendemail) {
		this.sendemail = sendemail;
	}
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public String getUser_userId() {
		return user_userId;
	}
	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
}
