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

    @Override
    public Shop createShop(Shop shop, User salesman) {
        shop.setVendor(salesman); // Liên kết người bán với shop
        shop.setSignUpDate(new Date()); // Ngày tạo shop
        return shopRepository.save(shop); // Lưu vào DB
    }

    @Override
    public void saveShop(Shop shop) {
        shopRepository.save(shop);
    }
}
