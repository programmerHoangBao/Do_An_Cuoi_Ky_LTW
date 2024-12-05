package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;

public interface IShopService {
	List<Shop> findAllShop();
    <S extends Shop> S save(S entity);
    Shop createShop(Shop shop, User salesman);
}
