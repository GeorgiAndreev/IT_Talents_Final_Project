<%@page import= "org.springframework.context.annotation.AnnotationConfigApplicationContext"%>

<%@page import="com.newssite.model.NewArticleDAO"%>
<%@page import="com.newssite.model.NewDAO"%>
<%@page import="com.newssite.NewArticleConfiguration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.newssite.model.New"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>News App</title>
<style>
div.test{
background-image: url("https://s4.postimg.org/f4u1w2b7x/news.png");
}
</style>
</head>
<body style="background-color: #CDC673;">
	<div>

		<%
			//if (request.getAttribute("news") != null) {
				//Movie movie = (Movie)request.getAttribute("movie");
			//	ArrayList<New> allNews0 = (ArrayList<New>) request.getAttribute("news");
			//	ArrayList<New> allNews=NewDAO.getNewsFromFile();
				AnnotationConfigApplicationContext context = 
				new AnnotationConfigApplicationContext(NewArticleConfiguration.class);
				ArrayList<New> allNews=context.getBean(NewArticleDAO.class).getNewsFromFile();
				for (int index = 0; index < allNews.size(); index++) {
		%>
		<div
			style="display: inline-block; zoom: 220%;border: solid;border-color: gray;background-color: #FFF68F; width: 700px; margin: 10px; 10 px; 10 px; 500 px; float: center;">
			<h1 style="margin:10px;10px;10px;10px;">
				<%=allNews.get(index).getTitle()%>
			</h1>
			<%	String defImg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjGW1qX3FXUjoOwjYHIJNL67GsNHFilGjbHao_iA5LQDZqUbM";
				String image = allNews.get(index).getMainImage();
						//if (image.equals("") || image.equals("No image for this new.")) {
						//	image = "${pageContext.request.contextPath}/images/sport-news-default.jpg";
						//}
			%>
			<div class="test" style="display: inline-block; width: 300px; height: 200px; float: left; margin:10px;10px;10px;10px;" >
			
			<img style="width: 300px; height: 200px; float: left;"  src="<%=image%>">
			
			</div>
			

				<!--  <img style="width: 300px; height: 200px; float: left;"  src="<%=image%>">-->
			<%
				String shortText = allNews.get(index).getText();
						if (shortText.length() > 400) {
							shortText = shortText.substring(0, 400) + "..........";
						}
						//New new1 = allNews.get(index);
			%>
			<p style="margin:10px;10px;10px;10px;">
			<br>
				<%=shortText%>
			</p>
			<!--  <form action='./ShowNew2' method='post'>-->
			<form:form method="GET" action="/NewssiteProject/single-new2">
			<input type="hidden" name="whichNewToShow" value="<%=allNews.get(index).getId()%>" />
		<table>
						
		
			<tr>
				<td><input type="submit" value="Redirect Page" /></td>
			</tr>
		</table>
	</form:form>
			<form action='/NewssiteProject/single-new2' method='get'>
				<input type="hidden" name="whichNewToShow" value="<%=allNews.get(index).getId()%>" />
				<input style="border-radius: 25px; background-color: #FFF68F; float:right; margin:10px;20px;20px;10px; border-color: #8B8B00;"class="subscribe" type="submit" value="READ MORE >>>">
					<!--  <a href="./ShowNew?export=<%=allNews.get(index).getTitle()%>">Export</a>-->
			</form>
			
			<!-- <a href="single-new.jsp">READ MORE >>></a> -->
			<%
				String showId = "";
				session.setAttribute("whichToShow", showId);
			%>
		</div>
		<%
			}
				context.close();
			//}
		%>
	</div>
</body>
</html>