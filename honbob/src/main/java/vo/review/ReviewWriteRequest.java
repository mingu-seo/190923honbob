package vo.review;

import lombok.Data;

@Data
public class ReviewWriteRequest {
    private String subject;
    private String content;
}
