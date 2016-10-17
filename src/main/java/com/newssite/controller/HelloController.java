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
		return "index";
		
	}	
	

	
	@RequestMapping(value = "/news-short2", method = RequestMethod.GET)
	public String viewNewsShort(Model model) 
	{       
		
	    return "news-short2";
	}
	
	@RequestMapping(value = "/sport", method = RequestMethod.GET)
	public String viewNewsByCategory(Model model) 
	{       
		
	    return "sport";
	}
	
	@RequestMapping(value = "/ecological", method = RequestMethod.GET)
	public String viewNewsByCategoryEcological(Model model) 
	{       
	    return "ecological";
	}
	
	@RequestMapping(value = "/technical", method = RequestMethod.GET)
	public String viewNewsByCategoryTechnology(Model model) 
	{       
	    return "technical";
	}
	
	@RequestMapping(value = "/medicine", method = RequestMethod.GET)
	public String viewNewsByCategoryMedicine(Model model) 
	{       
	    return "medicine";
	}
	
	@RequestMapping(value = "/cultural", method = RequestMethod.GET)
	public String viewNewsByCategoryCultural(Model model) 
	{       
	    return "cultural";
	}
	
	@RequestMapping(value = "/scientific", method = RequestMethod.GET)
	public String viewNewsByCategoryScientific(Model model) 
	{       
	    return "scientific";
	}
	
	@RequestMapping(value = "/political", method = RequestMethod.GET)
	public String viewNewsByCategoryPolitical(Model model) 
	{       
	    return "political";
	}
	
	


}
