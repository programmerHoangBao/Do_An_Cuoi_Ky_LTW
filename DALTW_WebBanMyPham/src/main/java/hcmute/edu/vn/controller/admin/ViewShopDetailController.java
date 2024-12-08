package hcmute.edu.vn.controller.admin;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.implement.ShopService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
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

    @GetMapping("/revenue/{id}")
    public String revenueShop(
            @PathVariable("id") String id,
            @RequestParam(required = false) Integer day,
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer year,
            Model model
    ) {
        try {
            Integer id_shop = Integer.parseInt(id);
            System.out.println("ID Shop received: " + id_shop);
            System.out.println("Day received: " + day);
            System.out.println("Month received: " + month);
            System.out.println("Year received: " + year);


            // Lấy shop từ truy vấn
            Object result = shopRepository.revenueByDayOrMonthOrYear(id_shop, day, month, year);

            if (result == null) {
                model.addAttribute("errorMessage", "No revenue data available for the selected filters.");
                return "admin/Manage/page-admin";
            }

            Object[] shop = (Object[]) result; // Cast về Object[] để truy xuất các cột
            String shopName = (String) shop[0];
            Double shopRevenue = shop[1] != null ? ((Number) shop[1]).doubleValue() : 0.0;

            System.out.println("Shop name: " + shopName);
            System.out.println("Shop revenue: " + shopRevenue);

            model.addAttribute("shopName", shopName);
            model.addAttribute("shopRevenue", shopRevenue);
            model.addAttribute("id", id_shop);
            model.addAttribute("selectedDay", day);
            model.addAttribute("selectedMonth", month);
            model.addAttribute("selectedYear", year);

            return "admin/Manage/revenue-shop";
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid shop ID: " + id);
        }
    }

}


