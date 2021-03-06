package com.newssite.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.newssite.model.ArticleManager;
import com.newssite.model.User;
import com.newssite.model.UsersManager;

@Controller
public class RegisterController {

	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String sayHello(Model model) {
		model.addAttribute("text", "Hi !");
		return "Register";
	}
	

	

	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public String reg(Model model, @ModelAttribute("username") String username, 
			@ModelAttribute("first_name") String first_name,@ModelAttribute("last_name") String last_name,
			@ModelAttribute("password") String password,@ModelAttribute("password2") String password2,
			@ModelAttribute("email") String email,@ModelAttribute("address") String address, 
			@ModelAttribute("profilePic") Part profilePic,
			MultipartHttpServletRequest request) throws IOException {

		if (User.isValidUser(username, first_name,last_name,password2, email, address)) {
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
				UsersManager.getInstance().regUser(username, first_name,last_name, password2, address, email, profilePicFile.getName());

			}
				return "Login";

			} 
		else {
				return "RegisterFailed";
			}

	}
}
