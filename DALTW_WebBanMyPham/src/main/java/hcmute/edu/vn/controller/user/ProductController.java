package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.HistoryProduct;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.implement.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    ShopRepository shopRepository;
    @Autowired
    HistoryProductService historyProductService;


    @GetMapping("/product/{id}")
    public String productDetail(@PathVariable("id") Integer id, ModelMap model, HttpSession session) {
        // Lấy sản phẩm từ cơ sở dữ liệu
        Product product = productService.findProductById(id);

        // Lấy thông tin người dùng từ session
        User user = (User) session.getAttribute("user");

        // Nếu người dùng đã đăng nhập (user_id có trong session), lưu vào bảng HistoryProduct
        if (user != null) {
            // Tạo đối tượng HistoryProduct
            HistoryProduct historyProduct = new HistoryProduct();
            historyProduct.setUser(user);
            historyProduct.setProduct(product);

            // Lưu thông tin vào cơ sở dữ liệu
            historyProductService.saveHistoryProduct(historyProduct);  // Gọi service để lưu vào bảng HistoryProduct
        }

        // Truyền thông tin sản phẩm và người dùng vào model
        model.addAttribute("product", product);
        model.addAttribute("user", user);

        return "user/product-detail";
    }

    @GetMapping("/followshop/{idShop}&{idUser}")
    @ResponseBody
    public String followShop(@PathVariable("idShop") Integer idShop, @PathVariable("idUser") Integer idUser) {
        try {
            // Lấy đối tượng Shop và User từ cơ sở dữ liệu
            Shop shop = shopRepository.getReferenceById(idShop); // Thay thế shopService bằng service thực tế của bạn
            User user = userRepository.getReferenceById(idUser); // Thay thế userService bằng service thực tế của bạn

            // Lưu vào cơ sở dữ liệu
            followShopService.addFollowShop(user,shop); // Thay thế followShopService bằng service thực tế của bạn

            return "{\"status\":\"success\", \"message\":\"Followed the shop successfully\"}";
        } catch (Exception e) {

            return "{\"status\":\"error\", \"message\":\"An error occurred while processing the request\"}";
        }
    }
    @GetMapping("/deletefollowshop/{idShop}&{idUser}")
    @ResponseBody
    public String deleteFollowShop(@PathVariable("idShop") Integer idShop, @PathVariable("idUser") Integer idUser) {
        try {
            // Lấy đối tượng Shop và User từ cơ sở dữ liệu
            Shop shop = shopService.findShopById(idShop); // Thay thế shopService bằng service thực tế của bạn
            User user = userRepository.getReferenceById(idUser); // Thay thế userService bằng service thực tế của bạn

            if (shop == null) {
                return "{\"status\":\"error\", \"message\":\"Shop or User not found\"}";
            }

            // Lưu vào cơ sở dữ liệu
            followShopService.deleteFollowShopByUserAndShop(user,shop); // Thay thế followShopService bằng service thực tế của bạn

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
        Shop shop = shopService.findShopById(shopId); // Thay thế shopService bằng service thực tế của bạn
        User user = userRepository.getReferenceById(userId); // Thay thế userService bằng service thực tế của bạn
        return followShopService.isFollowed(shop, user); // Trả về true nếu đã follow, false nếu chưa
    }


}
