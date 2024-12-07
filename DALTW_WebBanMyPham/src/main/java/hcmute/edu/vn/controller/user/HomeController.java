package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.FollowShop;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.FollowShopRepository;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.service.implement.FollowShopService;
import hcmute.edu.vn.service.implement.HistoryProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller("userHomeController")
public class HomeController {

	@Autowired
	ProductRepository productRepository;
	@Autowired
	FollowShopService followShopService;
	@Autowired
	HistoryProductService historyProductService;

	@GetMapping(value = {"/", "/user/home"})
	public String Home(HttpServletRequest request, Model model, Authentication authentication) {
		if (authentication != null) {
			model.addAttribute("username", authentication.getName()); // Lưu tên người dùng vào model
		}

		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "user/home";
	}

	@GetMapping("/user/follow-shop")
	public String followShop(@RequestParam Integer userId, ModelMap model) {
		// Lấy danh sách các shop mà người dùng đã follow
		List<FollowShop> followShops = followShopService.getShopsFollowedByUser(userId);

		// In dữ liệu ra console
		System.out.println("User ID: " + userId);
		if (followShops != null && !followShops.isEmpty()) {
			for (FollowShop followShop : followShops) {
				System.out.println("Followed Shop Name: " + followShop.getShop().getName());
				System.out.println("Followed Shop Address: " + followShop.getShop().getAddress());
				System.out.println("Followed Shop Introduce: " + followShop.getShop().getIntroduce());
			}
		} else {
			System.out.println("No shops found for user with ID: " + userId);
		}

		model.addAttribute("followShops", followShops);
		return "user/follow-shop";
	}

	@GetMapping("/user/history")
	public String viewHistory(ModelMap model, HttpSession session) {
		// Lấy thông tin người dùng từ session
		User user = (User) session.getAttribute("user");

		// Kiểm tra nếu người dùng chưa đăng nhập
		if (user == null) {
			return "redirect:/login"; // Redirect đến trang đăng nhập nếu chưa đăng nhập
		}

		// Lấy các sản phẩm đã xem của người dùng
		List<Product> productsViewed = historyProductService.getProductsViewedByUser(user);

		// Thêm sản phẩm vào model
		model.addAttribute("productsViewed", productsViewed);

		return "user/product-history"; // Trả về view hiển thị sản phẩm đã xem
	}


}

