package vo.review;

import lombok.Data;

@Data
public class ReviewEditRequest {
    private int id;
    private String subject;
    private String content;
}
