package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ShopService implements IShopService {
    @Autowired
    private ShopRepository shopRepository;

    public ShopService(ShopRepository shopRepository) {
        this.shopRepository = shopRepository;
    }

    @Override
    public <S extends Shop> S save(S entity) {
        return shopRepository.save(entity);
    }

    @Override
    public Shop createShop(Shop shop, User salesman) {
        shop.setVendor(salesman); // Liên kết người bán với shop
        shop.setSignUpDate(new Date()); // Ngày tạo shop
        return shopRepository.save(shop); // Lưu vào DB
    }

	public Shop findById(Integer id) {
        return shopRepository.findById(id)
                .orElse(null); // Trả về null nếu không tìm thấy
    }
}
