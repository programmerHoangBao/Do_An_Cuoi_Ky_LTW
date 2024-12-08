package hcmute.edu.vn.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import hcmute.edu.vn.entity.Product;


public interface IProductService {
	List<Product> findAll();
	Page<Product> findProductByNameContaining(String name, Pageable pageable);
	Page<Product> findProductPageable(Pageable pageable);
	Product findProductById(Integer id);
	Product saveProduct(Product product);
	boolean deleteProduct(Integer idProduct);
}