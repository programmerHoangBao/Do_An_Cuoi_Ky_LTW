package hcmute.edu.vn.controller.admin;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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

    // Hàm lấy đường dẫn thư mục lưu file
    private String getUploadDirectory() {
        String rootPath = System.getProperty("user.dir"); // Thư mục gốc của ứng dụng
        return rootPath + "/src/main/webapp/templates/images";
    }
	
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
	public String SearchProduct(@RequestParam(name = "name", required = false, defaultValue = "") String name,
			@RequestParam(name = "page", required = false, defaultValue = "0") int page,
			@RequestParam(name = "size", required = false, defaultValue = "20") int size, Model model) {

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
	public String insertProduct(
			@RequestParam("nameProduct") String name,
			@RequestParam("idShop") Integer id_shop,
			@RequestParam("idCategory") Integer id_category, 
			@RequestParam("price") Double price,
			@RequestParam("quantity") Integer quantity, 
			@RequestParam("statusProduct") boolean status,
			@RequestParam(value = "colors[]", required = false) List<String> colors,
            @RequestParam(value = "images[]", required = false) List<MultipartFile> images,
	        Model model)
			 {
		try {
			// Lưu sản phẩm
			Product product = new Product();
			product.setName(name);
			product.setShop(this.shopService.findShopById(id_shop));
			product.setCategory(this.categoryService.findCategoryById(id_category));
			product.setPrice(price);
			product.setQuantity(quantity);
			product.setStatus_product(status);
			
			product = productService.saveProduct(product);

			 List<ProductColor> productColors = new ArrayList<>();
			 
			if (colors != null && images != null && colors.size() == images.size()) {
	                for (int i = 0; i < colors.size(); i++) {
	                    ProductColor productColor = new ProductColor();
	                    productColor.setProduct(product); // Liên kết với sản phẩm đã lưu
	                    productColor.setColor(colors.get(i));

	                    // Lưu tệp ảnh
	                    
	                 // Lấy thời gian hiện tại
	                    LocalDateTime currentTime = LocalDateTime.now();

	                    // Định dạng thời gian theo yêu cầu
	                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yy HH-mm-ss");

	                    // Chuyển đổi sang chuỗi theo định dạng
	                    String formattedTime = currentTime.format(formatter);
	                    
	                    String fileName = formattedTime+images.get(i).getOriginalFilename();
	                    
	                    String filePath = getUploadDirectory() + "/" + fileName;
	                    images.get(i).transferTo(new java.io.File(filePath)); // Lưu ảnh vào thư mục

	                    productColor.setImageProduct("/templates/images/"+fileName); // Ghi đường dẫn ảnh vào database
	                    productColors.add(productColor);
	                }
			}
			
			 // Lưu màu sắc vào database
	        for (ProductColor productColor : productColors) {
	            productColorService.saveProductColor(productColor);
	        }
	        
	        model.addAttribute("message", "Sản phẩm đã được thêm thành công!");
		} catch (Exception e) {
			model.addAttribute("message", "Đã xảy ra lỗi khi thêm sản phẩm: " + e.getMessage());
		}
		model.addAttribute("shops", shopService.findAllShop());
		model.addAttribute("categories", categoryService.findAllCategory());
		return "admin/Product/insert-product";
	}
	
	@GetMapping("/admin/update-product")
	public String GetUpdatePrduct(
			Model model, 
			@RequestParam(name = "id", required = false, defaultValue = "") Integer id_product
			) {
		Product product = new Product();
		product = this.productService.findProductById(id_product);
		List<ProductColor> productColors = this.productColorService.findProductColorByIdProduct(id_product);
		product.setProductColors(productColors);
		model.addAttribute("shops", shopService.findAllShop());
		model.addAttribute("categories", categoryService.findAllCategory());
		
		model.addAttribute("product", product);
		return "admin/Product/update-product";
	}
	
	@PostMapping("/admin/update-product")
	public String updateProduct(
			@RequestParam(name = "id", required = false, defaultValue = "") Integer id_product,
			@RequestParam("nameProduct") String name,
			@RequestParam("idShop") Integer id_shop,
			@RequestParam("idCategory") Integer id_category, 
			@RequestParam("price") Double price,
			@RequestParam("quantity") Integer quantity, 
			@RequestParam("statusProduct") boolean status,
			@RequestParam(value = "colors[]", required = false) List<String> colors,
            @RequestParam(value = "images[]", required = false) List<MultipartFile> images,
	        Model model) {
		try {
			// Lưu sản phẩm
			Product product = new Product();
			product.setId_product(id_product);
			product.setName(name);
			product.setShop(this.shopService.findShopById(id_shop));
			product.setCategory(this.categoryService.findCategoryById(id_category));
			product.setPrice(price);
			product.setQuantity(quantity);
			product.setStatus_product(status);
			
			product = productService.saveProduct(product);

			 List<ProductColor> productColors = new ArrayList<>();
			 
			if (colors != null && images != null && colors.size() == images.size()) {
	                for (int i = 0; i < colors.size(); i++) {
	                    ProductColor productColor = new ProductColor();
	                    productColor.setProduct(product); // Liên kết với sản phẩm đã lưu
	                    productColor.setColor(colors.get(i));

	                    // Lưu tệp ảnh
	                    
	                 // Lấy thời gian hiện tại
	                    LocalDateTime currentTime = LocalDateTime.now();

	                    // Định dạng thời gian theo yêu cầu
	                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yy HH-mm-ss");

	                    // Chuyển đổi sang chuỗi theo định dạng
	                    String formattedTime = currentTime.format(formatter);
	                    
	                    String fileName = formattedTime+images.get(i).getOriginalFilename();
	                    
	                    String filePath = getUploadDirectory() + "/" + fileName;
	                    images.get(i).transferTo(new java.io.File(filePath)); // Lưu ảnh vào thư mục

	                    productColor.setImageProduct("/templates/images/"+fileName); // Ghi đường dẫn ảnh vào database
	                    productColors.add(productColor);
	                }
			}
			
			 // Lưu màu sắc vào database
	        for (ProductColor productColor : productColors) {
	            productColorService.saveProductColor(productColor);
	        }
	        
	        model.addAttribute("message", "Sản phẩm đã được cập nhật thành công!");
		} catch (Exception e) {
			model.addAttribute("message", "Đã xảy ra lỗi khi cập nhật sản phẩm: " + e.getMessage());
		}
		model.addAttribute("shops", shopService.findAllShop());
		model.addAttribute("categories", categoryService.findAllCategory());
		return "admin/Product/update-product";
	}
}