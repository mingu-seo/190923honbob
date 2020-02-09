package vo.support;

import lombok.Data;

@Data
public class SupportEditRequest {
    private int id;
    private String subject;
    private String content;
}
