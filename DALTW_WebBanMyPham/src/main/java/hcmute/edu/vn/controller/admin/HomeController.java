package hcmute.edu.vn.controller.admin;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.repository.ProductRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller("adminHomeController")
public class HomeController {

	@Autowired
	ProductRepository productRepository;

	@GetMapping(value = "/admin/home")
	public String Home(HttpServletRequest request, Model model, Authentication authentication) {
		HttpSession session = request.getSession();
//		String sessionId = session.getId();

		// Truyền sessionId vào view
//		model.addAttribute("sessionId", sessionId);

//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		Object principal = authentication.getPrincipal();
		if (authentication != null) {
			model.addAttribute("username", authentication.getName()); // Lưu tên người dùng vào model
		}

		List<Product> products = productRepository.findAll();

		// Lấy 10 sản phẩm đầu tiên
		List<Product> products1 = products.stream().limit(10).collect(Collectors.toList());

		// Lấy 10 sản phẩm cuối cùng
		List<Product> products2 = products.size() > 10 ? products.subList(products.size() - 10, products.size()) : products;

		// Thêm vào model
		model.addAttribute("products1", products1);
		model.addAttribute("products2", products2);
		
		return "Home/home";
	}
}
