package hcmute.edu.vn.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import hcmute.edu.vn.entity.Product;


public interface IProductService {
	List<Product> findAll();
	List<Product> findProductByNameContaining(String nameProduct);
	Page<Product> findProductPageable(Pageable pageable);
	Product findProductById(Integer id);
	boolean saveProduct(Product product);
	boolean deleteProduct(Integer idProduct);
}