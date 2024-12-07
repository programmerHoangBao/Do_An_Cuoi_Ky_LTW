package hcmute.edu.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import hcmute.edu.vn.entity.Shop;

@Repository
public interface ShopRepository extends JpaRepository<Shop, Integer> {
    @Query(value = "SELECT s.name_shop, SUM(o.total) AS totalRevenue " +
            "FROM Orders o " +
            "JOIN Shops s ON o.id_shop = s.id_shop " + // Kết nối với bảng Shops
            "WHERE (:month IS NULL OR MONTH(o.creation_time) = :month) " +
            "AND (:year IS NULL OR YEAR(o.creation_time) = :year) " +
            "AND o.status_order = 'Đã nhận' " +
            "GROUP BY s.name_shop " +
            "ORDER BY totalRevenue DESC LIMIT 10", nativeQuery = true)
    List<Object[]> findTopShopsByMonthOrYear(@Param("month") Integer month, @Param("year") Integer year);
}
