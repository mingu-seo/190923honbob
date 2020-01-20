package vo;

import java.sql.Date;

public class MessageVO {
	//보낸 날짜
	private Date sendDate;
	//보낸사람
	private int sendUserNo;
	//받는사람
	private int getUserNo;
	//내용
	private String msgContent;
	//번호
	private int msgNo;
	//읽음여부
	private int read;
	
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public int getSendUserNo() {
		return sendUserNo;
	}
	public void setSendUserNo(int sendUserNo) {
		this.sendUserNo = sendUserNo;
	}
	public int getGetUserNo() {
		return getUserNo;
	}
	public void setGetUserNo(int getUserNo) {
		this.getUserNo = getUserNo;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	
}
