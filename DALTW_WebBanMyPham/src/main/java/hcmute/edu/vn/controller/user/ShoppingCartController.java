package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.dto.ShoppingCartDTO;
import hcmute.edu.vn.entity.ShoppingCart;
import hcmute.edu.vn.service.implement.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    private ShoppingCartService shoppingCartService;

    @PostMapping("/api/cart-add")
    public ResponseEntity<String> addToCart(
            @RequestParam Integer userId,
            @RequestParam Integer productId,
            @RequestParam Integer quantity) {
        try {
            shoppingCartService.addProductToCart(userId, productId, quantity);
            return ResponseEntity.ok("Thêm sản phẩm vào giỏ hàng thành công.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Không thể thêm sản phẩm vào giỏ hàng.");
        }
    }

    // API lấy thông tin giỏ hàng của người dùng
    @GetMapping("/api/cart/user/{userId}")
    public ResponseEntity<?> getCartItems(@PathVariable Integer userId) {
        List<ShoppingCartDTO> items = shoppingCartService.getShoppingCartItemsByUserId(userId);

        if (items.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No items found.");
        }

        return ResponseEntity.ok(Collections.singletonMap("items", items));
    }

    // API xóa sản phẩm khỏi giỏ hàng
    @PostMapping("/api/delete-cart/{userId}&{productId}")
    public ResponseEntity<String> deleteCartItem(@PathVariable Integer userId, @PathVariable Integer productId) {
        try {
            // Gọi service để xóa sản phẩm
            boolean isDeleted = shoppingCartService.deleteCartItem(userId, productId);

            if (isDeleted) {
                return ResponseEntity.ok("Sản phẩm đã được xóa khỏi giỏ hàng.");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy sản phẩm trong giỏ hàng.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi xảy ra khi xóa sản phẩm.");
        }
    }

    @GetMapping("/ShoppingCart/{userId}")
    public String viewShoppingCart(@PathVariable("userId") Integer userId, ModelMap model) {

        // Lấy danh sách sản phẩm từ giỏ hàng
        List<ShoppingCartDTO> cartItems = shoppingCartService.getShoppingCartItemsByUserId(userId);
        model.addAttribute("cartItems", cartItems);

        // Tạm thời chỉ truyền userId vào model (nếu cần)
        model.addAttribute("userId", userId);

        // Trả về tên template tương ứng (ví dụ: shopping_cart.html)
        return "user/shopping-cart";
    }
}
