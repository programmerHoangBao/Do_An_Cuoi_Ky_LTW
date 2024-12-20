package hcmute.edu.vn.service.implement;

import java.util.List;

import hcmute.edu.vn.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.service.IProductService;

@Service
public class ProductService implements IProductService{

	private final ProductRepository productRepository;

	@Autowired
	CategoryService categoryService;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return this.productRepository.findAll();
	}
	
	@Override
	public Page<Product> findProductPageable(Pageable pageable) {
		// TODO Auto-generated method stub
		return this.productRepository.findAll(pageable);
	}
	
	@Override
	public Page<Product> findProductByNameContaining(String name, Pageable pageable) {
		// TODO Auto-generated method stub
		return this.productRepository.findProductByNameContaining(name, pageable);
	}


	@Override
	public Product findProductById(Integer id) {
		// TODO Auto-generated method stub
		return this.productRepository.getReferenceById(id);
	}
	
	@Override
	public Product saveProduct(Product product) {
		// TODO Auto-generated method stub
		return this.productRepository.save(product);
	}

	@Override
	public boolean deleteProduct(Integer idProduct) {
		// TODO Auto-generated method stub
		if (this.productRepository.existsById(idProduct)) {
			this.productRepository.deleteById(idProduct);
			return true;
		}
		return false;
	}

	@Override
	public Page<Product> findProductByShopId(Integer shopId, Pageable pageable) {
		// TODO Auto-generated method stub
		return this.productRepository.findProductsByShopId(shopId,pageable);
	}
}

