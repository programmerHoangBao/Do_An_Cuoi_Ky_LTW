package hcmute.edu.vn.controller.admin;

import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.service.implement.UserService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class ManageController {

    @Autowired
    private UserService1 userService1;

    @GetMapping("admin/page-admin")
    public String admin(Model model) {

        List<User> userList = userService1.findAllByRole("ROLE_USER");
        List<User> vendorList = userService1.findAllByRole("ROLE_VENDOR");

        System.out.println(userList);
        System.out.println(vendorList);

        model.addAttribute("userList", userList);
        model.addAttribute("vendorList", vendorList);
        return "admin/Manage/page-admin";
    }
}
