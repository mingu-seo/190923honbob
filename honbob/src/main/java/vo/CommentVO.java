package vo;

import java.sql.Date;

public class CommentVO {
	//
	private int id;
	//
	private String content;
	//
	private Date registdate;
	//
	private int count;
	//
	private String user_userId;
	//
	private int comment_category_num;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUser_userId() {
		return user_userId;
	}
	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}
	public int getComment_category_num() {
		return comment_category_num;
	}
	public void setComment_category_num(int comment_category_num) {
		this.comment_category_num = comment_category_num;
	}
	
	
}
