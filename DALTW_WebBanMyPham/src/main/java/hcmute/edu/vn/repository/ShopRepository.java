package hcmute.edu.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

import hcmute.edu.vn.entity.Shop;
import org.springframework.transaction.annotation.Transactional;

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

    @Query(value = "SELECT s.name_shop, SUM(o.total) AS totalRevenue " +
            "FROM Orders o " +
            "JOIN Shops s ON o.id_shop = s.id_shop " + // Kết nối với bảng Shops
            "WHERE (:day IS NULL OR DAY(o.creation_time) = :day) " +
            "AND (:month IS NULL OR MONTH(o.creation_time) = :month) " +
            "AND (:year IS NULL OR YEAR(o.creation_time) = :year) " +
            "AND o.status_order = 'Đã nhận' " +
            "AND s.id_shop = :id_shop " +
            "GROUP BY s.name_shop ", nativeQuery = true)
    Object revenueByDayOrMonthOrYear(
            @Param("id_shop") Integer id_shop,
            @Param("day") Integer day,
            @Param("month") Integer month,
            @Param("year") Integer year
    );

    @Modifying
    @Transactional
    @Query("""
    UPDATE Shop s
    SET s.name = :name, s.address = :address, s.introduce = :introduce
    WHERE s.id_shop = :id_shop
""")
    void updateShopById(
            @Param("id_shop") Integer id_shop,
            @Param("name") String name,
            @Param("address") String address,
            @Param("introduce") String introduce
            );
}
