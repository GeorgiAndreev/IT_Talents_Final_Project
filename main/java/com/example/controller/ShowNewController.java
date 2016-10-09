package com.example.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.New;

/**
 * Servlet implementation class MovieServlet
 */
@Controller
public class ShowNewController{

	@RequestMapping(value="/single-new2", method = RequestMethod.GET)
	public String sayBye(HttpServletRequest request) {
		//request.setAttribute("Name", "Bitche");
		String newIdToShow = request.getParameter("whichNewToShow");
		request.setAttribute("newIdToShow", newIdToShow);
		

		return "NewFile";
	}	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("single-new2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<New> allNews = (ArrayList<New>) request.getAttribute("allNews");
		String newIdToShow = request.getParameter("whichNewToShow");
		System.out.println(newIdToShow);
		
		//String email = request.getParameter("email"); 
		//System.out.println(show);
		//request.setAttribute("newToShow", newToShow);
		request.setAttribute("newIdToShow", newIdToShow);
		request.getRequestDispatcher("single-new2.jsp").forward(request, response);
		/*String title = request.getParameter("title");
		//Movie movie = null;
		New singleNew = null;
		List<New>allNews = null;
		try {
			allNews = new NewDAO().getNewsByTitle(title);
			singleNew = new NewDAO().getNewsByTitle(title).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("new", singleNew);
		request.setAttribute("news", allNews);
		doGet(request, response);*/
	}

}
