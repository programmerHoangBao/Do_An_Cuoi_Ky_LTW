package hcmute.edu.vn.repository;

import hcmute.edu.vn.entity.FollowShop;
import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FollowShopRepository extends JpaRepository<FollowShop, Long> {
    boolean existsByShopAndUser(Shop shop, User user);
    List<FollowShop> findByUser(User user);
}
