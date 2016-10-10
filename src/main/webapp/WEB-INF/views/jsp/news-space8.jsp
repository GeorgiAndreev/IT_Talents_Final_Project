<%@page import="com.example.controller.ChangeThemes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ежедневик.бг</title>



<style type="text/css">
header, section, footer, aside, nav, article, figure, figcaption {
	display: block;
}
.mySlides {display:none;background-color:#CDC673;width:1200px;height:600px;margin: 40px 80px 80px 80px;line-height: 1.4em;font-size: 70px;}
<% String id = "gold";
String headerImage = ChangeThemes.returnHeaderImage(id);
String backgroundImage = ChangeThemes.returnImage(id);
String backgroundColor = ChangeThemes.returnColor(id);
String borderColor = ChangeThemes.returnBorder(id);%>

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

.wrapper {
	
	width: 2230px;
	margin: 20px auto 20px 500px;
	/*border: 2px solid #000000;*/
	/*background-color: #D3D3D3;*/
	background-color:  #CDC673;
	border-radius: 25px;
}

header {
border: solid;
	border-color: gray;
	margin: 0px 0px 0px 50px;
	action: "${pageContext.request.contextPath}/jsp2/news-green.jsp";
	color: #ffff00;
	height: 262px;
	width: 2120px;
	background-image:
		url(/NewssiteProject/imgs/<%=headerImage%>);
		border-radius: 25px;
}

div.up {
display: block;
border: solid;
	border-color: gray;
	margin: 100px 0px 0px 50px;
	background-color:  #FFF68F;
	height: 100px;
	width: 2100px;
	border-radius: 25px;
	
	color:black;
	line-height: 4.7em;
	font-size: 56px;
	font-size: 120%;
	padding: 7px 0px 0px 20px;
}
div.upup {
	margin: 60px 0px 0px 50px;
	background-color:  #FFF68F;
	width: 2120px;
	height: 100px;
		border-radius: 25px;
}

div.down {
	width:2120px;
	color: black;
line-height: 5.7em;
	margin: 0px 0px 0px 50px;
	background-color:  #FFF68F;
	height: 100px;
		border-radius: 25px;
}

h1 {
	color: black;
	text-indent: -9999px;
	width: 940px;
	height: 130px;
	margin: 0px;
	text-indent: -9999px;
}

p {
	color: black;
}

nav{
margin: 210px 0px 0px 0px;
	clear: both;
	color: #ffffff;
	background-color: #CDC673;
	height: 100px;
}

footer {
	clear: both;
	/*color: #ffffff;*/
	color: black;
	background-color: #CDC673;
	height: 100px;
	line-height: 4.7em;
	font-size: 56px;
	font-size: 120%;
	padding: 7px 0px 0px 20px;
	border-radius: 25px;
}

nav ul {
	margin: 0px;
	padding: 5px 0px 5px 30px;
}

nav li {
	display: inline;
	margin-right: 25px;
	padding: 0px;
}

nav li a {
	color: #ffffff;
}

nav li a:hover, nav li a.current {
	color: #de6581;
}

section.about-the-center {
	margin: 40px 0px 20px 0px;
	float: left;
	width: 810px;
	padding: 0px 0px 0px 0px;
	background-color: #FFF68F;
	border-radius: 25px;
}

article { 
	clear: both;
	overflow: auto;
	width: 100%;
	margin: 10px 10px 10px 10px;
	<%="background-color: white;"%>
}


section.subscribe2{
	margin: 0px 0px 0px 0px;
}

section.down1{
	border: solid;
	border-color: gray;
	margin: 70px 30px 30px 70px;
	height: 250px;
	width: 2000px;
	float: left;
	background-color: #CDC673;
	border-radius: 25px;
	
}

section.menu-inner{
border: solid;
	border-color: gray;
	margin: 0px 30px 30px 0px;
	height: 260px;
	width: 2120px;
	float: left;
	background-color: #FFF68F;
	border-radius: 25px;
	
}

section.menu-inner-fixed{
/*border: solid;
	border-color: gray;*/
	margin: 30px 30px 30px 0px;
	height: 230px;
	width: 100%;
	float: left;
	background-color:  #CDC673	;
	border-radius: 25px;
}

section.subscribe{
	padding: 0px 0px 0px 0px;
	margin: 10px 0px 0px 0px;
}

section.follow-us{
	border: solid;
	border-color: gray;
	padding: 0px 0px 0px 0px;
	margin: 0px 0px 0px 0px;
	width: 720px;
	float: left;
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
	width: 490px;
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
	width: 770px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 40px 30px 20px 30px;
	<%=backgroundColor%>
	border-radius: 25px;
}

section.down1 {
width: 1490px;
	display: inline-block;
}

aside.down {
	border: solid;
	border-color: gray;
    height: 400px;
	width: 1630px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 0px 20px 20px 30px;
	<%=backgroundColor%>
	border-radius: 25px;
	display: inline-block;
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
	width: 1600px;
	height: 800px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 60px 0px 0px 40px;
	<%=backgroundColor%>
	border-radius: 25px;
}

aside.middle {
	border: solid;
	border-color: gray;
	width: 810px;
	float: left;
	padding: 0px 0px 0px 0px;
	margin: 20px 0px 20px 0px;
	background-color: #FFF68F;
	border-radius: 25px;
}

aside.right-up {
border: solid;
	border-color: gray;
	width: 490px;
	height: 800px;
	float: right;
	padding: 0px 0px 0px 0px;
	margin: 60px 40px 0px 0px;
	<%=backgroundColor%>
	border-radius: 25px;
}

hgroup {
width: 659px;
	margin: 30px 30px 0px 10px;
}

figure.smiling-cat {
	margin: 30px 30px 0px 30px;
}

figure.mandala-tree {
	margin: 10px 0px 5px 0px;
	padding: 0px;
}

figure {
	float: left;
	width: 290px;
	height: 150px;
	padding: 5px;
	margin: 30px 0px 0px 30px;
}

figure.earth {
	float: left;
	width: 400px;
	height: 400px;
	padding: 0px;
	margin: 0px 0px 10px 0px;
}

figcaption {
	font-size: 90%;
	text-align: left;
}


aside section a {
	display: block;
	padding: 10px;
	border-bottom: 1px solid #eeeeee;
}

aside section a:hover {
	color: #985d6a;
	background-color: #efefef;
}

a {
	color: #de6581;
	text-decoration: none;
	font-size: 36px;
	line-height: 2.9em;
	
}

h1, h2, h3 {
	font-weight: normal;
}

span {
	display: inline-block;
	vertical-align: middle;
	line-height: 21px; /* <-- adjust this */
	
}

span.title {
	display: inline-block;
	vertical-align: middle;
	line-height: 50px; /* <-- adjust this */
}

h2.title {
	<%=borderColor%>
}

h2 {
	border-top: 5px solid  #CDC673;
	border-right: 5px solid  #CDC673;
	border-bottom: 5px solid  #CDC673;
	border-left: 5px solid  #CDC673;
	/*color: #de6581;*/
	color: black;
	margin: 30px 0px 0px 0px;
	padding: 10px 10px 10px 10px;
	margin: 30px 0px 5px 0px;
	background-color: #CDC673;
	border-radius: 25px;
	overflow: hidden;
	text-align: center;
	height: 50px;
}

h3 {
	margin: 0px 0px 10px 0px;
	color: #de6581;
}

aside h2 {
	padding: 10px 0px 0px 0px;
	/*color: #de6581;*/
	color: black;
	
}

form {
	margin: 10px 0px 20px 0px;
}

form.inquiry {
	margin: 50px 0px 20px 20px;
}

input.fb:hover {
border:30px solid;
color:#FFF68F;
background-color:#FFF68F;
}
input.m:hover {
border:45px solid;
color:#FFF68F;
}
input.rss:hover {
border:30px solid;
color:#FFF68F;
background-color: #FFF68F;
}
input.m {
border:30px solid;
border-radius: 25px;
color:  #CDC673	;

    float:left; 
	margin: 0px 0px 0px 55px;
	padding: 0px 0px 0px 0px;
}
input.fb {
border:30px solid;
border-radius: 25px;
color: #CDC673;
background-color: #CDC673;
    float:left; 
	margin: 0px 0px 0px 70px;
	padding: 0px 0px 0px 0px;
}

input.rss {
border:30px solid;
border-radius: 25px;
color: #CDC673;
background-color: #CDC673;
float:left;
	margin: 10px 0px 0px 70px;
	padding: 0px 0px 0px 0px;
}


input.log {
    float:left;
	margin: 10px 0px 0px 26px;
	padding: 0px 0px 0px 0px;
}

input.reg {
	float:left;
	margin: 10px 0px 0px 26px;
	padding: 0px 0px 0px 0px;
}

input.home {
    cursor: url(fb1.png),pointer,default;
	margin: 10px 0px 0px 26px;
}

input.paleta {
    float:left;
	margin: 10px 0px 0px 26px;
	padding: 0px 0px 0px 0px;
}


button {
	margin: 20px 10px 10px 0px;
}

input.select-theme {
    width:200px;
    height:100px;
	margin: 40px 40px 40px 40px;
}

input.draw-quotes {
	margin: 20px 10px 0px 0px;
}

input.subscribe-name {
	margin: 10px 10px 0px 0px;
}

input.subscribe-name1 {
	margin: 10px 10px 0px 0px;
}

input.subscribe-email {
	margin: 10px 10px 20px 0px;
}

input.subscribe {
	margin: 20px 10px 0px 0px;
}

iframe.round-clock{
	margin: 40px 0px 0px 140px;
} 
#canvas { pointer-events:none; }
canvas {
position: absolute;
	display: block;
}

a.back-to-top {
	
	width: 150px;
	height: 150px;
	text-indent: -9999px;
	position: fixed;
	z-index: 999;
	right: 430px;
	bottom: 20px;
	background:  #CDC673 url("/NewssiteProject/imgs/up5.png") no-repeat center 43%;
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 60px;
	border-style: solid;
	border-color: gray;
}
a:hover.back-to-top {
	<%=backgroundColor%>
	background-color:  #FFF68F;
}	
	
#new1{
background-image: src="/NewssiteProject/imgs/wheat1.jpg";
}
}


/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url("/NewssiteProject/imgs/await.gif") center no-repeat #fff;
}
</style>


<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
		
		<script type="text/javascript">
		//paste this code under the head tag or in a separate js file.
		// Wait for window load
		$(window).load(function() {
			// Animate loader off screen
			$(".se-pre-con").fadeOut("slow");;
		});</script>
		
		
		<script type="text/javascript">$('#home').bt({
			  padding: 20,
			  width: 100,
			  spikeLength: 40,
			  spikeGirth: 40,
			  cornerRadius: 40,
			  fill: 'rgba(0, 0, 0, .8)',
			  strokeWidth: 3,
			  strokeStyle: '#CC0',
			  cssStyles: {color: '#FFF', fontWeight: 'bold'}
			});</script>
		<script type="text/javascript">$('login').bt();</script>
		<script type="text/javascript">$('reg').bt();</script>
<script src="${pageContext.request.contextPath}/js/snow.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>



<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.js"
type="text/javascript"></script>

<style type="text/css">
@import url("http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.css");

#feedControl {
margin-top : 10px;
margin-left: auto;
margin-right: auto;
width : 500px;
font-size: 12px;
color: #9CADD0;
}
</style>
<script type="text/javascript">
function load() {
var feed ="http://feeds.bbci.co.uk/news/world/rss.xml";
new GFdynamicFeedControl(feed, "feedControl");

}
google.load("feeds", "1");
google.setOnLoadCallback(load);
</script>
</head>
<div>YYYYYYYYYYYYYYY</div>
<body>
<div style="border:solid; border-color:gray; border-radius:25px; height:260px;width:100%;background-color: #FFF68F;position:fixed;margin-top:-5em;">
<aside class="menu">

			<section class="menu-inner-fixed">
<form action="/NewssiteProject/index"><input class="m" type="image" src="/NewssiteProject/imgs/en1.png" alt="Submit" width="400" height="150"></form>
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/pol1.png" alt="Submit" width="150" height="150"></form>
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/ball1.jpg" alt="Submit" width="150" height="150"></form>
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/tror1.png" alt="Submit" width="150" height="150"></form>
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/tech1.png" alt="Submit" width="150" height="150"></form>		
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/he1.png" alt="Submit" width="150" height="150"></form>		
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/culture1.png" alt="Submit" width="150" height="150"></form>		
<form action="/NewssiteProject/news-short2"><input class="m" type="image" src="/NewssiteProject/imgs/smile0.jpg" alt="Submit" width="150" height="150"></form>		
<form action="/NewssiteProject/index"><input class="m" type="image" src="/NewssiteProject/imgs/home0.jpg" alt="Submit" width="150" height="150"></form>
			</section>

		</aside>
</div>
<div style="border:solid; border-color:gray; border-radius:25px; float:left;height:100%;width:500px;background-color: #CDC673; position:fixed;margin-top:180px;"></div>
<div style="color:white;border:solid; border-color:gray; border-radius:25px;height:100%;width:500px;background-color: #CDC673; position:fixed;margin-top:180px;margin-left:2185px;"><br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
<br> <br> <br> <br> <br><br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <font size="70"style="border:solid; border-color:gray; border-radius:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &copy; 2016&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ежедневник.бг&nbsp;&nbsp;&nbsp; </font></div>
<div class="se-pre-con"></div>
<canvas id="canvas"></canvas>

	<div class="wrapper">
	
	<div class="upup">
			<h1>Cooltime House</h1>
			 
			
		</div>
	<div class="up">
			<font size="70">&nbsp;&nbsp;&nbsp;&nbsp;
			
			ДОБРЕ ДОШЛИ, не сте влезли в профила си </font>
			 
			
		</div >
		
		<!-- <header>
			<h1>Cooltime House</h1>
			 
			
		</header>
		<div class="down"style="border:solid; border-color: gray;">
			<font size="70">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			ЯКИЯТ САЙТ ЗА НОВИНИ </font>
			 
			
		</div> -->
		<!--   <aside class="menu">

			<section class="menu-inner">
				
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/pol1.png" alt="Submit" width="150" height="150"></form>
		<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/ball1.jpg" alt="Submit" width="150" height="150"></form>
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/tror1.png" alt="Submit" width="150" height="150"></form>
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/tech1.png" alt="Submit" width="150" height="150"></form>		
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/he1.png" alt="Submit" width="150" height="150"></form>		
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/culture1.png" alt="Submit" width="150" height="150"></form>		
			<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/smile0.jpg" alt="Submit" width="150" height="150"></form>		
						<form action="${pageContext.request.contextPath}/jsp2/news-space6.jsp"><input class="m" type="image" src="/NewssiteProject/imgs/home0.jpg" alt="Submit" width="150" height="150"></form>		
			
			</section>

		</aside>-->
<!--  <div class="down" style="height:30px; width:2230px;"></div>	-->	
		
		<aside class="left-up">

			<h2 class="w3-center"><font size="20">ИЗБРАНИ НОВИНИ</font></h2>

<div class="w3-content" style="width:400px">

<div class="mySlides" style="width:1200px;height:600px;">
  <img src="/NewssiteProject/imgs/red-stars1.jpg" style="width:1200px;height:480px;">
  <div><a href="http://www.space.com"><font size="800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;КОСМОС</font></a></div>
</div>

<div class="mySlides" style="width:1200px;height:600px;">
  <img src="/NewssiteProject/imgs/wheat1.jpg" style="width:1200px;height:480px;">
  <div><a href="https://en.wikipedia.org/wiki/Wheat"><font size="800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ЖИТО</font></a></div>
</div>

<div id="new1" class="mySlides" style="width:1200px;height:600px;">
  <img src="/NewssiteProject/imgs/forest1.jpg" style="width:1200px;height:480px;">
  <div><a href="http://survivetheforest.com"><font size="800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ГОРА</font></a></div>
</div>

<!--  <img class="mySlides" src="/NewssiteProject/imgs/wheat1.jpg" style="width:1200px;height:600px;">-->

</div>

		</aside>
		
		 <aside class="right-up">

			
			<!-- BITTY BROWSER : WWW.BITTY.COM : {BEGIN} -->
<!--  <table style="width:100% !important;background:#999 !important;padding:0px !important;margin:0px !important;border:0px !important;border-collapse:collapse !important"><tr><td style="background:#999 !important;padding:1px !important;margin:0px !important;border:0px !important;"><iframe src="http://b1.bitty.com/b2browser/?contenttype=rssfeed&contentvalue=http%3A%2F%2Ffeeds%2Elabnol%2Eorg%2Flabnol"  style="display:block !important;width:100% !important;height:400px !important;background:#D4D0C8 !important;padding:0px !important;margin:0px !important;border:0px !important;"><a href="http://www.bitty.com/">Bitty Browser</a> (iframes required)</iframe></td></tr></table>-->
<!-- BITTY BROWSER : WWW.BITTY.COM : {END} -->
<!--  <a href="http://www.bitty.com/manual/?contenttype=rssfeed&contentvalue=http%3A%2F%2Ffeeds%2Elabnol%2Eorg%2Flabnol" target="_blank">Add my Bitty Browser to your site...</a>-->
	
		<iframe width="400" height="400" style="border:none;" src="http://output96.rssinclude.com/output?type=iframe&amp;id=1099968&amp;hash=acfd107628e325462cd6bbe615df114a"></iframe>
		<iframe width="700" height="700" style="border:none;" src="http://output50.rssinclude.com/output?type=iframe&amp;id=1099973&amp;hash=8d1d46f8c7b113b14b9c118ca1b047d8"></iframe>
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

				  <h2><font size="20">АНКЕТА</font></h2>
				  
				  <form class="inquiry">
				  <font size="20">Какво мислите за програмистите?</font><br><br>
  <input type="radio" name="gender" value="male" checked><font size="20">Готини са. </font><br><br><br>
  <input type="radio" name="gender" value="female"><font size="20">Много са готини.</font><br><br><br>
  <input type="radio" name="gender" value="other"><font size="20">Турбо мега готини са.</font>
  <input class="select-theme" type="submit"
						value="ГЛАСУВАЙ!">
</form>
			
			</section>
		</aside>


		<aside class="right">
			

			 <section class="subscribe2">
			 <!-- 
				<h2>
					<span>Абонирайте се за <br> нашият бюлетин:
					</span>
				</h2>
-->

<form style="cursor: url('/NewssiteProject/imgs/up-arrow.png'), pointer, default" action="${pageContext.request.contextPath}/jsp/login.jsp"><input title="ВЛЕЗ В ПРОФИЛА СИ" id="login" class="log" type="image" src="/NewssiteProject/imgs/login2.png" alt="Submit" width="160" height="160"></form>
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input title="РЕГИСТРИРАЙ СЕ" id="reg" class="reg" type="image" src="/NewssiteProject/imgs/reg1.png" alt="Submit" width="160" height="160"></form>
<form><input title="КЪМ ГЛАВНАТА СТРАНИЦА" id="home" class="home" type="image" src="/NewssiteProject/imgs/home1.gif" alt="Submit" width="160" height="160"></form>
		<form><input title="РАЗГЛЕДАЙ И КОМЕНТИРАЙ ТЕМИТЕ" id="paleta" class="paleta" type="image" src="/NewssiteProject/imgs/paleta1.jpg" alt="Submit" width="260" height="160"></form>
				<input class="select-theme" type="submit"
						value="Изтегли новина!">
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input title="ЗАПИШИ СЕ ЗА БЮЛЕТИН" id="login" class="log" type="image" src="/NewssiteProject/imgs/mail1.png" alt="Submit" width="260" height="160"></form>
<form action="${pageContext.request.contextPath}/jsp/login.jsp"><input title="СВЪРЖИ СЕ С НАС" id="home" class="home" type="image" src="/NewssiteProject/imgs/contact1.jpg" alt="Submit" width="240" height="160"></form>
<iframe src="http://free.timeanddate.com/clock/i5dxw7xh/n238/tlbg11/fn2/fs36/tcccc/ftb/bo2/tt1" width="695" height="55"></iframe>
<iframe class="round-clock" src="http://free.timeanddate.com/clock/i5dxi3b7/n238/szw400/szh400/hoc09f/hbw0/hfc09f/cf100/hnce1ead6/fas30/fdi66/mqc000/mql15/mqw4/mqd98/mhc000/mhl15/mhw4/mhd98/mmc000/mml10/mmw1/mmd98/hhs2/hms2" width="400" height="400"></iframe>
<!--  https://www.timeanddate.com/clocks/free.html-->
				<%
					String name1 = (String) request.getAttribute("name");
					String email1 = (String) request.getAttribute("email");
				%>
				<%
					//int id = 1;
					//request.setAttribute("page_no", id);
					String whichPage1 = "/jsp/about-the-center-out.jsp";
					session.setAttribute("whichPage", whichPage1);
				%>
				<form action="${pageContext.request.contextPath}/subscribe-servlet"
					method="get">
				
					<br> Name: <input class="subscribe-name1" type="text"
						name="userName"><br> Email: <input
						class="subscribe-email" type="text" name="email"><br>
					<input class="subscribe" type="submit" value="Абонирам се!">


				</form>
			</section>

			<!--<section class="search-for-events">

				  <h2>Search for events:</h2>
				<form>
					word to search for:<br> <input type="text" name="username"><br>
					<button type="button">Search!</button>
				</form>

			</section>-->

			<section class="draw-quotes">


				<h2>
					Случайна новина:<br> <br>
				</h2>

				<!--  <form action="servlet1" method="get"> -->
				<form>
					
				</form>


			</section>
<section style="width:500px;height:500px;padding:6px;6px;6px;6px;overflow:scroll;">
<script language="JavaScript" src="http://www.feedbucket.com/js.php?src=http%3A%2F%2Ffeeds.labnol.org%2Flabnol&chan=y&desc=1&date=y" type="text/javascript"></script>
<noscript>
<a href="http://www.feedbucket.com/">Web RSS</a> by FeedBucket.
</noscript>
	</section>		
			
			
		</aside>

		<section class="about-the-center">
			
				<h2>
					Абонирайте1 се за <br> нашият бюлетин:
				</h2>
				
				<!-- <h3>And what we can do for you</h3> -->
			
			

			<!-- Come and bring with yourself
					who you are... And you will realize you are much more!
				<p style="text-indent: 5em;" > -->

			<article>
				<figure>
					<img src="/NewssiteProject/imgs/itt1.png"
						alt="Woman Tree" />
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
					<img src="/NewssiteProject/imgs/vlak1.png"
						alt="Woman Tree" />
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
					<img src="/NewssiteProject/imgs/bgnt1.png"
						alt="Woman Tree" />
					<figcaption></figcaption>
				</figure>
				<p>
					<br>НИКОЛАЙ ТОМИТОВ Е НОВИЯТ ПРЕЗИДЕНТ НА РЕПУБЛИКА БЪЛГАРИЯ<br>
					<br> Страната ни е вече в сигурни ръце, най-накрая свестен човек ще я управлява
				</p>
			</article>
			
		</section>

      <aside class="middle">

			<section class="subscribe">
				<h2>
					<font size="20">МОТИВИРАЩО ВИДЕО</font>
				</h2>

				<iframe width="800" height="550" src="https://www.youtube.com/embed/5-sfG8BV8wU" ></iframe>
			</section>

		</aside>
		
		 <aside class="middle">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

		</aside>
		
		<!--  <a href="#" class="back-to-top">Back to Top</a>	-->
			<!--  <section class="follow-us">
		
				<h2>Свържете се с нас:</h2>
				<p>
					Имейл адрес:<br /> ejednevie_bg@abv.bg<br /> Телефон на
					редакцията:<br /> 0878675645
				</p>

			</section>-->
		
			 <aside class="down">

			<section class="down1">
				
<form action="https://plus.google.com/collections/featured"><input class="fb" type="image" src="/NewssiteProject/imgs/gp1.png" alt="Submit" width="150" height="150"></form>
		<form action="https://www.facebook.com"><input class="fb" type="image" src="/NewssiteProject/imgs/fb1.png" alt="Submit" width="150" height="150"></form>
<form action="https://www.facebook.com"><input class="rss" type="image" src="/NewssiteProject/imgs/rss1.png" alt="Submit" width="150" height="150"></form>
<form action="https://www.pinterest.com"><input class="rss" type="image" src="/NewssiteProject/imgs/pin1.png" alt="Submit" width="150" height="150"></form>		
<!--  <form action="https://twitter.com"><input class="rss" type="image" src="/NewssiteProject/imgs/tw1.png" alt="Submit" width="150" height="150"></form>		-->
<form action="https://www.youtube.com"><input class="rss" type="image" src="/NewssiteProject/imgs/yt1.png" alt="Submit" width="150" height="150"></form>		
			</section>

		</aside> 
	


		<!-- <footer><font size="70">&copy; 2016 Ежедневник.бг </font></footer> -->
	</div>
	<!-- .wrapper -->
	<audio autoplay>
  <!-- MUSIC <source src="${pageContext.request.contextPath}/music/intro09.mp3" type="audio/mpeg"> -->
</audio>

 <!--UP <script src="${pageContext.request.contextPath}/js/back-to-top.js" type="text/javascript"></script>-->
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
    if (slideIndex > x.length) {slideIndex = 1}
    x[slideIndex-1].style.display = "block";
    setTimeout(carousel, 3000);
}
</script>
<script></script>
</body>
</html>