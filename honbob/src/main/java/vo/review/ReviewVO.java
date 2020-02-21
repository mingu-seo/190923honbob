package vo.review;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
    private int id;
    private String subject;
    private String content;
    private Timestamp registdate;
    private int file_num;
//    private String user_userId; // 쿼리에서는 user_userNo를 쓰고 있으나 VO에서는 다른 이름 사용
    private int userNo;
    private int res_num;
    private int local_num;
    private int comment_num;
    private String userName;
    private String imageName;
}
