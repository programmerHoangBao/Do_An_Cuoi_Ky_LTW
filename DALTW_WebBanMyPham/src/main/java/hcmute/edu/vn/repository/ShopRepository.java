package hcmute.edu.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hcmute.edu.vn.entity.Shop;

@Repository
public interface ShopRepository extends JpaRepository<Shop, Integer>{
	
}
