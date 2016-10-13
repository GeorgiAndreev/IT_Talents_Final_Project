<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.newssite.model.UsersManager" %>
<%@ page import="com.newssite.model.User" %>
<%@ page import="com.newssite.controller.LoginServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<h1>HI, welcome to our page!</h1>
		<h2>These are our users:</h2>
		<div><%User user = null;
		if(request.getAttribute("user")!=null){
		user = (User)request.getAttribute("user"); 
		}
		String username = session.getAttribute("loggedAs").toString();%>
		<%= username%>
		<%= user.getEmail()%>
		<img src="PictureServlet?username=<%= user.getUsername()%>" height="30" width="30">
		
		
		<!--  <img src="PictureServlet?username=" height="30" width="30"> -->
	
		</div>
		<table border="solid">
			<tr>
				<th>Name</th>
				<th>Username</th>
				<th>Password</th>
				<th>Address</th>
				<th>Picture</th>
				<th>More Info</th>
			</tr>
			
			<% for(User u : UsersManager.getInstance().getAllUsers().values()){  %>
				<tr>
					<td><%= u.getName() %></td>
					<td><%= u.getUsername() %></td>
					<td><%= u.getPassword() %></td>
					<td><%= u.getAddress() %></td>
					<td><img src="PictureServlet?username=<%= u.getUsername()%>" height="30" width="30"></td>
					<td>
						<form action="ProfileServlet" method="POST">
							<input type="submit" value="View profile">
							<input type="hidden" value="<%= u.getName() %>">
						</form>
					</td>
				</tr>
			<% }  %>
		</table>
	</body>
</html>