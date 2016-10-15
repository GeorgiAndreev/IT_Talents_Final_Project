package com.newssite.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getWeather")
public class WeatherServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String city = req.getParameter("name");
		
		URL url = new URL("http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=f631fd357c75163a46154773a513dd64");
		HttpURLConnection con = (HttpURLConnection) url.openConnection();			
		con.setRequestMethod("GET");
		Scanner sc = new Scanner(con.getInputStream());
		StringBuilder sb = new StringBuilder();
		while(sc.hasNextLine()){
			sb.append(sc.nextLine());
		}
		
		System.out.println(con.getInputStream());
		String src="aaaaaaaaaaa";
		if(sb.toString().contains("cloud")){
			src="cloud";
		}
		if(sb.toString().contains("clear")){
			src="skyisclear";
		}
		if(sb.toString().contains("rain")){
			src="rain";
		}
		if(sb.toString().contains("sun")){
			src="sunny";
		}
		System.out.println(src);
		resp.getWriter().append(sb.toString());
	}
}

