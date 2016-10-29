<%@page import= "org.springframework.context.annotation.AnnotationConfigApplicationContext"%>

<%@page import="com.newssite.model.NewArticleDAO"%>
<%@page import="com.newssite.model.NewDAO"%>
<%@page import="com.newssite.model.Article"%>
<%@page import="com.newssite.NewArticleConfiguration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
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


/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}




div.test{
background-image: url("https://s4.postimg.org/f4u1w2b7x/news.png");
}
</style>
</head>
<body style="background-color: #CDC673;">
<form action="/NewssiteProject/index" style="position:fixed;">
					<input class="m" type="image" src="/NewssiteProject/imgs/en1.png"
						alt="Submit" width="400" height="150">
				</form>
	<div style="margin-left:500px;">
<%!public String textZaModala="Teeeeeekst na novina."; %>
		<%
			//if (request.getAttribute("news") != null) {
				//Movie movie = (Movie)request.getAttribute("movie");
			//	ArrayList<New> allNews0 = (ArrayList<New>) request.getAttribute("news");
			//	ArrayList<New> allNews=NewDAO.getNewsFromFile();
				AnnotationConfigApplicationContext context = 
				new AnnotationConfigApplicationContext(NewArticleConfiguration.class);
				ArrayList<Article> allNews=context.getBean(NewArticleDAO.class).getAllArticlesByCategory("cultural");
				for (int index = 0; index < allNews.size(); index++) {
		%>
		<div
			style="display: inline-block; zoom: 220%;border: solid;border-color: gray;background-color: #FFF68F; width: 700px; margin: 10px; 10 px; 10 px; 500 px; float: center;">
			<h1 style="margin:10px;10px;10px;10px;">
				<%=allNews.get(index).getTitle()%>
			</h1>
			<%	String defImg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjGW1qX3FXUjoOwjYHIJNL67GsNHFilGjbHao_iA5LQDZqUbM";
				String image = "/NewssiteProject/article-imgs/"+ allNews.get(index).getArticlePic();
				//System.out.println(image);
						//if (image.equals("") || image.equals("No image for this new.")) {
						//	image = "${pageContext.request.contextPath}/images/sport-news-default.jpg";
						//}
			%>
			<div class="test" style="display: inline-block; width: 300px; height: 200px; float: left; margin:10px;10px;10px;10px;" >
			
			<img style="width: 300px; height: 200px; float: left;"  src="<%=image%>">
			
			</div>
			

				<!--  <img style="width: 300px; height: 200px; float: left;"  src="<%=image%>">-->
			<%textZaModala=allNews.get(index).getTitle();
				String shortText = allNews.get(index).getText();
						if (shortText.length() > 400) {
							shortText = shortText.substring(0, 400) + "..........";
						}
						//New new1 = allNews.get(index);
						//textZaModala=shortText;
			%>
			<p style="margin:10px;10px;10px;10px;">
			<br>
				<%=shortText%>
			</p>
			<!--  <form action='./ShowNew2' method='post'>-->
			<form:form method="GET" action="/NewssiteProject/single-new">
			<input type="hidden" name="whichNewToShow" value="<%=allNews.get(index).getId()%>" />
		
	        </form:form>
			<form action='/NewssiteProject/single-new' method='get'>
				<input type="hidden" name="whichNewToShow" value="<%=allNews.get(index).getId()%>" />
				<input style="border-radius: 25px; background-color: #FFF68F; float:right; margin:10px;20px;20px;10px; border-color: #8B8B00;"class="subscribe" type="submit" value="READ MORE >>>">
					<!--  <a href="./ShowNew?export=<%=allNews.get(index).getTitle()%>">Export</a>-->
					
			</form>
			
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
		
		
		
		
		<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">Ч</span>
    <p id="textInModal">Some text in the Modal..</p>
  </div>

</div>
			
		
	</div>
	
	
	<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

function openModalFunction(button) {
	modal.style.display = "block";
	//modal.innerHTML ="AaaaaaaaaaaaaaaaaaaaaaaaA";
	   var text = document.getElementById('textInModal');
	   text.innerHTML ="AaaaaaaaaaaaaaaaaaaaaaaaA";
	   text.innerHTML ="<%=textZaModala%>";
}
//try many 
//var x = document.getElementsByClassName("modalBtn");
//var i;
//for (i = 0; i < x.length; i++) {
   // x[i].style.backgroundColor = "red";
	//x[i].onclick = function() {
	//    modal.style.display = "block";
	//};
//}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
	
</body>
</html>