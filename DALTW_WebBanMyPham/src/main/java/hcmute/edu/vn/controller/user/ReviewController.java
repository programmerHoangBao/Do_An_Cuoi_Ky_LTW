package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.dto.ReviewDTO;
import hcmute.edu.vn.service.implement.ReviewUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired
    private ReviewUserService reviewUserService;

    @GetMapping("/{productId}")
    public List<ReviewDTO> getReviewsByProductId(@PathVariable Integer productId) {
        return reviewUserService.getReviewDetailsByProductId(productId);
    }
}