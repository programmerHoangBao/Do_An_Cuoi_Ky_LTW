package hcmute.edu.vn.controller.vendor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("vendorHomeController")
public class HomeController {
	@GetMapping(value = "/vendor/home")
	public String Home() {
		return "Home/home";
	}
}

