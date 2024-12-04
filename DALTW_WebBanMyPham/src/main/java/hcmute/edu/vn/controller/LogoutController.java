package hcmute.edu.vn.controller;

import hcmute.edu.vn.utils.Constant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(urlPatterns = "/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("account");
        // Xóa cookie "remember me" nếu có
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, null);
        cookie.setMaxAge(0); // Đặt thời gian sống của cookie về 0 để xóa nó
        resp.addCookie(cookie);
        //Redirect vể home
        resp.sendRedirect("/");
    }
}
