package hcmute.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping(value = {"/", "/admin/home", "/saler/home", "/user/home"})
	public String Home() {
		return "Home/home";
	}
}
