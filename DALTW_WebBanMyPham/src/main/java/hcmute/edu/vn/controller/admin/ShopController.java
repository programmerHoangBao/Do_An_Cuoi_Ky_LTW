package hcmute.edu.vn.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hcmute.edu.vn.controller.ImageController;
import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.entity.User;
import hcmute.edu.vn.service.IShopService;
import hcmute.edu.vn.service.IUserService;

@Controller("adminShop")

public class ShopController {
	@Autowired
	private IShopService shopService;
	
	@Autowired
	private IUserService userService;
	
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
	
	@GetMapping("/admin/update-shop")
	public String formUpdateShop(
			Model model, 
			@RequestParam(name = "id", required = false, defaultValue = "") Integer id_shop
			)
	{
		Shop shop = new Shop();
		shop = this.shopService.findShopById(id_shop);
		model.addAttribute("shop", shop);
		List<User> vendors = this.userService.findAll();
		model.addAttribute("vendors", vendors);
		return "admin/Shop/update-shop";
	}
	
	@PostMapping("/admin/update-shop")
	public String updateShop
	(
		Model model, 
		@RequestParam(name = "id", required = false, defaultValue = "") Integer id_shop,
		@RequestParam("nameShop") String name,
		@RequestParam("idVendor") Integer id_vendor,
		@RequestParam("address") String address,
		@RequestParam("introduce") String introduce,
		@RequestParam("uploadImage") MultipartFile file
	) 
	{
		try {
			Shop shop = new Shop();
			shop.setId_shop(id_shop);
			shop.setName(name);
			shop.setVendor(this.userService.findById(id_vendor));
			shop.setSignUpDate(this.shopService.findShopById(id_shop).getSignUpDate());
			shop.setAddress(address);
			shop.setIntroduce(introduce);
			String filePath;
			filePath = new ImageController().saveImage(file);
			shop.setImage(filePath);	
			this.shopService.save(shop);
			model.addAttribute("message", "Cửa hàng đã được cập nhật thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Cửa hàng đã không được cập nhật thành công!");
		}
		List<User> vendors = this.userService.findAll();
		model.addAttribute("vendors", vendors);
		return "admin/Shop/update-shop";
	}
}
