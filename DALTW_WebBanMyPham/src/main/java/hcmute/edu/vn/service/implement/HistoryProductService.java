package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.entity.HistoryProduct;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.HistoryProductRepository;
import hcmute.edu.vn.service.IHistoryProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HistoryProductService implements IHistoryProductService {

    @Autowired
    private HistoryProductRepository historyProductRepository;
    @Autowired
    private ProductService productService; // Để lấy thông tin sản phẩm nếu cần

    @Override
    public List<Product> getProductsViewedByUser(User user) {
        // Lấy danh sách HistoryProduct theo user
        List<HistoryProduct> historyProducts = historyProductRepository.findByUser(user);

        // Lấy danh sách sản phẩm tương ứng
        List<Product> products = new ArrayList<>();
        for (HistoryProduct historyProduct : historyProducts) {
            products.add(historyProduct.getProduct());
        }
        return products;
    }

    public void saveHistoryProduct(HistoryProduct historyProduct) {
        historyProductRepository.save(historyProduct);  // Lưu thông tin vào cơ sở dữ liệu
    }
}
