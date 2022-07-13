package BonFire.controller.quantrivien;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import BonFire.controller.BaseController;
import BonFire.dto.Contact;
import BonFire.dto.OrderSearchModel;
import BonFire.dto.ProductSearchModel;
import BonFire.entities.Product;
import BonFire.entities.SaleOrder;
import BonFire.entities.User;
import BonFire.service.ProductService;
import BonFire.service.SaleOrderService;
import BonFire.service.UserService;

@Controller

public class AdminProductController extends BaseController{
	
	@Autowired
	private ProductService productService; 
	@Autowired
	private SaleOrderService orderService;
	@Autowired
	private UserService userService;

	
	@RequestMapping(value = { "/admin/product_list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");

		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/product_list";
	}

	@RequestMapping(value= {"/admin/productManage"}, method = RequestMethod.GET)
		public String productManage(final Model model, final HttpServletRequest request, final HttpServletResponse response)
		throws IOException{
		
		return "quantrivien/productManage";
	}


	@RequestMapping(value= {"/admin/add_product"}, method = RequestMethod.GET)
		public String addProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response)
		throws IOException{
		
		// đấy contact xuống hàm view từ Controler
//		model.addAttribute("categories", categoriesService.findAll());
			
		model.addAttribute("product", new Product());
		return "quantrivien/add_product";
	}
	
	@RequestMapping(value = { "/ajax/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_deleteProduct(final Model model , 
	final HttpServletRequest request, final HttpServletResponse response, final @RequestBody Product product ) 
	throws IOException{
		Product productIndDb = productService.getById(product.getId());
		productService.remove(productIndDb);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		return ResponseEntity.ok(jsonResult);
	}
	
	
	
	@RequestMapping(value = { "/admin/add_product/{productId}", }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException, FileNotFoundException {
		// đẩy danh sách categories xuống
//		model.addAttribute("categories", categoriesService.findAll());

		// lấy sản phẩm trong db
		Product product = productService.getById(productId);

		// edit sản phẩm
		model.addAttribute("product", product);

		return "quantrivien/add_product";
	}
	
	@RequestMapping(value= {"/admin/add_product"}, method = RequestMethod.POST)
	public String post_SpringFom(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("product")Product product,
			final @RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures) 
			throws IOException, FileNotFoundException{
		
		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		} else { // chỉnh sửa
			productService.update(product, productAvatar, productPictures);
		}

		
		productAvatar.transferTo(new File("C:/upload/" +productAvatar.getOriginalFilename()));
		return "redirect:/admin/product_list";
	}
	@RequestMapping(value = { "/admin/order" }, method = RequestMethod.GET)
	public String adminOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));

		model.addAttribute("ordersWithPaging", orderService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		SaleOrder order= new SaleOrder();
		model.addAttribute("order", order);
		
		return "quantrivien/order";
	}
	@RequestMapping(value = { "/admin/account" }, method = RequestMethod.GET)
	public String adminaccount(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));

		model.addAttribute("accountWithPaging", userService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		User user= new User();
		model.addAttribute("user", user);
		
		return "quantrivien/account";
	}
}