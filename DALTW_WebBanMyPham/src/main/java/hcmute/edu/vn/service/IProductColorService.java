package hcmute.edu.vn.service;

import java.util.List;

import hcmute.edu.vn.entity.ProductColor;


public interface IProductColorService {
	List<ProductColor> findProductColorByIdProduct(Integer idProduct);
	boolean saveProductColor(ProductColor productColor);
	boolean deleteProductColor(Integer idProductColor);
}

