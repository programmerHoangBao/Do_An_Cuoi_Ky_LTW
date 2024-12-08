package hcmute.edu.vn.controller;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.entity.UserInfo;
import hcmute.edu.vn.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Enumeration;
import java.util.Optional;

@Controller
public class MyInfoController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/info")
    public String showInfoUserForm(Model model, HttpSession session) {
        Enumeration<String> attributeNames = session.getAttributeNames();
        StringBuilder attributes = new StringBuilder("Session Attributes:<br>");

        while (attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            Object attributeValue = session.getAttribute(attributeName);
            attributes.append(attributeName).append(": ").append(attributeValue).append("<br>");
        }

        System.out.println(attributes.toString());
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        model.addAttribute("user", user); // Truyền đối tượng User vào model
        return "Home/infoUser";
    }
}
