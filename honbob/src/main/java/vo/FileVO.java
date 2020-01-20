package vo;

import java.sql.Date;

public class FileVO {
	//
	private int id;
	//
	private String name;
	//
	private Date registdate;
	//
	private String extension;
	//
	private int file_category_num;
	//
	private String user_user;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public int getFile_category_num() {
		return file_category_num;
	}
	public void setFile_category_num(int file_category_num) {
		this.file_category_num = file_category_num;
	}
	public String getUser_user() {
		return user_user;
	}
	public void setUser_user(String user_user) {
		this.user_user = user_user;
	}
	
	
}
