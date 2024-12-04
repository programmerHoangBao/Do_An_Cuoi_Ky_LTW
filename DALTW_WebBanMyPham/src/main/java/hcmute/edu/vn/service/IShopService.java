package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;

public interface IShopService {
    Shop createShop(Shop shop, User salesman);
    void saveShop(Shop shop);
}
