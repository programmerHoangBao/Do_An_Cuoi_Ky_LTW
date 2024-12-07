package hcmute.edu.vn.controller.vendor;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.service.implement.RevenueService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/vendor/revenue")
public class RevenueController {
    @Autowired
    private RevenueService revenueService;

    @GetMapping("/view")
    public String revenue(Model model,@RequestParam(defaultValue = "day") String type, HttpSession session) {
        // Chuẩn bị dữ liệu cho biểu đồ
        Shop shop = (Shop) session.getAttribute("shop");
        List<Object[]> data= revenueService.getTodayRevenue(shop.getId_shop());
        List<String> labels = new ArrayList<>();
        List<BigDecimal> totals = new ArrayList<>();
        for (Object[] row : data) {
            labels.add(row[0].toString()); // Ngày, tháng, hoặc năm
            totals.add(BigDecimal.valueOf(((Number) row[1]).doubleValue()));
        }

        model.addAttribute("labels", labels);
        model.addAttribute("totals", totals);
        model.addAttribute("type", type);
        return "vendor/revenue";
    }

    @GetMapping
    public String viewRevenuePage(
            @RequestParam(defaultValue = "day") String type,
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer year,
            @RequestParam(required = false) Integer day,
            Model model, HttpSession session) {

        Shop shop = (Shop) session.getAttribute("shop");
        session.setMaxInactiveInterval(3600);
        List<Object[]> data;
        if (type.equals("day")) {
            // Doanh thu theo ngày
            int currentYear = LocalDate.now().getYear();
            int currentMonth = LocalDate.now().getMonthValue();
            int selectedDay = day != null ? day : LocalDate.now().getDayOfMonth();
            data = revenueService.getDailyRevenue(currentMonth, currentYear, selectedDay, shop.getId_shop());

        } else if (type.equals("month")) {
            // Doanh thu theo tháng
            int currentYear = LocalDate.now().getYear();
            int selectedMonth = month != null ? month : LocalDate.now().getMonthValue();
            data = revenueService.getMonthlyRevenue(currentYear, selectedMonth, shop.getId_shop());

        } else {
            // Doanh thu theo năm
            data = revenueService.getYearlyRevenue(shop.getId_shop());
        }

        // Chuẩn bị dữ liệu cho biểu đồ
        List<String> labels = new ArrayList<>();
        List<BigDecimal> totals = new ArrayList<>();
        for (Object[] row : data) {
            labels.add(row[0].toString()); // Ngày, tháng, hoặc năm
            totals.add(BigDecimal.valueOf(((Number) row[1]).doubleValue()));
        }

        model.addAttribute("labels", labels);
        model.addAttribute("totals", totals);
        model.addAttribute("type", type);
        return "vendor/revenue";
    }
}
