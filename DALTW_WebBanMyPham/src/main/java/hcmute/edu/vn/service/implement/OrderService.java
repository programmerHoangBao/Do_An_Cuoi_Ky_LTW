package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.entity.*;
import hcmute.edu.vn.repository.OrderRepository;
import hcmute.edu.vn.repository.ProductColorRepository;
import hcmute.edu.vn.repository.ProductRepository;
import hcmute.edu.vn.repository.UserRepository;
import hcmute.edu.vn.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderService implements IOrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductColorRepository productColorRepository;

    // Phương thức thêm đơn hàng
    @Override
    public String addOrder(Integer userId, Integer productId, Integer productColorId, Integer quantity) {
        // Tìm người dùng, sản phẩm và màu sản phẩm từ cơ sở dữ liệu
        User user = userRepository.getReferenceById(userId);
        Product product = productRepository.getReferenceById(productId);
        ProductColor productColor = productColorRepository.getReferenceById(productColorId);

        // Tính tổng tiền cho đơn hàng
        Double total = product.getPrice() * quantity;  // Giả sử bạn muốn tính giá trị đơn hàng đơn giản là giá sản phẩm nhân với số lượng

        // Tạo đối tượng đơn hàng
        Order order = new Order();
        order.setUser(user);
        order.setProduct(product);
        order.setProductColor(productColor);
        order.setQuantity(quantity);
        order.setCreationTime(new Date());  // Thời gian tạo đơn hàng
        order.setStatusOrder("Chờ xác nhận");  // Trạng thái mặc định là "Chờ xác nhận"
        order.setTotal(total);  // Tính tổng giá trị của đơn hàng
        order.setShop(product.getShop());

        // Lưu đơn hàng vào cơ sở dữ liệu
        orderRepository.save(order);

        return "Đơn hàng đã được thêm thành công!";
    }

    @Override
    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

    @Override
    public List<Order> getOrdersByShop(Shop shop) {
        return orderRepository.findByShop(shop);
    }

    @Override
    public Order save(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public Order findById(Integer id) {
        return orderRepository.findById(id).orElse(null);
    }
}
