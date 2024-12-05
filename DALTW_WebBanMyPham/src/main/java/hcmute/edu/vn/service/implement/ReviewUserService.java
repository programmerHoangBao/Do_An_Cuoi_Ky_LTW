package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.dto.ReviewDTO;
import hcmute.edu.vn.repository.ReviewUserRepository;
import hcmute.edu.vn.service.IReviewUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

import java.util.List;

@Service
public class ReviewUserService implements IReviewUserService {

    @Autowired
    private ReviewUserRepository reviewUserRepository;

    public List<ReviewDTO> getReviewDetailsByProductId(Integer productId) {
        // Gọi phương thức trong repository để lấy thông tin review và ảnh
        return reviewUserRepository.findReviewDetailsByProductId(productId);
    }
}
