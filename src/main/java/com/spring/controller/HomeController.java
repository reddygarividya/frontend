package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.UserDAO;
import com.spring.daoImpl.CategoryDAOImpl;
import com.spring.daoImpl.ProductDAOImpl;
import com.spring.daoImpl.SupplierDAOImpl;
import com.spring.model.User;

@Controller
public class HomeController {
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	SupplierDAOImpl supplierDAOImpl;
	
	@Autowired
	CategoryDAOImpl categoryDAOImpl;
	
	@Autowired
	ProductDAOImpl productDAOImpl;
	@RequestMapping("/")
	public String index() 
	{
		return "index";

	}
@RequestMapping(value="/goToregister",method=RequestMethod.GET)
public ModelAndView goToregister()
{
	ModelAndView mv=new ModelAndView();
	mv.addObject("user",new User());
	
	mv.setViewName("register");
	return mv;
}
@RequestMapping(value="/saveUser",method=RequestMethod.POST)
public ModelAndView saveUserData(@ModelAttribute("user")User user,BindingResult result)
{
	ModelAndView mv=new ModelAndView();
	if(result.hasErrors())
	{
		mv.setViewName("register");
		return mv;
		
	}
	else
	{
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		userDAO.insertUser(user);
		mv.setViewName("index");
	}
	return mv;
}

@RequestMapping(value="/productCustList")
public ModelAndView getCustTable(@RequestParam("cid") int cid)
{
	ModelAndView mv=new ModelAndView();
	mv.addObject("prodList", productDAOImpl.getProdByCatId(cid));
	mv.setViewName("productCustList");
	return mv;
}
@ModelAttribute
public void getData(Model m)
{
	m.addAttribute("catList", categoryDAOImpl.retrieve());
}

}
