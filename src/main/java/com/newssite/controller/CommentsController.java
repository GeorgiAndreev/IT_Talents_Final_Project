package com.newssite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentsController {

	@RequestMapping(value="/Comment", method = RequestMethod.GET)
	//@ResponseBody
	public String addComment(HttpServletRequest request,Model model,@RequestParam(value = "commentText") String commentText,@RequestParam(value = "firstName") StringBuffer test) {
		//String commentText = request.getParameter("commentText");
		//String test = request.getParameter("firstName");
		System.out.println();
		System.out.println(commentText);
		System.out.println();
		//System.out.println(test);
		//System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuu");
		model.addAttribute("text", "Hi !");
		return "test";
	}	
	
}
