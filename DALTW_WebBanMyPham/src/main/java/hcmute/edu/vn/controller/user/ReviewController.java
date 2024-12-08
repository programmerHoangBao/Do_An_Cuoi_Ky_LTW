package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.controller.ImageController;
import hcmute.edu.vn.dto.ReviewDTO;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ReviewUser;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.service.implement.ProductService;
import hcmute.edu.vn.service.implement.ReviewUserService;
import hcmute.edu.vn.service.implement.UserService;
import hcmute.edu.vn.service.implement.UserService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/reviews")
public class ReviewController {

    @Autowired
    private ReviewUserService reviewUserService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService1 userService;

    @GetMapping("/{productId}")
    public List<ReviewDTO> getReviewsByProductId(@PathVariable Integer productId) {
        return reviewUserService.getReviewDetailsByProductId(productId);
    }

    @PostMapping("/add-review")
    public ResponseEntity<?> addReview(
            @RequestParam("userId") Integer userId,
            @RequestParam("productId") Integer productId,
            @RequestParam("comment") String comment,
            @RequestParam("rating") Integer rating,
            @RequestParam(value = "images", required = false) MultipartFile[] images
    ) {
        Product product = productService.findProductById(productId);
        User user = userService.findById(userId);

        if (product == null || user == null) {
            return ResponseEntity.badRequest().body("Sản phẩm hoặc người dùng không tồn tại");
        }

        // Lưu hình ảnh bằng cách gọi ImageController
        StringBuilder imagePaths = new StringBuilder();
        if (images != null) {
            for (MultipartFile image : images) {
                try {
                    String filePath = new ImageController().saveImage(image);
                    imagePaths.append(filePath);
                } catch (Exception e) {
                    return ResponseEntity.badRequest().body("{\"message\": \"Sản phẩm hoặc người dùng không tồn tại\"}");
                }
            }
        }

        // Lưu review vào database
        reviewUserService.addReview(product, user, comment, rating, imagePaths.toString());

        return ResponseEntity.ok("{\"message\": \"Bình luận được thêm thành công!\"}");
    }

}