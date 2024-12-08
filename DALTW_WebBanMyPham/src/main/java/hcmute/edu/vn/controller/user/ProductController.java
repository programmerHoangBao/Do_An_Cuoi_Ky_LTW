package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.*;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.implement.*;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

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
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductRepository productRepository;


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

    @GetMapping("/products")
    public String getProducts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String searchType,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) String sortBy,
            @RequestParam(required = false) Integer categoryId, // Thêm tham số categoryId
            ModelMap model,
            HttpSession session) {

        User user = (User) session.getAttribute("user");

        // Xác định số lượng sản phẩm mỗi trang
        int pageSize = 12;

        // Tạo Sort theo yêu cầu (sắp xếp theo giá, ngày)
        Sort sort = Sort.unsorted();
        if ("priceAsc".equals(sortBy)) {
            sort = Sort.by(Sort.Order.asc("price"));
        } else if ("priceDesc".equals(sortBy)) {
            sort = Sort.by(Sort.Order.desc("price"));
        }

        // Tạo Pageable với Sort
        Pageable pageable = PageRequest.of(page, pageSize, sort);

        // Gọi phương thức service để tìm kiếm sản phẩm theo các tham số
        Page<Product> productPage;
        productPage = productRepository.searchProducts(categoryId,keyword,minPrice,maxPrice,pageable);

        // Truyền dữ liệu vào model
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("products", productPage.getContent()); // Sản phẩm hiện tại
        model.addAttribute("currentPage", page); // Trang hiện tại
        model.addAttribute("totalPages", productPage.getTotalPages()); // Tổng số trang
        model.addAttribute("user", user); // Thông tin người dùng
        model.addAttribute("categories", categoryService.findAllCategory()); // Lấy danh sách danh mục sản phẩm

        return "user/product-list";
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
