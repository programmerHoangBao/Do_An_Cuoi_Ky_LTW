package hcmute.edu.vn.service;

import java.time.LocalDate;
import java.util.List;

public interface IRevenueService {

    List<Object[]> getDailyRevenue(int month, int year, int day);

    List<Object[]> getMonthlyRevenue(int year, int month);

    List<Object[]> getYearlyRevenue();

    List<Object[]> getTodayRevenue();
}
