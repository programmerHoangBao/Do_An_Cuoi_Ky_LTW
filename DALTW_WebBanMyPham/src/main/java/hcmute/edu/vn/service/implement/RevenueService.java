package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.repository.OrderRepository;
import hcmute.edu.vn.service.IRevenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RevenueService implements IRevenueService {
    @Autowired
    private OrderRepository orderRepository;

    public RevenueService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Override
    public List<Object[]> getDailyRevenue(int month, int year, int day)  {
        return orderRepository.getDailyRevenue(month, year, day);
    }

    @Override
    public List<Object[]> getMonthlyRevenue(int year, int month) {
        return orderRepository.getMonthlyRevenue(year, month);
    }

    @Override
    public List<Object[]> getYearlyRevenue() {
        return orderRepository.getYearlyRevenue();
    }

}
