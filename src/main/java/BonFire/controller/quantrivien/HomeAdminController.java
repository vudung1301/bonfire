package BonFire.controller.quantrivien;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeAdminController {
	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	
	@RequestMapping(value= {"/admin","/admin/index"},
			method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException{
		/*
		 * String ho = request.getParameter("Ho"); String ten =
		 * request.getParameter("Ten"); response.getWriter().print("chao mung "+ho
		 * +" "+ten+" voi javaweb");
		 */
		//tra ve duong dan toi views
		return "quantrivien/admin";
	}
}
