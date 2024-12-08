package hcmute.edu.vn.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.service.IShopService;

@Controller("adminShop")

public class ShopController {
	@Autowired
	private IShopService shopService;
	
	@GetMapping("/admin/list-shop")
	public String listShop(
			@RequestParam(defaultValue = "0") int page, 
			@RequestParam(defaultValue = "20") int size,
			Model model
			) 
	{
		Pageable pageable = PageRequest.of(page, size);
		Page<Shop> shops = this.shopService.findShopPageable(pageable);
		model.addAttribute("shops", shops.getContent());
		model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", shops.getTotalPages());
		return "admin/Shop/list-shop";
	}
	
	@GetMapping("/admin/search-shop")
	public String searchShop(
			@RequestParam(name = "name", required = false, defaultValue = "") String name,
			@RequestParam(name = "page", required = false, defaultValue = "0") int page,
			@RequestParam(name = "size", required = false, defaultValue = "20") int size, Model model
			)
	{
		Pageable pageable = PageRequest.of(page, size);
		Page<Shop> shops = this.shopService.findShopByNameContaining(name, pageable);
		model.addAttribute("shops", shops.getContent());
		model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", shops.getTotalPages());
		return "admin/Shop/list-shop";
	}
	
	@GetMapping("/admin/shop-details")
	public String shopDetail(
			Model model, 
			@RequestParam(name = "id", required = false, defaultValue = "") Integer id_shop
			)
	{
		Shop shop = this.shopService.findShopById(id_shop);
		model.addAttribute("shop", shop);
		return "admin/Shop/shop-details";
	}
}
