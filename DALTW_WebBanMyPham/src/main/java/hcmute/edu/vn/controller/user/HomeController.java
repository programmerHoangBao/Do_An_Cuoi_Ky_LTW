package hcmute.edu.vn.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("userHomeController")
public class HomeController {
	@GetMapping(value = {"/", "/user/home"})
	public String Home() {
		return "Home/home";
	}
}

