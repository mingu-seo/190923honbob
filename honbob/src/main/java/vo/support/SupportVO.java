package vo.support;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SupportVO {
	private int id;
	private String subject;
	private String content;
	private Timestamp registdate;
	private int lock;
	private boolean sendemail;
	private int file_num;
	private int userNo;
	private int comment_num;

}
