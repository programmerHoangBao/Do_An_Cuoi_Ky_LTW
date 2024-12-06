package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.dto.ShoppingCartDTO;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ShoppingCart;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.repository.ShoppingCartRepository;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.IShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ShoppingCartService implements IShoppingCartService {
    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    public String addProductToCart(Integer userId, Integer productId, Integer quantity) {
        // Tìm User và Product
        User user = userRepository.getReferenceById(userId);
        Product product = productRepository.getReferenceById(productId);


        // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
        ShoppingCart existingCart = shoppingCartRepository.findByUserAndProduct(user, product);
        if (existingCart != null) {
            // Nếu đã có, tăng số lượng
            existingCart.setQuantity(existingCart.getQuantity() + quantity);
            shoppingCartRepository.save(existingCart);
        } else {
            // Nếu chưa có, tạo mới
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setUser(user);
            shoppingCart.setProduct(product);
            shoppingCart.setQuantity(quantity);
            shoppingCartRepository.save(shoppingCart);
        }

        return "Thêm sản phẩm vào giỏ hàng thành công!";
    }

    // Hàm lấy giỏ hàng của người dùng với các thông tin cần thiết
    public List<ShoppingCartDTO> getShoppingCartItemsByUserId(Integer userId) {
        return shoppingCartRepository.findShoppingCartItemsByUserId(userId);
    }
}
