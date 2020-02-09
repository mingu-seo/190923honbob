package vo.support;

import lombok.Data;

import java.sql.Date;

@Data
public class SupportVO {
	private int id;
	private String subject;
	private String content;
	private Date registdate;
	private boolean lock;
	private boolean sendemail;
	private int file_num;
	private int user_userId;
	private int comment_num;

}
