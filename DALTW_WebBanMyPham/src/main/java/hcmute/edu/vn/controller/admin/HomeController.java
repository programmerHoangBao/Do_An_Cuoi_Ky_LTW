package hcmute.edu.vn.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("adminHomeController")
public class HomeController {
	@GetMapping(value = "/admin/home")
	public String Home() {
		return "Home/home";
	}
}
