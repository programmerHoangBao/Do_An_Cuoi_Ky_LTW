package hcmute.edu.vn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @Query(value = "SELECT " +
            "    s.name_shop, " +
            "    IFNULL(SUM(o.total), 0) AS totalRevenue, " +
            "    CASE " +
            "        WHEN :day IS NULL AND :month IS NULL THEN MONTH(o.creation_time) " +
            "        WHEN :day IS NULL THEN DAY(o.creation_time) " +
            "        ELSE YEAR(o.creation_time) " +
            "    END AS period " + // period là ngày, tháng, hoặc năm tùy vào điều kiện
            "FROM Orders o " +
            "RIGHT JOIN Shops s ON o.id_shop = s.id_shop " +
            "WHERE s.id_shop = :id_shop " +
            "AND (:day IS NULL OR DAY(o.creation_time) = :day) " +
            "AND (:month IS NULL OR MONTH(o.creation_time) = :month) " +
            "AND (:year IS NULL OR YEAR(o.creation_time) = :year) " +
            "AND (o.status_order = 'Đã nhận' OR o.status_order IS NULL) " +
            "GROUP BY s.id_shop, period", nativeQuery = true)
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
    @Query("SELECT s FROM Shop s WHERE s.name LIKE %:name%")
    Page<Shop> findShopByNameContaining(@Param("name") String name, Pageable pageable);

  @Query("SELECT s FROM Shop s WHERE s.vendor.id_user = :userId")
    Shop findShopByUserId(@Param("userId") Integer userId);
}
