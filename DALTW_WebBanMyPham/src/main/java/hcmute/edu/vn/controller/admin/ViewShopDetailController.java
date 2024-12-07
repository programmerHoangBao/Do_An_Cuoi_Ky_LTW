package hcmute.edu.vn.controller.admin;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.repository.UserRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/admin/view-detail-shop")
public class ViewShopDetailController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ShopRepository shopRepository;

    @GetMapping("/edit")
    @ResponseBody
    public ResponseEntity<Shop> showEditShopForm(@RequestParam Integer id) {
        Optional<Shop> shop = shopRepository.findById(id);
        return shop.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Xử lý cập nhật thông tin người dùng
    @PostMapping("/update")
    public String updateShop(@Valid @ModelAttribute Shop shop, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "redirect:/admin/page-admin";
        } else {
            System.out.println("Shop received from form: " + shop);
            shopRepository.updateShopById(shop.getId_shop(), shop.getName(), shop.getAddress(), shop.getIntroduce());
            return "redirect:/admin/page-admin";
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String viewShopDetail(@PathVariable("id") Integer id, Model model) {
        Optional<Shop> shopOpt = shopRepository.findById(id); // Lấy thông tin Shop từ db
        System.out.println("Shop taken from database: " + shopOpt);
        if (shopOpt.isPresent()) {
            model.addAttribute("shop", shopOpt.get()); // Truyền đối tượng Shop vào model
        } else {
            System.out.println("Shop not found");
        }
        return "admin/Manage/view-detail-shop";
    }

}


