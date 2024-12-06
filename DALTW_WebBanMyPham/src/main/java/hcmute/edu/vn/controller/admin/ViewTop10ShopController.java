package hcmute.edu.vn.controller.admin;

import hcmute.edu.vn.service.implement.RevenueService;
import hcmute.edu.vn.service.implement.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/")
public class ViewTop10ShopController {

    @Autowired
    private ShopService shopService;

    @GetMapping("/top-shops")
    public String getTopShops(
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer year,
            Model model) {

        List<Map<String, Object>> topShops = shopService.getTopShops(month, year);
        model.addAttribute("topShops", topShops);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedYear", year);
        return "admin/Shop/viewTop10Shop";
    }

//    @GetMapping("/shops-revenue")
//    public String getTopShopsByRevenue(@RequestParam(value = "timePeriod", defaultValue = "month") String timePeriod, Model model) {
//        // Lấy danh sách cửa hàng top theo doanh thu từ Service
//        var topShops = shopService.getTopShopsByRevenue(timePeriod);
//        model.addAttribute("topShops", topShops);
//        return "admin/Shop/viewTop10Shop"; // Trang JSP để hiển thị
//    }

}
