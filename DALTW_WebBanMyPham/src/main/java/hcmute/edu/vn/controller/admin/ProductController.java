package hcmute.edu.vn.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ProductColor;
import hcmute.edu.vn.service.IProductColorService;
import hcmute.edu.vn.service.IProductService;

@Controller("adminProduct")
public class ProductController {

	@Autowired
	private IProductService productService;

	@Autowired
	private IProductColorService productColorService;

	@GetMapping("/admin/list-product")
	public String GetAllProduct(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size,
			Model model) {

		Pageable pageable = PageRequest.of(page, size);
		Page<Product> productPage = this.productService.findProductPageable(pageable);
		List<ProductColor> productColors;
		int index = 0;
		for (Product product : productPage) {
			productColors = new ArrayList<>();
			productColors = productColorService.findProductColorByIdProduct(product.getId_product());
			product.setProductColors(productColors);
		}
		model.addAttribute("products", productPage.getContent());
		model.addAttribute("index", index);
		model.addAttribute("currentPage", page); 
		model.addAttribute("totalPages", productPage.getTotalPages());
		return "admin/Product/list-product";
	}

}
