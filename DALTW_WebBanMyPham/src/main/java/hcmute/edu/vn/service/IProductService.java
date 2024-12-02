package hcmute.edu.vn.service;

import java.util.List;

import hcmute.edu.vn.entity.Product;


public interface IProductService {
	List<Product> findAll();
	List<Product> findProductByNameContaining(String nameProduct);
	Product findProductById(Integer id);
	boolean saveProduct(Product product);
	boolean deleteProduct(Integer idProduct);
}