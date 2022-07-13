package BonFire.controller.khachhang;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import BonFire.components.Utilities;
import BonFire.dto.Contact;
import BonFire.service.ContactService;

@Controller
public  class ContactController implements HandlerExceptionResolver {
	@Autowired
	private ContactService contactService;
	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	
	@RequestMapping(value= {"/contact"}, method = RequestMethod.GET)
				public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException{
		
		//khởi tạo 1 đối tượng
		BonFire.entities.Contact contact = new BonFire.entities.Contact();
			
		// đấy contact xuống hàm view từ Controler
			
		model.addAttribute("contact", contact);
		return "khachhang/contact";
	}
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	
	/*
	 * @RequestMapping(value= {"/contact"}, method = RequestMethod.POST) public
	 * String post_simple(final Model model, final HttpServletRequest request, final
	 * HttpServletResponse response) throws IOException{ String email=
	 * request.getParameter("email"); String password=
	 * request.getParameter("password"); model.addAttribute("TB","Cảm ơn "+
	 * email+" chúng tôi sẽ liên hệ với bạn sớm nhất"); return "khachhang/contact";
	 * }
	 */
	
	@RequestMapping(value= {"/contact"}, method = RequestMethod.POST)
	public String post_SpringFom(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("contact") BonFire.entities.Contact contact)
			throws IOException{
		
		/*
		 * if (Utilities.getKilobytes(attachment.getSize()) > 100) {
		 * model.addAttribute("ERROR", "File attachment quá lớn");
		 * 
		 * // trả về đường dẫn tới view return "khachhang/contact"; }
		 * 
		 * // lưu ảnh lên server attachment.transferTo(new File("C:/upload/" +
		 * attachment.getOriginalFilename()));
		 */

		// lưu contact vào trong database
		contactService.saveOrUpdate(contact);
		
		model.addAttribute("TB",
				"Cảm ơn " + ", chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất!");

		// sau khi xử lí xong thì đưa contact về trạng thái mới
		model.addAttribute("contact", new BonFire.entities.Contact());

		// trả về đường dẫn tới view
		return "khachhang/contact";
	}
	
	/**
	 * Sử dụng ajax
	 * @param model
	 * @param request
	 * @param response
	 * @param contactModel
	 * @return
	 */
	@RequestMapping(value = { "/ajax/contact" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody Contact contact) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Cảm ơn bạn " + contact.getEmail() + ", Chúng tôi sẽ liên hệ sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		// TODO Auto-generated method stub
		return null;
	}
}
