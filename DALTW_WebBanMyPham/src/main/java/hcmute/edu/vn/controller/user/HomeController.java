package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.FollowShop;
import hcmute.edu.vn.entity.Order;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.FollowShopRepository;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.service.implement.FollowShopService;
import hcmute.edu.vn.service.implement.HistoryProductService;
import hcmute.edu.vn.service.implement.OrderService;
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
import java.util.stream.Collectors;

@Controller("userHomeController")
public class HomeController {

	@Autowired
	ProductRepository productRepository;
	@Autowired
	FollowShopService followShopService;
	@Autowired
	HistoryProductService historyProductService;
	@Autowired
	OrderService orderService;

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
	public String followShop(HttpSession session, ModelMap model) {

		// Lấy thông tin người dùng từ session
		User user = (User) session.getAttribute("user");

		// Kiểm tra nếu người dùng chưa đăng nhập
		if (user == null) {
			return "redirect:/login"; // Redirect đến trang đăng nhập nếu chưa đăng nhập
		}
		// Lấy danh sách các shop mà người dùng đã follow
		List<FollowShop> followShops = followShopService.getShopsFollowedByUser(user.getId_user());

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

	@GetMapping("/user/orders")
	public String listOrders(
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "sort", required = false) String sort,
			HttpSession session,
			Model model) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}

		List<Order> orders = orderService.getOrdersByUser(user);

		// Lọc theo trạng thái nếu có
		if (status != null && !status.isEmpty()) {
			orders = orders.stream()
					.filter(order -> status.contains(order.getStatusOrder()))
					.collect(Collectors.toList());
		}

		// Sắp xếp theo thời gian
		if ("newest".equals(sort)) {
			orders.sort((o1, o2) -> o2.getCreationTime().compareTo(o1.getCreationTime()));
		} else if ("oldest".equals(sort)) {
			orders.sort((o1, o2) -> o1.getCreationTime().compareTo(o2.getCreationTime()));
		}

		model.addAttribute("orders", orders);
		return "user/order-list"; // File JSP hiển thị danh sách
	}



}

