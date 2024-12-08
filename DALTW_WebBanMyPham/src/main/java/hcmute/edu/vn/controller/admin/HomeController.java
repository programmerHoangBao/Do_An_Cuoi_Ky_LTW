package hcmute.edu.vn.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("adminHomeController")
public class HomeController {

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
		
		return "Home/home";
	}
}
