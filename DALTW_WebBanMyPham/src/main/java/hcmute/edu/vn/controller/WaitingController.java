package hcmute.edu.vn.controller;

import hcmute.edu.vn.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = "/waiting")
public class WaitingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        if(session != null && session.getAttribute("account") != null) {
            User u = (User) session.getAttribute("account");
            System.out.println(u.getId_user());
            System.out.println(u.getEmail());
            if(u.getRole().equals("admin")) {
                resp.sendRedirect(req.getContextPath()+"/admin/home");
            }else if(u.getRole().equals("user")) {
                resp.sendRedirect(req.getContextPath()+"/admin/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/vendor/home");
            }
        } else {
            resp.sendRedirect(req.getContextPath()+"/login");
        }
    }

}
