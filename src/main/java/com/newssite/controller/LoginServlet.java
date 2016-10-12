package com.newssite.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newssite.model.User;
import com.newssite.model.UsersManager;
import com.newssite.model.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String htmlFile;
		if(UsersManager.getInstance().validLogin(username, password)){
			request.setAttribute("loggedAs", username);
			User user= UserDAO.getUser(username, password);
			System.out.println(user);
			request.setAttribute("user", user);
			htmlFile = "Main.jsp";
		}else{
			htmlFile = "LoginFailed.html";
		}
		RequestDispatcher view = request.getRequestDispatcher(htmlFile);
		view.forward(request, response);
	}

}
