package com.newssite.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {

	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String sayHello(Model model) {
		model.addAttribute("text", "Hi !");
		model.addAttribute(new Product());
		return "index";
		
	}	
	
	@RequestMapping(value="/index", method = RequestMethod.POST)
	public String addNewProduct(@ModelAttribute Product product) {
		// call dao to add the object somewhere..
		
		// ProductsDAO.addNewProduct(product)
		System.out.println(product);
		return "test";
	}	
	
	
	@RequestMapping(value="/mindex", method = RequestMethod.GET)
	public String sayBye(Model model) {
		model.addAttribute("text", "Bye !");
		model.addAttribute("username", "Mravko");
		model.addAttribute(new Product("Kambi", 40));
		return "test";
	}	
	
	@RequestMapping(value="/zapalka", method = RequestMethod.GET)
	public String sayBye(HttpServletRequest request) {
		request.setAttribute("Name", "Bitche");
		return "redirect:/zapalki";
	}	
	
	@RequestMapping(value="/mroducts", method = RequestMethod.GET)
	public String printProducts(Model model) {
		List<Product> allProducts = Arrays.asList(new Product("Banan", 20),
				new Product("Krastavica", 10), new Product("Patladjan", 15));
		
		model.addAttribute("allProducts", allProducts);
		
		// forward to allProducts.jsp
		return "allProducts";
	}	
	
	@RequestMapping(value = "/news-short2", method = RequestMethod.GET)
	public String viewNewsShort(Model model) 
	{       
		
	    return "news-short2";
	}

}
