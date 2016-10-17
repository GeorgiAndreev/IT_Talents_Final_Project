package com.newssite.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newssite.model.User;
import com.newssite.model.UserDAO;
import com.newssite.model.UsersManager;

@Controller
public class LoginController {
	
	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public String sayHello(Model model) {
		model.addAttribute("text", "Hi !");
		return "Login";		
	}
	
	
	@RequestMapping(value="/Login", method = RequestMethod.POST)
	public String log(Model model, @ModelAttribute("username") String username, @ModelAttribute("password") String password,HttpServletRequest request) {

		if (UsersManager.getInstance().hasUser(username,password)) {
			User user= UsersManager.getInstance().getUser(username);
			//request.getSession(false).invalidate();
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(60 * 60);
			session.setAttribute("username", user.getUsername());
			session.setAttribute("user_id", UserDAO.getId(username));
			model.addAttribute(user);
		    User userr= UserDAO.getUser(username, password);
			request.setAttribute("user", userr);
			request.setAttribute("username", username);
			return "loged";
	}
		return "LoginFailed";


}
}
