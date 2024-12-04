package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.service.implement.ProductColorService;
import hcmute.edu.vn.service.implement.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;
    @Autowired
    ProductColorService productColorService;

    @GetMapping("/product/{id}")
    public String productDetail(@PathVariable("id") Integer id, ModelMap model) {
        Product product = productService.findProductById(id);
        product.setProductColors(productColorService.findProductColorByIdProduct(id));
        model.addAttribute("product", product);
        return "user/product-detail";
    }
}
