package com.newssite.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.newssite.model.ArticleManager;
import com.newssite.model.User;
import com.newssite.model.UsersManager;

@Controller
public class ArticleController {
	
	@RequestMapping(value="/UploadArticle", method = RequestMethod.GET)
	public String sayHello(Model model) {
		model.addAttribute("text", "Hi !");
		return "article-upload";		
	}
	
	
	
	
	@RequestMapping(value="/article-upload", method = RequestMethod.POST)
	public String upload(Model model, @ModelAttribute("title") String title, @ModelAttribute("subtitle") String subtitle,
			@ModelAttribute("text") String text, @ModelAttribute("article_photo") Part article_photo ,
			@RequestParam(value = "user_id") String user_id, @RequestParam("category") String category,
			MultipartHttpServletRequest request) throws IOException {

		String sub=user_id.substring(0,user_id.length()-1);

		int userId=Integer.parseInt(sub);
		if (model!=null) {			
			InputStream articlePicStream = article_photo.getInputStream();
			boolean valid = true;
			if(valid){
				//File dir = new File("articlePics");
				File dir = new File("C:/Users/Maria/workspace/news/NewssiteProject/src/main/webapp/static/article-imgs");
				if(!dir.exists()){
					dir.mkdir();
				}
				File articlePicFile = new File(dir, category+text.length()+"-article-pic."+ article_photo.getContentType().split("/")[1]);
				System.out.println("Try to save file with name: " + articlePicFile.getName());
				System.out.println("abs. path = " + articlePicFile.getAbsolutePath());
				Files.copy(articlePicStream, articlePicFile.toPath());
				ArticleManager.getInstance().createArticle(title,subtitle, articlePicFile.getName(),text,userId,category);
			
			return "news-space8";
		
	}
		else{
		return "LoginFailed";
		}
	
}
		return "news-space8";
}}