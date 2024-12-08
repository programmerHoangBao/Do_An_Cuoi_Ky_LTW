package hcmute.edu.vn.controller.vendor;

import hcmute.edu.vn.entity.Order;
import hcmute.edu.vn.entity.Product;
import hcmute.edu.vn.entity.ProductColor;
import hcmute.edu.vn.entity.Shop;
import hcmute.edu.vn.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/vendor")
public class ShopProductController {
    @Autowired
    private IProductService productService;

    @Autowired
    private IProductColorService productColorService;

    @Autowired
    private IShopService shopService;

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IOrderService orderService;

    @GetMapping("/list-product")
    public String GetAllProduct(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "20") int size,
                                Model model, HttpSession session) {

        Pageable pageable = PageRequest.of(page, size);
        Shop shop = (Shop) session.getAttribute("shop");
        session.setMaxInactiveInterval(60 * 60);
        Page<Product> productPage = this.productService.findProductByShopId(shop.getId_shop(),pageable);
        //model.addAttribute("id_shop", idShop);
        //Page<Product> productPage = this.productService.findProductByShopId(idShop,pageable);


        List<ProductColor> productColors;
        int index = 0;
        for (Product product : productPage) {
            productColors = new ArrayList<>();
            productColors = productColorService.findProductColorByIdProduct(product.getId_product());
            product.setProductColors(productColors);
        }
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("index", index);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        return "vendor/Product/list-product";
        //return "redirect:vendor/list-product";
    }

    @GetMapping("/search-product")
    public String SearchProduct(
            @RequestParam(name="name", required=false, defaultValue = "") String name,
            @RequestParam(name="page", required = false, defaultValue = "0") int page,
            @RequestParam(name = "size", required=false, defaultValue="20") int size,
            Model model) {

        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage = this.productService.findProductByNameContaining(name, pageable);
        List<ProductColor> productColors;
        int index = 0;
        for (Product product : productPage) {
            productColors = new ArrayList<>();
            productColors = productColorService.findProductColorByIdProduct(product.getId_product());
            product.setProductColors(productColors);
        }
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("index", index);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        return "vendor/Product/list-product";
    }

    @GetMapping("/insert-product")
    public String showProductForm(Model model,HttpSession session) {
        Shop shop = (Shop) session.getAttribute("shop");
        session.setMaxInactiveInterval(30 * 60);
        model.addAttribute("shops", shopService.findShopById(shop.getId_shop()));
        model.addAttribute("categories", categoryService.findAllCategory());
        return "vendor/Product/insert-product";
    }

    @PostMapping("/insert-product")
    //@RequestMapping("/admin/insert-product")
    public ResponseEntity<String> insertProduct(
            @RequestParam("nameProduct") String name,
            @RequestParam("idShop") Integer id_shop,
            @RequestParam("idCategory") Integer id_category,
            @RequestParam("price") Double price,
            @RequestParam("quantity") Integer quantity,
            @RequestParam("statusProduct") Integer status,
            @RequestParam List<String> colors,
            @RequestParam List<MultipartFile> images
    )  throws IOException
    {
        try {
            // Lưu sản phẩm
            Product product = new Product();
            product.setName(name);
            product.setShop(this.shopService.findShopById(id_shop));
            product.setCategory(this.categoryService.findCategoryById(id_category));
            product.setPrice(price);
            product.setQuantity(quantity);
            if (status == 1) {
                product.setStatus_product(true);
            } else {
                product.setStatus_product(false);
            }
            product = productService.saveProduct(product);

            List<ProductColor> productColors = new ArrayList<>();

            String color;
            MultipartFile image;
            String uploadeDir;
            for (int i = 0; i < colors.size(); i++) {
                color = colors.get(i);
                image = images.get(i);

                uploadeDir = "D:/tmp/";

                File uploadFile = new File(uploadeDir + image.getOriginalFilename());
                image.transferTo(uploadFile);

                ProductColor productColor = new ProductColor();
                productColor.setColor(color);
                productColor.setImageProduct(uploadFile.getAbsolutePath());
                productColor.setProduct(product);

                productColors.add(productColor);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ResponseEntity.ok("Dữ liệu và tệp đã được nhận thành công!");
    }

    @GetMapping("/order")
    public String getOrders(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        // Lấy thông tin shop từ session
        Shop shop = (Shop) session.getAttribute("shop");

        if (shop == null) {
            // Nếu không tìm thấy shop trong session, có thể điều hướng đến trang login hoặc thông báo lỗi
            redirectAttributes.addFlashAttribute("message", "Bạn cần đăng nhập trước.");
            return "redirect:/login";
        }

        // Lấy tất cả hóa đơn của shop dựa trên id_shop
        List<Order> orders = orderService.getOrdersByShop(shop);

        // Truyền danh sách hóa đơn vào model để hiển thị
        model.addAttribute("orders", orders);

        // Trả về view chứa danh sách hóa đơn
        return "vendor/order";
    }

    @PostMapping("/update-order-status")
    public String updateOrderStatus(@RequestParam("orderId") Integer orderId,
                                    @RequestParam("action") String action,
                                    Model model) {
        Order order = orderService.findById(orderId);

        if (order != null) {
            // Lấy thông tin sản phẩm liên quan đến đơn hàng
            Product product = order.getProduct();

            // Kiểm tra xem số lượng đơn hàng có lớn hơn số lượng sản phẩm không
            if (order.getQuantity() > product.getQuantity()) {
                // Nếu số lượng đơn hàng lớn hơn số lượng sản phẩm, không cập nhật trạng thái
                model.addAttribute("message", "Không thể cập nhật trạng thái vì số lượng đơn hàng vượt quá số lượng sản phẩm.");
                return "redirect:/vendor/order"; // Quay lại trang danh sách đơn hàng
            }

            // Xử lý theo trạng thái đơn hàng
            if ("Đang giao hàng".equals(action)) {
                // Trừ số lượng sản phẩm khi trạng thái là "Đang giao hàng"
                product.setQuantity(product.getQuantity() - order.getQuantity());
            } else if ("Đã trả hàng".equals(action)) {
                // Cộng số lượng sản phẩm khi trạng thái là "Đã trả hàng"
                product.setQuantity(product.getQuantity() + order.getQuantity());
            }

            // Cập nhật sản phẩm mới với số lượng đã thay đổi
            productService.saveProduct(product);

            // Cập nhật trạng thái đơn hàng
            order.setStatusOrder(action);

            // Lưu lại đơn hàng với trạng thái mới
            orderService.save(order);

            model.addAttribute("message", "Trạng thái đơn hàng đã được cập nhật.");
        } else {
            model.addAttribute("message", "Không tìm thấy đơn hàng.");
        }

        return "redirect:/vendor/order";  // Điều hướng lại trang danh sách đơn hàng
    }
}
