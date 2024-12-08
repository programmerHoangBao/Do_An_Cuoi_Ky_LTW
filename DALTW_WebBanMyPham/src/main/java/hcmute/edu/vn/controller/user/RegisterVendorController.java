package hcmute.edu.vn.controller.user;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.entity.UserInfo;
import hcmute.edu.vn.service.implement.ShopService;
import hcmute.edu.vn.service.implement.UserService;
import hcmute.edu.vn.service.implement.UserService1;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

//@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@Controller
@RequestMapping("/user")
public class RegisterVendorController {
    @Autowired
    private UserService1 userService1;

    @Autowired
    private ShopService shopService;

    @Value("${app.upload.dir}")
    private String uploadDir; // Đường dẫn lưu logo cửa hàng
    @Autowired
    private UserService userService;

    // Hiển thị form đăng ký cửa hàng
    @GetMapping("/vendor-register")
    public String showRegisterPage(HttpSession session, Model model) {
        // Lấy thông tin người dùng đã đăng nhập từ session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";  // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
        }

        // Chuyển thông tin người dùng vào form đăng ký
        model.addAttribute("user", user);
        model.addAttribute("shop", new Shop());  // Thêm đối tượng shop để sử dụng trong form

        return "user/registerVendor";  // Trả về JSP hiển thị form đăng ký cửa hàng
    }

    // Xử lý đăng ký cửa hàng
    @PostMapping("/vendor-register")
    public String registerShop(@ModelAttribute("shop") Shop shop,
                               HttpSession session) throws IOException {

        // Lấy thông tin người dùng đã đăng nhập từ session
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";  // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
        }

        // Gán id của người dùng hiện tại làm người bán
        shop.setVendor(user);
        // Gán ngày đăng ký cửa hàng là ngày hiện tại
        shop.setSignUpDate(new Date());

        // Lưu thông tin cửa hàng vào cơ sở dữ liệu
        shopService.save(shop);
        session.setAttribute("shop", shop);

        // Cập nhật vai trò người dùng thành 'Vendor'
        user.setRole("Vendor");
        userService1.updateUser(user);

        //cập nhật lại thông tin trong bảng UserInfor
        UserInfo userInfo = (UserInfo) session.getAttribute("user1");
        userInfo.setRoles("ROLE_VENDOR");
        userService.updateUser(userInfo);

        //return "/Home/home/?id=" + shop.getId_shop();  // Sau khi đăng ký, chuyển hướng đến trang cửa hàng vừa tạo
//        return "redirect:/vendor/list-product?id=" +shop.getId_shop();  // Sau khi đăng ký, chuyển hướng đến trang cửa hàng vừa tạo
        return "redirect:/logout";
    }

}