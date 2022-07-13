package BonFire.controller.khachhang;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import BonFire.controller.BaseController;
import BonFire.dto.Cart;
import BonFire.dto.CartItem;
import BonFire.entities.Product;
import BonFire.entities.SaleOrder;
import BonFire.entities.SaleOrderProducts;
import BonFire.entities.User;
import BonFire.service.ProductService;
import BonFire.service.SaleOrderService;

@Controller
public class CartController extends BaseController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		

		// Thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");

		// tạo hóa đơn
		SaleOrder saleOrder = new SaleOrder();
		
	//	 kiểm tra xem khách hàng có phải đã login hay chưa?
		if(super.isLogined()) {
			User userLogined = super.getUserLogined();
//			saleOrder.setUser(userLogined); //khóa ngoại user_id
			saleOrder.setCustomer_name(userLogined.getUsername());
			saleOrder.setCustomer_email(userLogined.getEmail());
			saleOrder.setCustomer_address(userLogined.getAddress());
			saleOrder.setCustomer_phone(userLogined.getPhone_number());
			saleOrder.setTotal(cart.getTotalPrice());
		} else {
			saleOrder.setCustomer_name(customerFullName);
			saleOrder.setCustomer_email(customerEmail);
			saleOrder.setCustomer_address(customerAddress);
			saleOrder.setCustomer_phone(customerPhone);
			saleOrder.setTotal(cart.getTotalPrice());
		}		

		// mã hóa đơn
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));

//		if(getUserLogined() != null) {
//			
//		}

		// kết các sản phẩm trong giỏ hàng cho hóa đơn
		
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProductsale(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProduct(saleOrderProducts);
		}

		// lưu vào cơ sở dữ liệu
		saleOrderService.saveOrUpdate(saleOrder);
		
		// xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");

		return "redirect:/home";
	}
	
	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "khachhang/cart"; // -> đường dẫn tới View.
	}
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getName());
			cartItem.setPriceUnit(productInDb.getPrice());

			cart.getCartItems().add(cartItem);
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				currentProductQuality = item.getQuanlity() + 1;
				item.setQuanlity(currentProductQuality);				
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/DecreaseQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_DecreaseQuanlityCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				currentProductQuality = item.getQuanlity() - 1;
				item.setQuanlity(currentProductQuality);				
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	
	
	private void calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItem ci : cartItems) {
			if(ci.getQuanlity()<=0) {
				total = BigDecimal.ZERO ;
			}else {
				total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
			}
		}

		cart.setTotalPrice(total);
	}
}
