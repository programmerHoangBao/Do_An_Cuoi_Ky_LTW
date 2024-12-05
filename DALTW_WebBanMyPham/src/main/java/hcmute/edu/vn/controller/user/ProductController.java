package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.service.implement.ProductColorService;
import hcmute.edu.vn.service.implement.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;


    @GetMapping("/product/{id}")
    public String productDetail(@PathVariable("id") Integer id, ModelMap model) {
        Product product = productService.findProductById(id);
        model.addAttribute("product", product);
        return "user/product-detail";
    }

    @GetMapping("/followshop/{idShop}&{idUser}")
    @ResponseBody
    public String followShop(@PathVariable("idShop") Integer idShop, @PathVariable("idUser") Integer idUser) {
        // Logic xử lý khi người dùng theo dõi shop
        // Ví dụ: lưu vào cơ sở dữ liệu

        // Trả về một thông báo hoặc dữ liệu thành công dưới dạng JSON (nếu cần)
        return "{\"status\":\"success\", \"message\":\"Followed the shop successfully\"}";
    }
}
