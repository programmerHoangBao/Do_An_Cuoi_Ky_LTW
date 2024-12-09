package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.controller.ImageController;
import hcmute.edu.vn.dto.ReviewDTO;
import hcmute.edu.vn.entity.Order;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ReviewUser;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.service.implement.*;
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

    @Autowired
    private OrderService orderService;

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

        // Kiểm tra đơn hàng
        List<Order> orders = orderService.getOrdersByUser(user);
        boolean hasReceivedOrder = orders.stream()
                .anyMatch(order -> order.getStatusOrder().equals("Đã nhận") &&
                        order.getProduct().equals(product));

        if (!hasReceivedOrder) {
            return ResponseEntity.badRequest()
                    .body("{\"message\": \"Bạn cần hoàn tất đơn hàng để bình luận về sản phẩm này\"}");
        }


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