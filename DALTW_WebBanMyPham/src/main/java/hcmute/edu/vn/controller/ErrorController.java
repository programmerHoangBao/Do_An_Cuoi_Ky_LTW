package hcmute.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/error-403")
    public String accessDenied() {
        return "auth/error-403"; // Tên của file JSP hiển thị lỗi
    }
}

