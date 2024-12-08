package hcmute.edu.vn.repository;

import hcmute.edu.vn.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
//    // Doanh thu từng ngày trong tháng hiện tại đến ngày được chọn
//    @Query("SELECT FUNCTION('DAY', o.creationTime) as day, SUM(o.total) as total " +
//            "FROM Order o WHERE o.statusOrder = 'Đã nhận' " +
//            "AND FUNCTION('MONTH', o.creationTime) = :month AND FUNCTION('YEAR', o.creationTime) = :year " +
//            "AND FUNCTION('DAY', o.creationTime) <= :day GROUP BY FUNCTION('DAY', o.creationTime)")
//    List<Object[]> getDailyRevenue(@Param("month") int month, @Param("year") int year, @Param("day") int day);
//
//    // Doanh thu từng tháng trong năm hiện tại đến tháng được chọn
//    @Query("SELECT FUNCTION('MONTH', o.creationTime) as month, SUM(o.total) as total " +
//            "FROM Order o WHERE o.statusOrder = 'Đã nhận' " +
//            "AND FUNCTION('YEAR', o.creationTime) = :year " +
//            "AND FUNCTION('MONTH', o.creationTime) <= :month GROUP BY FUNCTION('MONTH', o.creationTime)")
//    List<Object[]> getMonthlyRevenue(@Param("year") int year, @Param("month") int month);
//
//    // Doanh thu từng năm
//    @Query("SELECT FUNCTION('YEAR', o.creationTime) as year, SUM(o.total) as total " +
//            "FROM Order o WHERE o.statusOrder = 'Đã nhận' GROUP BY FUNCTION('YEAR', o.creationTime)")
//    List<Object[]> getYearlyRevenue();
//
//    //Doanh thu ngày hiện tại
//    @Query("SELECT o.creationTime, SUM(o.total) " +
//            "FROM Order o " +
//            "WHERE o.creationTime >= :startDate AND o.creationTime < :endDate " +
//            "GROUP BY o.creationTime " +
//            "ORDER BY o.creationTime")
//    List<Object[]> findRevenueByDate(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query("SELECT FUNCTION('DAY', o.creationTime) as day, SUM(o.total) as total " +
            "FROM Order o WHERE o.statusOrder = 'Đã nhận' " +
            "AND FUNCTION('MONTH', o.creationTime) = :month " +
            "AND FUNCTION('YEAR', o.creationTime) = :year " +
            "AND FUNCTION('DAY', o.creationTime) <= :day " +
            "AND o.shop.id_shop = :idShop " +  // Lọc theo shop
            "GROUP BY FUNCTION('DAY', o.creationTime)")
    List<Object[]> getDailyRevenue(@Param("month") int month, @Param("year") int year,
                                   @Param("day") int day, @Param("idShop") Integer idShop);

    @Query("SELECT FUNCTION('MONTH', o.creationTime) as month, SUM(o.total) as total " +
            "FROM Order o WHERE o.statusOrder = 'Đã nhận' " +
            "AND FUNCTION('YEAR', o.creationTime) = :year " +
            "AND FUNCTION('MONTH', o.creationTime) <= :month " +
            "AND o.shop.id_shop = :idShop " +  // Lọc theo shop
            "GROUP BY FUNCTION('MONTH', o.creationTime)")
    List<Object[]> getMonthlyRevenue(@Param("year") int year, @Param("month") int month,
                                     @Param("idShop") Integer idShop);

    @Query("SELECT FUNCTION('YEAR', o.creationTime) as year, SUM(o.total) as total " +
            "FROM Order o WHERE o.statusOrder = 'Đã nhận' " +
            "AND o.shop.id_shop = :idShop " +  // Lọc theo shop
            "GROUP BY FUNCTION('YEAR', o.creationTime)")
    List<Object[]> getYearlyRevenue(@Param("idShop") Integer idShop);

    @Query("SELECT o.creationTime, SUM(o.total) " +
            "FROM Order o " +
            "WHERE o.creationTime >= :startDate AND o.creationTime < :endDate " +
            "AND o.shop.id_shop = :idShop " +  // Lọc theo shop
            "GROUP BY o.creationTime " +
            "ORDER BY o.creationTime")
    List<Object[]> findRevenueByDate(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate,
                                     @Param("idShop") Integer idShop);

}
