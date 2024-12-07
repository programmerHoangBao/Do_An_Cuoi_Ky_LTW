package hcmute.edu.vn.controller.admin;

import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.implement.UserService;
import hcmute.edu.vn.service.implement.UserService1;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/view-detail-user")
public class ViewUserDetailController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/edit")
    @ResponseBody
    public ResponseEntity<User> showEditUserForm(@RequestParam String email) {
        Optional<User> user = userRepository.findByEmail(email);
        if (user.isPresent()) {
            return ResponseEntity.ok(user.get()); // Trả về dữ liệu người dùng dưới dạng JSON
        }
        return ResponseEntity.notFound().build(); // Nếu không tìm thấy người dùng, trả về mã lỗi 404
    }

    // Xử lý cập nhật thông tin người dùng
    @PostMapping("/update")
    public String updateUser(@Valid @ModelAttribute User user, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "redirect:/admin/page-admin";
        } else {
            userRepository.updateUserByEmail(user.getEmail(), user.getFullName(), user.getPhone(),
                    user.getRole(), user.getAddress(), user.getStatus());
            return "redirect:/admin/page-admin";
        }
    }

    @RequestMapping(value = "/{email}", method = RequestMethod.GET)
    public String viewUserDetail(@PathVariable("email") String email, Model model) {
        Optional<User> userOpt = userRepository.findByEmail(email); // Lấy thông tin người dùng từ service
        if (userOpt.isPresent()) {
            model.addAttribute("user", userOpt.get()); // Truyền đối tượng User vào model
        } else {
            System.out.println("User not found");
        }
        return "admin/Manage/view-detail-user";
    }

}

