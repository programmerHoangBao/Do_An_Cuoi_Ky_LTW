package hcmute.edu.vn.controller.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


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
	@GetMapping("/admin/insert-product")
    public String showProductForm(Model model) {
        model.addAttribute("shops", shopService.findAllShop());
        model.addAttribute("categories", categoryService.findAllCategory());
        model.addAttribute("product", new Product());
        model.addAttribute("productColors", new ArrayList<ProductColor>());
        return "admin/Product/insert-product";
    }

    @PostMapping("/admin/insert-product")
    public String insertProduct(@ModelAttribute Product product,
                                @RequestParam("colorList") String colorList,
                                @RequestParam("imageUrlList") String imageUrlList,
                                Model model) {
        try {
            // Lưu sản phẩm
            product = productService.saveProduct(product);

            // Lưu các màu sắc và hình ảnh
            List<String> colors = Arrays.asList(colorList.split(","));
            List<String> imageUrls = Arrays.asList(imageUrlList.split(","));
            for (int i = 0; i < colors.size(); i++) {
                ProductColor productColor = new ProductColor();
                productColor.setProduct(product);
                productColor.setColor(colors.get(i));
                productColor.setImageProduct(imageUrls.get(i));
                productColorService.saveProductColor(productColor);
            }

            model.addAttribute("message", "Sản phẩm được thêm thành công!");
        } catch (Exception e) {
            model.addAttribute("message", "Không thể thêm sản phẩm!");
        }
        return "admin/Product/insert-product";
    }
}
