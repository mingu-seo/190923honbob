package vo;

import lombok.Data;

import java.sql.Date;

@Data
public class FileVO {
	private int id;
	private String name;
	private Date registdate;
	private String extension;
	private int file_category_num;
	private String user_user;
}
