package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller("userHomeController")
public class HomeController {

	@Autowired
	ProductRepository productRepository;

	@GetMapping(value = {"/", "/user/home"})
	public String Home(ModelMap model) {
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "User/home";
	}
}

