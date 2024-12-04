package hcmute.edu.vn.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        // Lấy sessionId từ HttpSession
        HttpSession session = request.getSession();
        String sessionId = session.getId();

        // Ghi log sessionId và tên người dùng (Có thể thay đổi theo nhu cầu)
        System.out.println("User " + authentication.getName() + " logged in with session ID: " + sessionId);

        // Lưu thông tin session vào cơ sở dữ liệu nếu cần
        // Bạn có thể gọi một service để lưu sessionId vào cơ sở dữ liệu tại đây

        // Chuyển hướng người dùng dựa trên vai trò
        String role = authentication.getAuthorities().toString();
        if (role.contains("ADMIN")) {
            response.sendRedirect("/admin/home");
        } else if (role.contains("USER")) {
            response.sendRedirect("/user/home");
        } else if (role.contains("VENDOR")) {
            response.sendRedirect("/vendor/home");
        } else {
            response.sendRedirect("/");  // Nếu không phải admin/user/vendor thì chuyển hướng đến trang chủ
        }
    }
}
