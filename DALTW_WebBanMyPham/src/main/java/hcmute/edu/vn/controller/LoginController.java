package hcmute.edu.vn.controller;

import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.service.IUserService;
import hcmute.edu.vn.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private IUserService userService;

    @GetMapping("/login")
    public String handleLogin(
            HttpServletRequest request,
            Model model) {
        Cookie[] cookies = request.getCookies();
        String username = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (Constant.COOKIE_REMEMBER.equals(cookie.getName())) {
                    username = cookie.getValue();
                    break;
                }
            }
        }
        model.addAttribute("cookie_user", username);
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam(value = "remember", required = false) String remember,
            HttpServletRequest request,
            HttpServletResponse response,
            Model model) {
        boolean isRememberMe = "on".equals(remember);
        String alertMsg = "";

        User user = userService.checkLogin(email, password);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("account", user);
            if (isRememberMe) {
                saveRememberMe(response, email);
            }
            return "redirect:/waiting";
        } else {
            alertMsg = "Tài khoản hoặc mật khẩu không đúng";
            model.addAttribute("alert", alertMsg);
            return "login";
        }
    }

    private void saveRememberMe(HttpServletResponse response, String username) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(30 * 60);
        response.addCookie(cookie);
    }
}

