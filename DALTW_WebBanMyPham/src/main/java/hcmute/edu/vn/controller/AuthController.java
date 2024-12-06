package hcmute.edu.vn.controller;

import hcmute.edu.vn.config.security.UserInfoService;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.entity.UserInfo;
import hcmute.edu.vn.model.AuthRequest;
import hcmute.edu.vn.repository.UserInfoRepository;
import hcmute.edu.vn.service.UserService;
import hcmute.edu.vn.service.implement.UserService1;
import hcmute.edu.vn.utils.JwtUtil;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserService1 userService1;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserInfoService userDetailsService;
    
    @Autowired
    private UserInfoRepository userInfoRepository;
    
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("userInfo", new UserInfo());
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("userInfo") @Validated UserInfo userInfo, BindingResult result) {
    	// Validation
        if (result.hasErrors()) {
            return "auth/register";
        }
        
        // Add user to Database
        userService.registerUser(userInfo);
        return "redirect:/register/register-verify-otp?email=" + userInfo.getEmail();
    }
    
    // Trang để người dùng nhập OTP
    @GetMapping("/register/register-verify-otp")
    public String showVerifyOtpPage() {
        return "auth/register-verify-otp";
    }
    
    @GetMapping("/login")
    public String loginUser(@RequestParam(value = "error", required = false) String error, Model model) {
    	if (error != null) {
    		model.addAttribute("message", "Invalid username or password");
    	}
    	model.addAttribute("userModel", new AuthRequest());
    	return "auth/login";
    }
    
    @PostMapping("/authenticate")
    public String authenticate(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               HttpServletResponse response, Model model) {
        try {
        	// Tìm người dùng trong cơ sở dữ liệu
            UserInfo user = userInfoRepository.findByName(username)
                    .orElseThrow(() -> new UsernameNotFoundException("User not found"));

            if (!user.isEnabled()) {
                model.addAttribute("error", "Your account is disabled.");
                return "redirect:/login";
            }

            // Tiến hành xác thực người dùng
            authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password)
            );

            final UserDetails userDetails = userDetailsService.loadUserByUsername(username);
            String token = jwtUtil.generateToken(userDetails.getUsername());
            
            // Thiết lập token dưới dạng cookie
            Cookie jwtCookie = new Cookie("JWT", token);
            jwtCookie.setHttpOnly(true); // Bảo mật cookie, không truy cập được từ JavaScript
            jwtCookie.setPath("/"); // Áp dụng cookie cho toàn bộ ứng dụng
            jwtCookie.setMaxAge(60 * 60 * 10); // Thời hạn 10 giờ
            response.addCookie(jwtCookie);
            
            // Lưu token vào model để truyền sang view nếu cần
            model.addAttribute("token", token);

            // Tìm user theo username và password
            User user1 = userService1.findByUsername(username);
            if (user1 != null) {
                // Lưu thông tin user vào session
                session.setAttribute("user", user1);
                // Đặt thời gian hết hạn cho session (đơn vị: giây)
                session.setMaxInactiveInterval(30 * 60); // 30 phút
            }

            // Điều hướng dựa trên vai trò người dùng
            if (userDetails.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
                return "redirect:/admin/home";  // Điều hướng đến trang admin
            } else if (userDetails.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_USER"))) {
                return "redirect:/user/home";   // Điều hướng đến trang user
            } else {
                return "redirect:/vendor/home"; // Điều hướng đến trang vendor
            }
        } catch (AuthenticationException e) {
            System.out.println(username);
            System.out.println(password);
            System.out.println(e.getMessage());
            model.addAttribute("error", "Invalid username or password");
            return "redirect:/login";
        }
    }
    
    // login không dùng PostMapping, Bắt buộc dùng (username, pasword) ở view 
    // để Spring Security tự động lưu vào userInfo  
    
    @PostMapping("/register/register-verify-otp")
    public String verifyOtp(@RequestParam("otp") Integer otp, @RequestParam("email") String email, Model model) {
    	UserInfo user = userInfoRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Please provide a valid email!"));

        if (user != null && user.getOtp().equals(otp)) {
            user.setEnabled(true);
            user.setOtp(null); // Clear OTP after successful verification
            userInfoRepository.save(user);
            model.addAttribute("message", "Account activated successfully!");
            return "redirect:/login";
        } else {
        	model.addAttribute("message", "Invalid OTP!");
            return "auth/register-verify-otp";
        }
    }

    @GetMapping("/error-403")
    public String accessDenied() {
        return "auth/error-403";
    }

//    @PostMapping("/login")
//    public String handleLogin(@RequestParam String username,
//                              @RequestParam String password,
//                              HttpSession session,
//                              Model model) {
//        // Tìm user theo username và password
//        User user = userService1.findByUsername(username);
//
//        if (user != null) {
//            // Lưu thông tin user vào session
//            session.setAttribute("user", user);
//
//            // Chuyển hướng đến trang cần thiết sau khi login
//            return "redirect:/user/home";
//        }
//
//        // Nếu đăng nhập thất bại, trả về trang login với thông báo lỗi
//        model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
//        return "login";
//    }
}
