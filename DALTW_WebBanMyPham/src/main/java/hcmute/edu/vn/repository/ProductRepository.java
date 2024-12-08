package hcmute.edu.vn.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hcmute.edu.vn.entity.Product;


@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	@Query("SELECT p FROM Product p WHERE p.name LIKE %:name%")
	Page<Product> findProductByNameContaining(@Param("name") String name, Pageable pageable);

	@Query("SELECT p FROM Product p WHERE p.shop.id_shop = :idShop")
	Page<Product> findProductsByShopId(@Param("idShop") Integer idShop, Pageable pageable);
}