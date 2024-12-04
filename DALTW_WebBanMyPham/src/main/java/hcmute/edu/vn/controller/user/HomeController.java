package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.repository.ProductRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller("userHomeController")
public class HomeController {

	@Autowired
	ProductRepository productRepository;

	@GetMapping(value = {"/", "/user/home"})
	public String Home(HttpServletRequest request, Model model, Authentication authentication) {
		if (authentication != null) {
			model.addAttribute("username", authentication.getName()); // Lưu tên người dùng vào model
		}

		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "user/home";
	}
}

