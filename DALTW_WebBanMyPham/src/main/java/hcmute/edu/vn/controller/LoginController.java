package hcmute.edu.vn.controller;

import hcmute.edu.vn.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LoginController {

    @Autowired
    private IUserService userService;

    @GetMapping(value = "/login")
    public String login(Model model) {return "auth/login";}
}

