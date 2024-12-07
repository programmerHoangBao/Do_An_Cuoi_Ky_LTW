package hcmute.edu.vn.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ProductColor;
import hcmute.edu.vn.service.ICategoryService;
import hcmute.edu.vn.service.IProductColorService;
import hcmute.edu.vn.service.IProductService;
import hcmute.edu.vn.service.IShopService;

@Controller("adminProduct")
public class ProductController {

	@Autowired
	private IProductService productService;

	@Autowired
	private IProductColorService productColorService;

	@Autowired
	private IShopService shopService;

	@Autowired
	private ICategoryService categoryService;

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
	
	@GetMapping("/admin/search-product")
	public String SearchProduct(
			@RequestParam(name="name", required=false, defaultValue = "") String name,
			@RequestParam(name="page", required = false, defaultValue = "0") int page,
			@RequestParam(name = "size", required=false, defaultValue="20") int size,
			Model model) {

		Pageable pageable = PageRequest.of(page, size);
		Page<Product> productPage = this.productService.findProductByNameContaining(name, pageable);
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

	@GetMapping("/admin/insert-product")
	public String showProductForm(Model model) {
		model.addAttribute("shops", shopService.findAllShop());
		model.addAttribute("categories", categoryService.findAllCategory());
		return "admin/Product/insert-product";
	}

	@PostMapping("/admin/insert-product")
	@RequestMapping("/admin/insert-product")
	public ResponseEntity<String> insertProduct(
			@RequestParam("nameProduct") String name, 
			@RequestParam("idShop") Integer id_shop,
			@RequestParam("idCategory") Integer id_category, 
			@RequestParam("price") Double price,
			@RequestParam("quantity") Integer quantity, 
			@RequestParam("statusProduct") Integer status,
			@RequestParam List<String> colors,
			@RequestParam List<MultipartFile> images
			)  throws IOException
	{
		try {
			// Lưu sản phẩm
			Product product = new Product();
			product.setName(name);
			product.setShop(this.shopService.findShopById(id_shop));
			product.setCategory(this.categoryService.findCategoryById(id_category));
			product.setPrice(price);
			product.setQuantity(quantity);
			if (status == 1) {
				product.setStatus_product(true);
			} else {
				product.setStatus_product(false);
			}
			product = productService.saveProduct(product);
			
			List<ProductColor> productColors = new ArrayList<>();
			
			String color;
			MultipartFile image;
			String uploadeDir;
			for (int i = 0; i < colors.size(); i++) {
				color = colors.get(i);
				image = images.get(i);
				
				uploadeDir = "D:/tmp/";
				
				File uploadFile = new File(uploadeDir + image.getOriginalFilename());
				image.transferTo(uploadFile); 
				
				ProductColor productColor = new ProductColor();
				productColor.setColor(color);
				productColor.setImageProduct(uploadFile.getAbsolutePath());
				productColor.setProduct(product);
				
				productColors.add(productColor);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok("Dữ liệu và tệp đã được nhận thành công!");
	}
}