package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.implement.UserService;
import hcmute.edu.vn.service.implement.FollowShopService;
import hcmute.edu.vn.service.implement.ProductService;
import hcmute.edu.vn.service.implement.ShopService;
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
    @Autowired
    ShopService shopService;
    @Autowired
    FollowShopService followShopService;
    @Autowired
    UserRepository userRepository;

    @GetMapping("/product/{id}")
    public String productDetail(@PathVariable("id") Integer id, ModelMap model) {
        Product product = productService.findProductById(id);
        model.addAttribute("product", product);
        return "user/product-detail";
    }

    @GetMapping("/followshop/{idShop}&{idUser}")
    @ResponseBody
    public String followShop(@PathVariable("idShop") Integer idShop, @PathVariable("idUser") Integer idUser) {
        try {
            // Lấy đối tượng Shop và User từ cơ sở dữ liệu
            Shop shop = shopService.findById(idShop); // Thay thế shopService bằng service thực tế của bạn
            User user = userRepository.getReferenceById(idUser); // Thay thế userService bằng service thực tế của bạn

            if (shop == null) {
                return "{\"status\":\"error\", \"message\":\"Shop or User not found\"}";
            }

            // Lưu vào cơ sở dữ liệu
            followShopService.addFollowShop(user,shop); // Thay thế followShopService bằng service thực tế của bạn

            return "{\"status\":\"success\", \"message\":\"Followed the shop successfully\"}";
        } catch (Exception e) {
            // Xử lý lỗi nếu xảy ra
            e.printStackTrace();
            return "{\"status\":\"error\", \"message\":\"An error occurred while processing the request\"}";
        }
    }
    @GetMapping("/api/check-follow/{shopId}/{userId}")
    @ResponseBody
    public boolean isFollowed(@PathVariable("shopId") Integer shopId, @PathVariable("userId") Integer userId) {
        Shop shop = shopService.findById(shopId); // Thay thế shopService bằng service thực tế của bạn
        User user = userRepository.getReferenceById(userId); // Thay thế userService bằng service thực tế của bạn
        return followShopService.isFollowed(shop, user); // Trả về true nếu đã follow, false nếu chưa
    }
}
