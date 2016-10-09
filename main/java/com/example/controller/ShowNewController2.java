package com.example.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.New;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet("/ShowNew2")
public class ShowNewController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
