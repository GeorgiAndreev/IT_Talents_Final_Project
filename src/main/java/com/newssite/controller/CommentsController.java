package com.newssite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentsController {

	@RequestMapping(value="/comment", method = RequestMethod.GET)
	public void addComment(HttpServletRequest request) {
		String commentText = request.getParameter("commentText");
		
	}	
	
}
