package BonFire.components;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import BonFire.entities.Categories;
import BonFire.entities.Contact;
import BonFire.entities.Product;
import BonFire.service.CategoriesService;
import BonFire.service.ContactService;
import BonFire.service.ProductService;
import com.github.slugify.Slugify;

@Component
public class ApplicationStratup implements ApplicationListener<ApplicationEvent>{
	
	@Autowired
	private CategoriesService categoriesService;
	private ContactService contactService;
	private ProductService productService;
	
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		System.out.print("===Begin applicationReadyEvent--------");
		this.seedPythonCategory();
		this.seedJavaCategory();
		System.out.print("===End applicationReadyEvent--------");
		
	}
	private void seedPythonCategory() {
		Categories pythonCate= categoriesService.getOneByNativeSQL("SELECT * FROM tbl_category WHERE name='python'");
		
		if(pythonCate==null) {
			pythonCate= new Categories();
			pythonCate.setName("python");
			pythonCate.setDescription("python");
			
			for(int i= 0; i<20; i++) {
				Product p= new Product();
				p.setName("python Title"+ i);
				p.setShort_description("python Shortdes"+i);
				p.setDetail_description("python DetailDEs"+ i);
				p.setPrice(new BigDecimal("1000"));
				p.setCreatedDate(new Date());
				
				pythonCate.addProduct(p);
			}
		}else {
			pythonCate.setUpdatedDate(new Date());
			pythonCate.setSeo(new Slugify().slugify("ngon ngu lap trinh pythoon"+ System.currentTimeMillis()));
		}
		categoriesService.saveOrUpdate(pythonCate);
	}
	private void seedJavaCategory() {
		Categories javaCate= categoriesService.getOneByNativeSQL("SELECT * FROM tbl_category WHERE name='java'");
		
		if(javaCate==null) {
			javaCate= new Categories();
			javaCate.setName("java");
			javaCate.setDescription("java");
			
			for(int i= 0; i<20; i++) {
				Product p= new Product();
				p.setName("java Title"+ i);
				p.setShort_description("java Shortdes"+i);
				p.setDetail_description("java DetailDEs"+ i);
				p.setPrice(new BigDecimal("1000"));
				p.setCreatedDate(new Date());
				
				javaCate.addProduct(p);
			}
		}else {
			javaCate.setUpdatedDate(new Date());
			javaCate.setSeo(new Slugify().slugify("ngon ngu lap trinh pythoon"+ System.currentTimeMillis()));
		}
		categoriesService.saveOrUpdate(javaCate);
	}
	private void seedContact() {
		Contact contact= new Contact();
		contact.getEmail();
		contact.setFirst_name("dung");
		contact.setLast_name("Vu");
		contact.setMessage("love");
		contactService.saveOrUpdate(contact);
	}
	private void seedaddproduct() {
		Product product= new Product();
		product.getName();
		product.getPrice();
		product.getShort_description();
		product.getDetail_description();
		productService.saveOrUpdate(product);
	}
}
