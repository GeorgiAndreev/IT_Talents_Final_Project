<%@page import="com.newssite.controller.ChangeThemes"%>

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
<title>Ежедневик.бг</title>


<% String id = "gold";
String headerImage = ChangeThemes.returnHeaderImage(id);
String backgroundImage = ChangeThemes.returnImage(id);
String backgroundColor = ChangeThemes.returnColor(id);
String borderColor = ChangeThemes.returnBorder(id);%>

<style type="text/css">
header, section, footer, aside, nav, article, figure, figcaption {
	display: block;
}

article.earth{
	/*height: 263px;
	width: 248px;*/
	height: 510px;
	width: 510px;
	padding: 0px 0px 0px 0px;
	margin: 30px 30px 30px 30px;
	background-color: black;
}

aside.right {
    border: solid;
	border-color: gray;
	width: 690px;
	height: 2000px;
	float: right;
	padding: 0px 0px 0px 0px;
	margin: 40px 30px 20px 30px;
	<%=backgroundColor%>
	border-radius: 25px;
}

aside.left {
	border: solid;
	border-color: gray;
    height: 2000px;
	width: 570px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 40px 30px 20px 30px;
	<%=backgroundColor%>
	border-radius: 25px;
}

aside.down {
	border: solid;
	border-color: gray;
    height: 400px;
	width: 2150px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px 20px 20px 20px;
	<%=backgroundColor%>
	border-radius: 25px;
}

aside.right-up {
border: solid;
	border-color: gray;
	width: 690px;
	height: 800px;
	float: right;
	padding: 0px 0px 0px 0px;
	margin: 60px 40px 0px 0px;
	<%=backgroundColor%>
	border-radius: 25px;
}


aside.menu-fixed {
    height: 240px;
	width: 2120px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px; 20px 50px 50px;
	<%=backgroundColor%>
	border-radius: 25px;
	top:0;
}

aside.menu {
    height: 240px;
	width: 100%;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px 20px 50px 0px;
	<%=backgroundColor%>
	border-radius: 25px;
}

aside.left-up {
border: solid;
	border-color: gray;
	width: 1400px;
	height: 2800px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 60px 0px 0px 40px;
	<%=backgroundColor%>
	border-radius: 25px;
	overflow: scroll;
}

h2.title {
	<%=borderColor%>
}

h2 {
			font-family: BuxtonSketch;
		}


article { 
	clear: both;
	overflow: auto;
	width: 100%;
	margin: 10px 10px 10px 10px;
	<%="background-color: white;"%>
}

body {
    zoom: 100%;
	color: #CDC673;
	background-color: #777733	;
	/*background-color:  #8B7500;*/
	/*background-color: #f9f8f6;*/
	background-image: url(/NewssiteProject/imgs/<%=backgroundImage%>);
	background-position: center;
	/*font-family: Georgia, Times, serif;*/
	font-family: Arial, Verdana, sans-serif;
	font-weight: bold;
	line-height: 1.4em;
	margin: 0px;
	z-index: 2;
	top:0;
	
}

</style>

	<link href="/NewssiteProject/css/styleOfPages.css" rel="stylesheet">




<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script type="text/javascript">
	$('login').bt();
</script>
<script type="text/javascript">
	$('reg').bt();
</script>
<script src="/NewssiteProject/js/snow.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	src="http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.js"
	type="text/javascript"></script>

<script type="text/javascript">
	//paste this code under the head tag or in a separate js file.
	// Wait for window load
	$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");
		;
	});
</script>


<script type="text/javascript">
	$('#home').bt({
		padding : 20,
		width : 100,
		spikeLength : 40,
		spikeGirth : 40,
		cornerRadius : 40,
		fill : 'rgba(0, 0, 0, .8)',
		strokeWidth : 3,
		strokeStyle : '#CC0',
		cssStyles : {
			color : '#FFF',
			fontWeight : 'bold'
		}
	});
</script>

<script type="text/javascript">
	function load() {
		var feed = "http://feeds.bbci.co.uk/news/world/rss.xml";
		new GFdynamicFeedControl(feed, "feedControl");

	}
	google.load("feeds", "1");
	google.setOnLoadCallback(load);
</script>



<style type="text/css">
@import url("http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.css");
</style>
</head>
<body>
	<div
		style="border: solid; border-color: gray; border-radius: 25px; height: 260px; width: 100%; background-color: #FFF68F; position: fixed; margin-top: -5em;">
		<aside class="menu">

			<section class="menu-inner-fixed">
				<form action="http://localhost:8080/ServiceDemo/news-short.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/en1.png"
						alt="Submit" width="400" height="150">
				</form>
				<form action="http://localhost:8080/ServiceDemo/news-short.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/pol1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="http://localhost:8080/ServiceDemo/news-short2.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/ball1.jpg"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/tror1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/tech1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/he1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input class="m" type="image"
						src="/NewssiteProject/imgs/culture1.png" alt="Submit" width="150"
						height="150">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input class="m" type="image"
						src="/NewssiteProject/imgs/smile0.jpg" alt="Submit" width="150"
						height="150">
				</form>
				<form action="/NewssiteProject/jsp2/news-space7.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/home0.jpg"
						alt="Submit" width="150" height="150">
				</form>
			</section>

		</aside>
	</div>
	<div class="se-pre-con"></div>
	<canvas id="canvas"></canvas>

	<div class="wrapper">

		<div class="upup">
		</div>
		<div class="up">
			<font size="70">&nbsp;&nbsp;&nbsp;&nbsp; ДОБРЕ ДОШЛИ, не сте
				влезли в профила си </font>


		</div>

		<header>
		
		
					<p style="font-family: BuxtonSketch; color: white; font-size:220px; margin:180px;10px;10px;0px; padding-left:100px;">EverydayNews.com</p>
		
	
		</header>
		
		
		<div class="down" style="border: solid; border-color: gray;">
			<font size="70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ЯКИЯТ
				САЙТ ЗА НОВИНИ </font>


		</div>


		<aside class="left-up">

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
			style="display: inline-block; border: solid;border-color: gray;background-color: #FFF68F; height: 400px; width: 1350px; margin: 10px; 10 px; 10 px; 10 px; float: center;">
			<h2 style="margin:10px;10px;10px;10px;">
				<%=allNews.get(index).getTitle()%>
			</h2>
			<%	String defImg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjGW1qX3FXUjoOwjYHIJNL67GsNHFilGjbHao_iA5LQDZqUbM";
				String image = allNews.get(index).getMainImage();
						//if (image.equals("") || image.equals("No image for this new.")) {
						//	image = "${pageContext.request.contextPath}/images/sport-news-default.jpg";
						//}
			%>
			<div class="test" style="display: inline-block; width: 300px; height: 200px; float: left; margin:10px;10px;10px;10px;" >
			
			<img style="width: 400px; height: 300px; float: left;"  src="<%=image%>">
			
			</div>
			

				<!--  <img style="width: 300px; height: 200px; float: left;"  src="<%=image%>">-->
			<%
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
			<button id="<%=allNews.get(index).getId()%>"  onclick="openModalFunction(this)" class="modalBtn">Open Modal</button>
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

		</aside>

		<aside class="right-up">
			<!--  <iframe width="400" height="400" style="border: none;"
		src="http://output96.rssinclude.com/output?type=iframe&amp;id=1099968&amp;hash=acfd107628e325462cd6bbe615df114a"></iframe>-->
			<iframe width="680" height="720" style="border: none;"
				src="http://output50.rssinclude.com/output?type=iframe&amp;id=1099973&amp;hash=8d1d46f8c7b113b14b9c118ca1b047d8"></iframe>
		</aside>

		<aside class="right">
			<section class="subscribe2">
				<form
					style="cursor: url('/NewssiteProject/imgs/up-arrow.png'), pointer, default"
					action="/NewssiteProject/jsp/login.jsp">
					<input title="ВЛЕЗ В ПРОФИЛА СИ" id="login" class="log"
						type="image" src="/NewssiteProject/imgs/login2.png" alt="Submit"
						width="160" height="160">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input title="РЕГИСТРИРАЙ СЕ" id="reg" class="reg" type="image"
						src="/NewssiteProject/imgs/reg1.png" alt="Submit" width="160"
						height="160">
				</form>
				<form>
					<input title="КЪМ ГЛАВНАТА СТРАНИЦА" id="home" class="home"
						type="image" src="/NewssiteProject/imgs/home1.gif" alt="Submit"
						width="160" height="160">
				</form>
				<form>
					<input title="РАЗГЛЕДАЙ И КОМЕНТИРАЙ ТЕМИТЕ" id="paleta"
						class="paleta" type="image"
						src="/NewssiteProject/imgs/paleta1.jpg" alt="Submit" width="260"
						height="160">
				</form>
				<input class="select-theme" type="submit" value="Изтегли новина!">
				<form action="/NewssiteProject/jsp/login.jsp">
					<input title="ЗАПИШИ СЕ ЗА БЮЛЕТИН" id="login" class="log"
						type="image" src="/NewssiteProject/imgs/mail1.png" alt="Submit"
						width="260" height="160">
				</form>
				<form action="/NewssiteProject/jsp/login.jsp">
					<input title="СВЪРЖИ СЕ С НАС" id="home" class="home" type="image"
						src="/NewssiteProject/imgs/contact1.jpg" alt="Submit" width="240"
						height="160">
				</form>
				<iframe
					src="http://free.timeanddate.com/clock/i5dxw7xh/n238/tlbg11/fn2/fs36/tcccc/ftb/bo2/tt1"
					width="695" height="55"></iframe>
				<iframe class="round-clock"
					src="http://free.timeanddate.com/clock/i5dxi3b7/n238/szw400/szh400/hoc09f/hbw0/hfc09f/cf100/hnce1ead6/fas30/fdi66/mqc000/mql15/mqw4/mqd98/mhc000/mhl15/mhw4/mhd98/mmc000/mml10/mmw1/mmd98/hhs2/hms2"
					width="400" height="400"></iframe>
				<!--  https://www.timeanddate.com/clocks/free.html-->
</section>
						

			<section class="draw-quotes">


				<h2>
					Случайна новина:<br> <br>
				</h2>


			</section>
			<section
				style="width: 650px; height: 730px; margin: 10px 10px 10px 10px; padding: 6px; 6 px; 6 px; 6 px; overflow: scroll;">
				<script language="JavaScript"
					src="http://www.feedbucket.com/js.php?src=http%3A%2F%2Ffeeds.labnol.org%2Flabnol&chan=y&desc=1&date=y"
					type="text/javascript"></script>
				<noscript>
					<a href="http://www.feedbucket.com/">Web RSS</a> by FeedBucket.
				</noscript>
			</section>


		</aside>
	


		<aside class="down">

			<section class="down1">

				<form action="https://plus.google.com/collections/featured">
					<input class="fb" type="image" src="/NewssiteProject/imgs/gp1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="https://www.facebook.com">
					<input class="fb" type="image" src="/NewssiteProject/imgs/fb1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="https://www.facebook.com">
					<input class="rss" type="image"
						src="/NewssiteProject/imgs/rss1.png" alt="Submit" width="150"
						height="150">
				</form>
				<form action="https://www.pinterest.com">
					<input class="rss" type="image"
						src="/NewssiteProject/imgs/pin1.png" alt="Submit" width="150"
						height="150">
				</form>
				<form action="https://twitter.com">
					<input class="rss" type="image" src="/NewssiteProject/imgs/tw1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="https://www.youtube.com">
					<input class="rss" type="image" src="/NewssiteProject/imgs/yt1.png"
						alt="Submit" width="150" height="150">
				</form>
			</section>

		</aside>



		<footer>
			<font size="70">&copy; 2016 Ежедневник.бг </font>
		</footer>
	</div>

	<audio autoplay>
		<!--   <source src="${pageContext.request.contextPath}/music/intro09.mp3" type="audio/mpeg">-->
	</audio>

	<script src="/NewssiteProject/js/back-to-top.js" type="text/javascript"></script>

	<script>
		var slideIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > x.length) {
				slideIndex = 1
			}
			x[slideIndex - 1].style.display = "block";
			setTimeout(carousel, 3000);
		}
	</script>
</body>
</html>