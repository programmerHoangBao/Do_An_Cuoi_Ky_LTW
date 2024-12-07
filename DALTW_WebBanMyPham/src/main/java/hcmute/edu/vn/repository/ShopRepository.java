package hcmute.edu.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hcmute.edu.vn.entity.Shop;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ShopRepository extends JpaRepository<Shop, Integer>{

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
