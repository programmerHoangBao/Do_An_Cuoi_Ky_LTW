package hcmute.edu.vn.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                                Authentication authentication) throws IOException {

        // Lấy sessionId từ HttpSession
        HttpSession session = request.getSession(false);  // false để không tạo session mới nếu không có
        if (session != null) {
            String sessionId = session.getId();

            // Ghi log hoặc xóa thông tin sessionId khỏi cơ sở dữ liệu
            System.out.println("User logged out with session ID: " + sessionId);

            // Xóa session
            session.invalidate();
        }

        // Sau khi logout, chuyển hướng về trang chủ hoặc trang login
        response.sendRedirect("/");
    }
}
