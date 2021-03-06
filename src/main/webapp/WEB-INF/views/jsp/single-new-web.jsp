<%@page import="com.newssite.model.Comment"%>
<%@page import="ch.qos.logback.core.Context"%>
<%@page
	import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page import="com.newssite.NewArticleConfiguration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.newssite.model.NewArticleDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.newssite.model.NewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.newssite.model.New"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>News App</title>
<style type="text/css">
div.comment {
	border: solid;
	border-color: gray;
	margin: 5px; 5 px; 5 px; 5 px;
	height: 130px;
}
</style>
</head>
<body style="zoom: 220%; background-color: #CDC673;">
<form action="/NewssiteProject/index" style="position:fixed;">
					<input class="m" type="image" src="/NewssiteProject/imgs/en1.png"
						alt="Submit" width="400" height="150">
				</form>
<div id="fb-root"></div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
    <script src="http://malsup.github.com/jquery.form.js"></script> 

<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
	<div style="margin-left:250px;">
		<div id="content1"
			style="display: inline-block; background-color: #FFF68F; border-radius: 25px; width: 700px; padding: 0px; 0 px; 0 px; 0 px; float: left; border: solid; border-color: gray;">
			<%
				int newIdInt = 0;
				New singleNew = new New();
				if (request.getAttribute("newIdToShow") != null) {
					String newId = (String) request.getAttribute("newIdToShow");
				
					
					//request.setAttribute("newToShowAfterComment", newId);
		
					//out.print(newId);
					newIdInt = Integer.parseInt(newId);

					AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(
							NewArticleConfiguration.class);
					//ArrayList<New> allNews = NewDAO.allNewsFromFile;
					//ArrayList<New> allNews = NewDAO.getNewsFromFile();
					ArrayList<New> allNews = (ArrayList)session.getAttribute("searchResults");
					//ArrayList<New> allNews = (ArrayList)context.getBean(NewArticleDAO.class).allNewsBySearchWord;
					context.close();
					//out.print( allNews);out.print( allNews);out.print( allNews);
					for (int index = 0; index < allNews.size(); index++) {
						if (allNews.get(index).getId() == newIdInt) {
							singleNew = allNews.get(index);
							break;
						}
					}
				}
			%>

			<h1 style="margin: 20px; 20 px; 20 px; 20 px; color: gray;">
				<%=singleNew.getTitle()%>
			</h1>

			<p style="margin: 20px;20px;20px;20px; ">
				<%=singleNew.getText()%>
			</p>
			<div id="content" class="test"
				style="display: inline-block; margin: 20px;20px;20px;20px;">
				<img
					style="max-width: 660px; max-height: 440px; margin: 0px;0px;30px;20px;"
					src='<%=singleNew.getMainImage()%>'>
			</div>

			<p id="demo"></p>
			<!--  <div class="fb-comments" data-href="http://localhost:8080/NewssiteProject/" data-width="700" data-numposts="5"></div>  -->
			
			<% ///if (request.getAttribute("comments") != null) {
				//ArrayList<Comment>comments = (ArrayList<Comment>)request.getAttribute("comments") ;
			
				for(int index=0; index < 0; index++){
					
				//}
			%>
		<div class="comment"
					style="background-color: #CDC673; border-radius: 25px;">
					<img
						style="float: left; margin: 10px; 10 px; 10 px; 10 px; max-width: 100px; max-height: 100px;"
						src="https://s15.postimg.org/qo2xkeiiz/an1.png">
						
					

					<form name="comment1" id="comment1" class="comment1" action="http://localhost:8080/NewssiteProject/Comment" method='get'>
					
					<textarea id="tt" rows="3" cols="40" name="commentText1" style="font-size: 20px; background-color: #FFF68F; float: left; display: inline-block; margin-top: 20px; margin-left: 30px;"></textarea>
					</form>
				</div>
			<%
			}
			%>
			
			
			<div id="content" class="test"
				style="display: inline-block; float: left; margin: 20px;20px;20px;20px;">

				<div class="comment"
					style="background-color: #CDC673; border-radius: 25px;">
					<img
						style="float: left; margin: 10px; 10 px; 10 px; 10 px; max-width: 100px; max-height: 100px;"
						src="https://s15.postimg.org/qo2xkeiiz/an1.png">
						
					

					<form name="comment" id="comment" class="comment" action="http://localhost:8080/NewssiteProject/Comment" method='get'>
					
					<textarea id="tt" rows="3" cols="40" name="commentText" style="font-size: 20px; background-color: #FFF68F; float: left; display: inline-block; margin-top: 20px;"></textarea>
						<!-- <input type="hidden" name="whichNewToShow" value="mock" /> -->
						<input
							id="b1" class="b1" 
							style="border-radius: 25px; background-color: #FFF68F; margin: 10px; 20 px; 10 px; 30 px; float: right; border-color: black;"
							class="subscribe" type="button" onclick="addTextArea()"
							value="POST COMMENT">
						<input type="text" name="whichNew" style="display:none;" value=<%=(String)request.getAttribute("newIdToShow") %>>
					</form>
				</div>
			</div>
			<!--<form:form method="GET" action="/NewssiteProject/Comment">
		<table>
			<tr>
				<td><input type="submit" value="Redirect Page" /></td>
			</tr>
		</table>
		<img src="/NewssiteProject/imgs/dove-mail.jpg">
	</form:form>-->

		</div>
		<!--  <form name="login" id="login"
			action="<%=application.getContextPath()%>/GoogleLogin" method="get">
			<input type=hidden id="firstName"  name="firstName"/>
		</form>
		<script>
		document.getElementById("firstName").value = "XYZ";
		document.getElementById("login").submit();
		</script>-->
	</div>

		<script>
		//document.getElementById("comment").value = "XYZ";
		function submitComment() {
		//document.getElementById("comment").submit();
		
		
		
		/*$(function() {
  $('#comment').submit(function(event) {
    event.preventDefault(); // Prevent the form from submitting via the browser
    var form = $(this);
    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      //data: form.serialize()
    }).done(function(data) {
      // Optionally alert the user of success here...
    }).fail(function(data) {
      // Optionally alert the user of an error here...
    });
  });
});*/


$(function() {
	  $('#comment').submit(function(event) {
	    event.preventDefault(); // Prevent the form from submitting via the browser
	    var form = $(this);
	    var textOfComment = $('#tt').val();
	    $.ajax({
	      type: "get",
	      url: "http://localhost:8080/NewssiteProject/Comment",
	      data: "commentText=" + textOfComment
	    }).done(function(data) {
	      // Optionally alert the user of success here...
	    }).fail(function(data) {
	      // Optionally alert the user of an error here...
	    });
	  });
	});
		//$("#comment").ajaxForm({url: '/NewssiteProject/Comment', type: 'post'})
		/*
			$("#comment").submit(function(e) {

			    var url = "/NewssiteProject/Comment"; // the script where you handle the form input.

			    $.ajax({
			           type: "POST",
			           url: url,
			           data: $("#comment").serialize(), // serializes the form's elements.
			           success: function(data)
			           {
			               alert(data); // show response from the php script.
			           }
			         });

			    e.preventDefault(); // avoid to execute the actual submit of the form.
			});
		*/
		
		/*  var frm = $('#comment');
	    frm.submit(function (ev) {
	        $.ajax({
	            type: frm.attr('method'),
	            url: frm.attr('action'),
	            data: frm.serialize(),
	            success: function (data) {
	                alert('ok');
	            }
	        });

	        ev.preventDefault();
	    });*/

		}
		</script>

		<script>
		function addDate() {
			document.getElementById("p").innerHTML = Date();
			document.getElementById('p').id = "ne";
		}
		function getTextFromUser() {
			var textFromUser = document.getElementById("tt").value;
			document.getElementById("tt").value = "";
			//document.getElementById("t").innerHTML = Date();
			//document.getElementById('t').id = "ne";
			document.getElementById('t').value = textFromUser;
			//document.getElementById('t').value="Tova e komentar";
			document.getElementById('t').setAttribute("readonly", "true");
			//document.getElementById('t').value = texFromUser;
			document.getElementById('t').id = "ne";
			//document.getElementById('ne').value = texFromUser;
		}
		function addTextFromUser() {
			//document.getElementById("t").innerHTML = Date();
			document.getElementById('t').value = textFromUser;
			document.getElementById('t').id = "ne";
		}
	</script>

	<script type="text/javascript">
		var moviePath = "date";
		document.write('<param name="movie" value="' + moviePath + '">');
		var howLongIsThis = "aaaaaa";
		//var displayEl = document.getElementById("duration");
		//displayEl.innerHTML = howLongIsThis;
	</script>

	<script type="text/javascript">
		var index = 0;
		function addRow() {
			var div = document.createElement('div');

			div.className = 'row';
			div.id = 'row1';

			div.innerHTML = '<input type="text" name="name" value="" />\
	    	 <input type="button" value="POST COMMENT" onclick="addText()">\
	        <input type="button" value="DELETE COMMENT" onclick="removeRow(this)">';

			document.getElementById('content').appendChild(div);
		}
		function addTextArea() {
			var div1 = document.createElement('div');
			//var div2 = document.createElement('div');
			div1.className = 'row';
			div1.id = 'row1';
			//div2.className = 'row';
			div1.innerHTML = '<div class="comment" style="background-color: #CDC673;height:150px;border-radius: 25px;"><img style="float: left; margin: 15px;15px;15px;15px; max-width: 100px; max-height: 100px;" src="https://s15.postimg.org/qo2xkeiiz/an1.png"><textarea id="t" rows="3" cols="40" name="comment" form="usrform" style="font-size: 20px; background-color: #FFF68F; float:left; margin:20px;20px;0px;0px;"></textarea><font size="4" color="gray"><p id = "p"></p></font></div>';
			//div2.innerHTML = '<form action='./ShowNew' method='post'><input type="hidden" name="whichNewToShow" value="mock" /> <input style="border-radius: 25px; margin: 20px; 20 px; 10 px; 30 px; float:right;" class="subscribe" type="button" onclick="addTextArea()" value="COMMENT"> </form>';

			document.getElementById('demo').appendChild(div1);
			//document.getElementById('content').appendChild(div2);
			//addTextAreaWithText();
			//removeRow(this);
			//disableElements();
			addDate();
			submitComment();
			getTextFromUser();
			addTextFromUser();
			
		}

		function addText() {
			var div = document.createElement('div');
			div.className = 'row';
			div.id = 'row1';

			div.innerHTML = 'Taq novina e mnogo qka!';

			document.getElementById('content').appendChild(div);
		}

		function addTextAreaWithText() {
			var div = document.createElement('div');
			div.className = 'row';
			div.id = 'row1';

			div.innerHTML = '<textarea rows="4" cols="80" name="comment" form="usrform" style="background-color: #FFF68F; float:left;">TAQ NOVINA E MNOOOGO QKAAA!!!</textarea><input type="button" style="background-color: gold; border-radius: 25px; margin: 10px; 20 px; 10 px; 30 px; float:right; border-color: black;"; value="POST COMMENT" onclick="addTextArea()">';

			document.getElementById('content').appendChild(div);
		}

		function removeRow(input) {
			document.getElementById('row1').removeChild(input.parentNode);
		}

		function removeTextArea() {
			//document.getElementById('content').removeChild(input.parentNode);
			var text = document.getElementById("row1").value;
			var element = document.getElementById("row1");
			element.parentNode.removeChild(element);
		}
		function myFunction() {
			var c = document.createComment("My personal comments");
			document.body.appendChild(c);
			var x = document.getElementById("row1");
			x.innerHTML = "Mnogo qka novina.";
		}
		function disableElements() {
			document.getElementById("t1").readonly = true;
			var v1 = document.getElementById("t1");
			v1.setAttribute("readonly", "true");
			//v1.setAttribute("pointer-events","none");
			var v2 = document.getElementById("b1");
			v2.style.visibility = 'hidden';

		}
	</script>
</body>
</html>