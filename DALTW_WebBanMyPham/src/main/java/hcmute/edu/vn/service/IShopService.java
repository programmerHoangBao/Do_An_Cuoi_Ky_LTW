package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;

import java.util.List;
import java.util.Map;

public interface IShopService {
    <S extends Shop> S save(S entity);
    Shop createShop(Shop shop, User salesman);

    List<Map<String, Object>> getTopShops(Integer month, Integer year);

    //List<Map<String, Object>> getTopShopsByRevenue(String timePeriod);

}
