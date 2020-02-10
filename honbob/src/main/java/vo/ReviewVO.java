package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
}
