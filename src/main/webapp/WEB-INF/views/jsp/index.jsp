<%@page import="com.newssite.controller.ChangeThemes"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

article.earth {
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
	border-radius
	:
	25px;
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
	border-radius
	:
	25px;
}

aside.down {
	border: solid;
	border-color: gray;
	height: 400px;
	width: 2150px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px 20px 20px 20px;
	background-color:#777733;
	border-radius:25px;
}

aside.right-up {
	border: solid;
	border-color: gray;
	width: 690px;
	height: 800px;
	float: right;
	padding: 0px 0px 0px 0px;
	margin: 60px 40px 0px 0px;
	<%=
	backgroundColor
	%>
	border-radius
	:
	25px;
}

aside.menu-fixed {
	height: 240px;
	width: 2120px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px; 20 px 50px 50px; <%= backgroundColor %> border-radius :
	25px;
	top: 0;
}

aside.menu {
	height: 240px;
	width: 100%;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px 20px 50px 0px;
	<%=
	backgroundColor
	%>
	border-radius
	:
	25px;
}

aside.left-up {
	border: solid;
	border-color: gray;
	width: 1400px;
	height: 800px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 60px 0px 0px 40px;
	<%=
	backgroundColor
	%>
	border-radius
	:
	25px;
}

h2.title { <%=borderColor %>
	
}

h2 {
	font-family: BuxtonSketch;
}

article {
	clear: both;
	overflow: auto;
	width: 100%;
	margin: 10px 10px 10px 10px; <%="background-color: white;"%>
}

body {
	zoom: 100%;
	color: white;
	background-color: #777733;
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
	top: 0;
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

<script>
	function submitSearchWeb() {
		document.getElementById("searchWeb").submit();
	}
</script>



<style type="text/css">
@import
	url("http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.css")
	;
</style>
</head>
<body>
	<div
		style="border: solid; border-color: gray; border-radius: 25px; height: 260px; width: 100%; background-color: #FFF68F; position: fixed; margin-top: -7em;">
		<aside class="menu">

			<section class="menu-inner-fixed">
				<form action="http://localhost:8080/ServiceDemo/news-short.jsp">
					<input class="m" type="image" src="/NewssiteProject/imgs/en1.png"
						alt="Submit" width="400" height="150">
				</form>
				<form action="/NewssiteProject/political">
					<input class="m" type="image" src="/NewssiteProject/imgs/pol1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/sport">
					<input class="m" type="image" src="/NewssiteProject/imgs/ball1.jpg"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/ecological">
					<input class="m" type="image" src="/NewssiteProject/imgs/tror1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/technical">
					<input class="m" type="image" src="/NewssiteProject/imgs/tech1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/medicine">
					<input class="m" type="image" src="/NewssiteProject/imgs/he1.png"
						alt="Submit" width="150" height="150">
				</form>
				<form action="/NewssiteProject/cultural">
					<input class="m" type="image"
						src="/NewssiteProject/imgs/culture1.png" alt="Submit" width="150"
						height="150">
				</form>
				<form action="/NewssiteProject/scientific">
					<input class="m" type="image"
						src="/NewssiteProject/imgs/sci1.jpg" alt="Submit" width="150"
						height="150">
				</form>
				<form action="/NewssiteProject/index">
					<input class="m" type="image" src="/NewssiteProject/imgs/home0.jpg"
						alt="Submit" width="150" height="150">
				</form>
			</section>

		</aside>
	</div>
	<div class="se-pre-con"></div>
	<canvas id="canvas"></canvas>

	<div class="wrapper">

		<div class="upup"></div>
		<div class="up">
			<font size="70">&nbsp;&nbsp;&nbsp;&nbsp; ДОБРЕ ДОШЛИ, Гост/Гостенка</font>


		</div>

		<header>
			<div style="border: solid;border-color: gray;border-radius:100px;background-color: #CECC15; height: 362px; width: 2010px; padding-left:0px; margin-top: 50px; padding-top: 0px;margin-left:50px;">
				<p
					style=" font-family: BuxtonSketch; color: white; font-size: 220px; margin: 0px; 10 px; 10 px; 60 px; padding-left: 210px; padding-top: 190px;">EverydayNews.com</p>
			</div>

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

			<h2 class="w3-center">
				<font size="20">ИЗБРАНИ НОВИНИ</font>
			</h2>

			<div class="w3-content" style="width: 400px">

				<div class="mySlides" style="width: 1200px; height: 600px;">
					<img src="/NewssiteProject/imgs/red-stars1.jpg"
						style="width: 1200px; height: 480px;">
					<div>
						<a href="http://www.space.com"><font size="800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;КОСМОС</font></a>
					</div>
				</div>

				<div class="mySlides" style="width: 1200px; height: 600px;">
					<img src="/NewssiteProject/imgs/wheat1.jpg"
						style="width: 1200px; height: 480px;">
					<div>
						<a href="https://en.wikipedia.org/wiki/Wheat"><font size="800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ЖИТО</font></a>
					</div>
				</div>

				<div id="new1" class="mySlides"
					style="width: 1200px; height: 600px;">
					<img src="/NewssiteProject/imgs/forest1.jpg"
						style="width: 1200px; height: 480px;">
					<div>
						<a href="http://survivetheforest.com"><font size="800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ГОРА</font></a>
					</div>
				</div>


			</div>

		</aside>

		<aside class="right-up">
			<!--  <iframe width="400" height="400" style="border: none;"
		src="http://output96.rssinclude.com/output?type=iframe&amp;id=1099968&amp;hash=acfd107628e325462cd6bbe615df114a"></iframe>-->
			<iframe width="680" height="320" style="border: none;"
				src="http://output50.rssinclude.com/output?type=iframe&amp;id=1099973&amp;hash=8d1d46f8c7b113b14b9c118ca1b047d8"></iframe>
			<form
				style="margin: 10px; 0 px; 0 px; 0 px; height: 150px; border: solid; border-color: gray; border-radius: 25px;"
				action="/NewssiteProject/SearchWeb">
				<input id="searchWeb" type="text" name="searchWeb"
					style="margin: 40px; 20 px; 40 px; 40 px; font-size: 60px; float: left; width: 420px; height: 70px; border: solid; border-color: gray; border-radius: 25px;">
				<input onclick="submitSearchWeb()"
					style="margin: 25px;10px;10px;0px;" title="Search" id="reg"
					class="reg" type="image" src="/NewssiteProject/imgs/mag2.png"
					alt="Submit" width="100" height="100">
			</form>

		</aside>

		<aside class="left">
			<article class="earth">
				<figure class="earth">
					<img src="/NewssiteProject/imgs/e1.gif" alt="Earth" />
				</figure>
			</article>




			<div id="body">
				<div id="feedControl">Loading...</div>
			</div>
			<section class="search-for-events">
				<h2>
					<font size="20">АНКЕТА</font>
				</h2>

				<form class="inquiry">
					<font size="20">Какво мислите за програмистите?</font><br> <br>
					<input type="radio" name="gender" value="male" checked><font
						size="20">Готини са. </font><br> <br> <br> <input
						type="radio" name="gender" value="female"><font size="20">Много
						са готини.</font><br> <br> <br> <input type="radio"
						name="gender" value="other"><font size="20">Турбо
						мега готини са.</font> <input class="select-theme" type="submit"
						value="ГЛАСУВАЙ!">
				</form>
			</section>
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
		<section class="about-the-center">

			<h2>
				Абонирайте1 се за <br> нашият бюлетин:
			</h2>


			<article>
				<figure>
					<img src="/NewssiteProject/imgs/itt1.png" alt="Woman Tree" />
					<figcaption></figcaption>
				</figure>
				<p>
					<br>ИТ ТАЛАНТИ ОТКРИВАТ УЧЕБЕН ЦЕНТЪР И В ПЛОВДИВ<br> <br>Супер
					успешната фирма за подготовка на младши програмисти започва
					обучения и в провинцията

				</p>
			</article>
			<article>
				<figure>
					<img src="/NewssiteProject/imgs/vlak1.png" alt="Woman Tree" />
					<figcaption></figcaption>
				</figure>
				<p>
					<br>ПЪРВИЯТ ВЛАК СТРЕЛА В БЪЛГАРИЯ СВЪРЗВА ПЛЕВЕН И СОФИЯ<br>
					<br> Плевенските студенти ликуват: вече ще си пътуват до вкъщи
					за половин час
				</p>
			</article>
			<article>
				<figure>
					<img src="/NewssiteProject/imgs/bgnt1.png" alt="Woman Tree" />
					<figcaption></figcaption>
				</figure>
				<p>
					<br>НИКОЛАЙ ТОМИТОВ Е НОВИЯТ ПРЕЗИДЕНТ НА РЕПУБЛИКА БЪЛГАРИЯ<br>
					<br> Страната ни е вече в сигурни ръце, най-накрая човек,
					който не лъже и не отлага ще я оглави
				</p>
			</article>

		</section>

		<aside class="middle">

			<section class="subscribe">
				<h2>
					<font size="20">МОТИВИРАЩО ВИДЕО</font>
				</h2>

				<iframe width="800" height="550"
					src="https://www.youtube.com/embed/5-sfG8BV8wU"></iframe>
			</section>

		</aside>

		<aside class="middle">
			<form action="/NewssiteProject/Register"><input title="РЕГИСТРИРАЙ СЕ" id="reg" class="reg" type="image" src="/NewssiteProject/imgs/reg1.png" alt="Submit" width="160" height="160"></form>
<form action="/NewssiteProject/Login"><input title="ВЛЕЗ В ПРОФИЛА СИ" id="login" class="log" type="image" src="/NewssiteProject/imgs/login2.png" alt="Submit" width="160" height="160"></form>
<form action="/NewssiteProject/UploadArticle"><input title="UPLOAD ARTICLE" id="login" class="log" type="image" src="/NewssiteProject/imgs/up4.png" alt="Submit" width="160" height="160"></form>


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
			<font size="70"> &copy; 2016 EverydayNews.com &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mariq Ninova & Georgi Andreev</font>
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