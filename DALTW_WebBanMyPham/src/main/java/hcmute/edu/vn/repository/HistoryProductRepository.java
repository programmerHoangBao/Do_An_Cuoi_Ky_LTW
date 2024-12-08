package hcmute.edu.vn.repository;

import hcmute.edu.vn.entity.HistoryProduct;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface HistoryProductRepository extends JpaRepository<HistoryProduct, Integer> {
    // Các phương thức tìm kiếm tùy chỉnh nếu cần
    // Tìm tất cả các HistoryProduct theo user
    List<HistoryProduct> findByUser(User user);

    // Tìm kiếm lịch sử sản phẩm đã có trong bảng history_product
    Optional<HistoryProduct> findByUserAndProduct(User user, Product product);
}