package hcmute.edu.vn.repository;

import hcmute.edu.vn.dto.ShoppingCartDTO;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ShoppingCart;
import hcmute.edu.vn.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {
    ShoppingCart findByUserAndProduct(User user, Product product);
    List<ShoppingCart> findByUser(User user);

    // Truy vấn thông tin giỏ hàng của người dùng theo userId
    @Query("SELECT new hcmute.edu.vn.dto.ShoppingCartDTO(" +
            "p.id_product, " +
            "p.name, " +
            "p.price, " +
            "sc.quantity, " +
            "pc.imageProduct) " +  // Lấy thông tin imageProduct từ bảng ProductColor
            "FROM ShoppingCart sc " +
            "JOIN sc.product p " +
            "JOIN p.productColors pc " +  // Kết nối với bảng ProductColor
            "WHERE sc.user.id_user = :userId " +
            "AND pc.id_product_color = (" +
            "    SELECT min(pc2.id_product_color) " +  // Chọn hình ảnh đầu tiên
            "    FROM ProductColor pc2 " +
            "    WHERE pc2.product.id_product = p.id_product" +
            ")")
    List<ShoppingCartDTO> findShoppingCartItemsByUserId(Integer userId);
}
