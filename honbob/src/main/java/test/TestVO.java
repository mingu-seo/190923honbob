package test;

import java.sql.Timestamp;

public class TestVO {

	private int id;
	private String email;
	private String password;
	private String name;
	private Timestamp regdate;
	private String profile;
	private String introduce;
	
	private String from; // 시작일
	private String to;   // 종료일
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getFrom() {
		if (from == null) {
			return "";
		}
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		if (to == null) {
			return "";
		}
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
}
