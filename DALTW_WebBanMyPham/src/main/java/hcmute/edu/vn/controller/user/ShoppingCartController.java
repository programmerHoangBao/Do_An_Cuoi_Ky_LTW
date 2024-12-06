package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.dto.ShoppingCartDTO;
import hcmute.edu.vn.entity.ShoppingCart;
import hcmute.edu.vn.service.implement.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
