package hcmute.edu.vn.dto;

import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ReviewDTO {
    private String userName;
    private Date reviewDate;
    private String reviewContent;
    private Integer productQuality;
    private String imageUrls; // Danh sách URL của các ảnh

}
