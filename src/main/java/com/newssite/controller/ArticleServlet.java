package com.newssite.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.CopyOption;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.newssite.model.Article;
import com.newssite.model.User;
import com.newssite.model.UsersManager;
import com.newssite.model.ArticleDAO;
import com.newssite.model.ArticleManager;
import com.newssite.model.UserDAO;

/**
 * Servlet implementation class ArticleServlet
 */
@WebServlet("/ArticleServlet")
@MultipartConfig
public class ArticleServlet extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		String text= request.getParameter("text");
		Part article_photo = request.getPart("article_photo");//handles data from <input type=file name=profilePic>
		InputStream articlePicStream = article_photo.getInputStream();
		
		//TODO validate data and modify valid property accordingly
		boolean valid = true;
		if(valid){
			File dir = new File("articlePics");
			if(!dir.exists()){
				dir.mkdir();
			}
			File articlePicFile = new File(dir, title+"-article-pic."+ article_photo.getContentType().split("/")[1]);
			System.out.println("Try to save file with name: " + articlePicFile.getName());
			System.out.println("abs. path = " + articlePicFile.getAbsolutePath());
			Files.copy(articlePicStream, articlePicFile.toPath());
			ArticleManager.getInstance().createArticle(title,subtitle, articlePicFile.getName(),text);
			RequestDispatcher view = request.getRequestDispatcher("index.html");
			view.forward(request, response);
		}
	}

}
