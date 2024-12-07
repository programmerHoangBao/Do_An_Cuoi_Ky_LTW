package hcmute.edu.vn.controller.vendor;

import hcmute.edu.vn.service.implement.RevenueService;
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
    public String revenue(Model model,@RequestParam(defaultValue = "day") String type) {
        // Chuẩn bị dữ liệu cho biểu đồ
        List<Object[]> data= revenueService.getTodayRevenue();
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
            Model model) {

        List<Object[]> data;
        if (type.equals("day")) {
            // Doanh thu theo ngày
            int currentYear = LocalDate.now().getYear();
            int currentMonth = LocalDate.now().getMonthValue();
            int selectedDay = day != null ? day : LocalDate.now().getDayOfMonth();
            data = revenueService.getDailyRevenue(currentMonth, currentYear, selectedDay);

        } else if (type.equals("month")) {
            // Doanh thu theo tháng
            int currentYear = LocalDate.now().getYear();
            int selectedMonth = month != null ? month : LocalDate.now().getMonthValue();
            data = revenueService.getMonthlyRevenue(currentYear, selectedMonth);

        } else {
            // Doanh thu theo năm
            data = revenueService.getYearlyRevenue();
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
