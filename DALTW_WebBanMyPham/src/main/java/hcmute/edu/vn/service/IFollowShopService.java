package hcmute.edu.vn.service;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;

public interface IFollowShopService {
    boolean isFollowed(Shop shop, User user);
}
