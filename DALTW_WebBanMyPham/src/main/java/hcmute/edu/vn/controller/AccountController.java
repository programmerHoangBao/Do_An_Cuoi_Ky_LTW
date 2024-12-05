package hcmute.edu.vn.controller;

import hcmute.edu.vn.entity.UserInfo;
import hcmute.edu.vn.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class AccountController {
	
	private final UserService userService;

	@PostMapping("/new")
	public String addUser(@RequestBody UserInfo userInfo) {
		return userService.registerUser(userInfo);
	}
}
