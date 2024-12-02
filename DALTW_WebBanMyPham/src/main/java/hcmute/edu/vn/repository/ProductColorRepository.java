package hcmute.edu.vn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hcmute.edu.vn.entity.ProductColor;

@Repository
public interface ProductColorRepository extends JpaRepository<ProductColor, Integer>{
	@Query("SELECT pc FROM ProductColor pc WHERE pc.product.id_product = :id_product")
	List<ProductColor> findProductColorByIdProduct(@Param("id_product") Integer id_product);
}

