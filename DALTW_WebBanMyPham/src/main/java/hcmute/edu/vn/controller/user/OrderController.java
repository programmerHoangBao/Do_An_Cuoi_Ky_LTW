package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.dto.ShoppingCartDTO;
import hcmute.edu.vn.repository.ProductColorRepository;
import hcmute.edu.vn.service.implement.OrderService;
import hcmute.edu.vn.service.implement.ProductColorService;
import hcmute.edu.vn.service.implement.ShoppingCartService;
import hcmute.edu.vn.service.implement.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductColorService productColorService;
    @Autowired
    private UserService userService;

    @GetMapping("/user/order/{userId}")
    public String viewOrderPage(@PathVariable("userId") Integer userId, ModelMap model) {
        List<ShoppingCartDTO> cartItems = shoppingCartService.getShoppingCartItemsByUserId(userId);

        if (cartItems.isEmpty()) {
            model.addAttribute("message", "Giỏ hàng của bạn hiện đang trống.");
            return "user/shopping-cart"; // Quay lại trang giỏ hàng nếu giỏ hàng trống
        }

        // Tính tổng tiền của giỏ hàng
        double totalPrice = cartItems.stream()
                .mapToDouble(item -> item.getShoppingCartQuantity() * item.getProductPrice())
                .sum();

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("userId", userId);

        return "user/order"; // Trả về view order.jsp
    }

    // Phương thức xử lý thanh toán
    @PostMapping("/user/confirm-order")
    public String confirmOrder(@RequestParam Integer userId) {
        // Lấy các sản phẩm trong giỏ hàng của người dùng
        List<ShoppingCartDTO> cartItems = shoppingCartService.getShoppingCartItemsByUserId(userId);

        // Duyệt qua từng sản phẩm trong giỏ hàng và thêm vào đơn hàng
        for (ShoppingCartDTO item : cartItems) {
            // Tính tổng tiền cho từng sản phẩm
            Integer product_color = productColorService.findProductColorByIdProduct(item.getProductId()).getFirst().getId_product_color();
            // Thêm từng sản phẩm vào bảng Order
            orderService.addOrder(userId, item.getProductId(), product_color,item.getShoppingCartQuantity());
        }

        // Sau khi thêm tất cả các sản phẩm vào đơn hàng, xóa giỏ hàng của người dùng
        shoppingCartService.clearCart(userId);

        // Chuyển hướng đến trang thông báo thành công
        return "redirect:/user/home";
    }
}
