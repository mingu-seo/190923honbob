package vo;

import java.sql.Date;

public class ReviewVO {
	
	private int id;
	
	private String subject;
	
	private String content;
	
	private Date registdate;
	
	private int file_num;
	
	private String user_userId;
	
	private int res_num;
	
	private int menu_num;
	
	private int local_num;
	
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

	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public int getLocal_num() {
		return local_num;
	}

	public void setLocal_num(int local_num) {
		this.local_num = local_num;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	
}
