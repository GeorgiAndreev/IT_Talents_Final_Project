package com.newssite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {

	@RequestMapping(value="/SearchWeb", method = RequestMethod.GET)
	public String searchWeb(HttpServletRequest request,Model model,@RequestParam(value = "searchWeb") String searchWord) {
		
		System.out.println();
		System.out.println(searchWord);
		System.out.println();
	
		model.addAttribute("text", "Hi !");
		return "search-results";
	}	
	
}
