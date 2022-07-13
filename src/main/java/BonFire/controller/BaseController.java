package BonFire.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import BonFire.entities.Categories;
import BonFire.entities.Role;
import BonFire.entities.User;
import BonFire.service.CategoriesService;
import BonFire.service.RoleService;


public abstract class BaseController {
	
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private RoleService roleService;

	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return null;
	}
	
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();
	}
	
	@ModelAttribute("role")
	public List<Role> getRoles(){
		return roleService.findAll();
	}
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
}
