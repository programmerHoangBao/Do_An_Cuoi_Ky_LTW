package hcmute.edu.vn.service.implement;

import java.util.List;

import org.springframework.stereotype.Service;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.service.IProductService;

@Service
public class ProductService implements IProductService{

	private final ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return this.productRepository.findAll();
	}

	@Override
	public List<Product> findProductByNameContaining(String nameProduct) {
		// TODO Auto-generated method stub
		return this.productRepository.findProductByNameContaining(nameProduct);
	}

	@Override
	public Product findProductById(Integer id) {
		// TODO Auto-generated method stub
		return this.productRepository.getReferenceById(id);
	}
	
	@Override
	public boolean saveProduct(Product product) {
		// TODO Auto-generated method stub
		if(this.productRepository.save(product) == null) {
			return false;
		}
		return true;
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
}

