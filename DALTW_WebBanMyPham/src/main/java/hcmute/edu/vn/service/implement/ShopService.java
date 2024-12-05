package hcmute.edu.vn.service.implement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.repository.ShopRepository;
import hcmute.edu.vn.service.IShopService;

@Service
public class ShopService implements IShopService{

	@Autowired
	private ShopRepository shopRepository;
	
	@Override
	public List<Shop> findAllShop() {
		// TODO Auto-generated method stub
		return this.shopRepository.findAll();
	}

}
