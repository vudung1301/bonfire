package BonFire.controller.khachhang;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import BonFire.controller.BaseController;
import BonFire.dto.Contact;
import BonFire.dto.ProductSearchModel;
import BonFire.dto.Subscribe;
import BonFire.entities.Product;
import BonFire.service.PagerData;
import BonFire.service.ProductService;

@Controller
public class HomeController extends BaseController{
	
	@Autowired
	private ProductService productService; 
	
	@RequestMapping(value= {"/home"},method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException{
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");

		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);

		return "khachhang/index";
	}
	
	@RequestMapping(value = {"/ajax/subscribe"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_subcsribe(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody Subscribe subscribe) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("message", "Cảm ơn bạn " + subscribe.getSubscribe() + ", Chúng tôi sẽ liên hệ sớm nhất!");
		System.out.print(subscribe.getSubscribe());
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value= {"/product/details/{productSeo}"},method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("productSeo") String productSeo)
			throws IOException{
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.seo= productSeo;
		
		PagerData<Product> products= productService.search(searchModel);
		Product product= products.getData().get(0);
		
		model.addAttribute("product",product);

		return "khachhang/productDetail";
	}
}
