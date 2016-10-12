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

import com.newssite.model.UsersManager;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		Part profilePic = request.getPart("profilePic");//handles data from <input type=file name=profilePic>
		InputStream profilePicStream = profilePic.getInputStream();
		
		//TODO validate data and modify valid property accordingly
		boolean valid = true;
		if(valid){
			File dir = new File("userProfilePics");
			if(!dir.exists()){
				dir.mkdir();
			}
			File profilePicFile = new File(dir, username+"-profile-pic."+ profilePic.getContentType().split("/")[1]);
			System.out.println("Try to save file with name: " + profilePicFile.getName());
			System.out.println("abs. path = " + profilePicFile.getAbsolutePath());
			Files.copy(profilePicStream, profilePicFile.toPath());
			UsersManager.getInstance().regUser(username, name, password2, address, email, profilePicFile.getName());
			RequestDispatcher view = request.getRequestDispatcher("index.html");
			view.forward(request, response);
		}
	}

}
