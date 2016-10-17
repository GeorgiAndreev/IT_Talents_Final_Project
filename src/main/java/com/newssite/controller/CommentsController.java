package com.newssite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newssite.model.Comment;
import com.newssite.model.CommentDAO;

@Controller
public class CommentsController {

	@RequestMapping(value="/Comment", method = RequestMethod.GET)
	//@ResponseBody
	public String addComment(HttpServletRequest request,@RequestParam(value = "commentText") String commentText, @RequestParam(value = "whichNew") String whichNew) {
		//String commentText = request.getParameter("commentText");
		//String test = request.getParameter("firstName");
		System.out.println();
		System.out.println(commentText);
		System.out.println();
		System.out.println(whichNew);
		//System.out.println("fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
		Comment comment = new Comment(commentText, 1L, 1L);
		//System.out.println(request.getAttribute("newToShowAfterComment"));

		//String newIdToShow = request.getAttribute("newToShowAfterComment").toString();
		request.setAttribute("newIdToShow", whichNew);
		return "single-new2";
	}	
	
}
