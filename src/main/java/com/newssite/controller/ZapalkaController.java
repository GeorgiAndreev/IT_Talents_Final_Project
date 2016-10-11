package com.newssite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ZapalkaController {
	
	@RequestMapping(value="/zapalki", method = RequestMethod.GET)
	public String say(Model model, HttpServletRequest request) {
		model.addAttribute("text", request.getAttribute("Name"));
		return "mest";
	}	
}
