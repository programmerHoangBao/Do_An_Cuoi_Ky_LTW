package hcmute.edu.vn.service.implement;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopService implements IShopService {
    @Autowired
    ShopRepository getRepo;

    public Shop findById(Integer id) {
        return getRepo.findById(id)
                .orElse(null); // Trả về null nếu không tìm thấy
    }
}
