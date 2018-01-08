package com.spring.controller;

import java.io.BufferedOutputStream;


import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.spring.daoImpl.CategoryDAOImpl;
import com.spring.daoImpl.ProductDAOImpl;
import com.spring.daoImpl.SupplierDAOImpl;
import com.spring.model.Category;
import com.spring.model.Product;
import com.spring.model.Supplier;


@Controller


public class AdminController 
{
	@Autowired
	SupplierDAOImpl supplierDAOImpl;
	@Autowired
	CategoryDAOImpl categoryDAOImpl;
	@Autowired
	ProductDAOImpl  productDAOImpl;

	
	@RequestMapping("/adding")
	public String adding()
	{
		return "adding";
	}
	@RequestMapping(value="/saveSupp",method=RequestMethod.POST)
	@Transactional
	public ModelAndView saveSuppData(@RequestParam("sid") int sid,@RequestParam("sname")String sname)
	{
		ModelAndView mv=new ModelAndView();
		Supplier ss= new Supplier();
		ss.setSid(sid);
		ss.setSname(sname);
		supplierDAOImpl.insertSupplier(ss);
		mv.setViewName("adding");
		return mv;
	}
	@RequestMapping(value="/saveCat",method=RequestMethod.POST)
	@Transactional
	public ModelAndView saveCatData(@RequestParam("cid") int cid,@RequestParam("cname") String cname)
	{
		ModelAndView mv=new ModelAndView();
		Category cc= new Category();
		cc.setCid(cid);cc.setCname(cname);
		categoryDAOImpl.insertCategory(cc);
		mv.setViewName("adding");
		return mv;
	}
	@RequestMapping(value="/saveProduct",method=RequestMethod.POST)
	@Transactional
	public String saveprod(HttpServletRequest request,@RequestParam("file")MultipartFile file)
	{
		Product prod= new Product();
	
		prod.setPname(request.getParameter("pname"));
		prod.setPrice(Double.parseDouble(request.getParameter("price")));
		prod.setPdescription(request.getParameter("pdescription"));
		prod.setPstock(Integer.parseInt(request.getParameter("pstock")));
		prod.setCategory(categoryDAOImpl.findByCatId(Integer.parseInt(request.getParameter("pCategory"))));
		prod.setSupplier(supplierDAOImpl.findBySuppId(Integer.parseInt(request.getParameter("pSupplier"))));
		
		String filepath =request.getSession().getServletContext().getRealPath("/");
		String filename= file.getOriginalFilename();
		//prod.setImagName(filename);
		productDAOImpl.insertProduct(prod);
		
		
		System.out.println("File path"+filepath);
		try
		{
			byte imagebyte[]=file.getBytes();
			BufferedOutputStream fos= new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
			fos.write(imagebyte);
			fos.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
		return "adding";

		
	}

	
	@ModelAttribute
	public void loadingDataInPage(Model m)
	{
		m.addAttribute("satList",supplierDAOImpl.retrieve());
		m.addAttribute("catList",categoryDAOImpl.retrieve());
		m.addAttribute("prodList",productDAOImpl.retrieve());

	}
	@RequestMapping("/productList")
	public ModelAndView prodlist()
	{
	ModelAndView mv= new ModelAndView();
	mv.addObject("prodList",productDAOImpl.retrieve());
	mv.setViewName("productAdminList");
	return mv;
	}
	
	@RequestMapping("/supplierList")
	public ModelAndView satlist()
	{
		ModelAndView mv= new ModelAndView();
		mv.addObject("satList",supplierDAOImpl.retrieve());
		mv.setViewName("supplierAdminList");
		return mv;
		
	}
	@RequestMapping("/categoryList")
	public ModelAndView catlist()
	{
		ModelAndView mv= new ModelAndView();
		mv.addObject("catList",categoryDAOImpl.retrieve());
		mv.setViewName("categoryAdminList");
		return mv;
		
	}

}