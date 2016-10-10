<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Demo page</title>
<link type="text/css" rel="css/app.css">
</head>

<body>
	<h1>${text} ${username}</h1>
	<p>${product.name}</p>
	<p>${product.quantity}</p>

	<form:form commandName="product">

		<label>Enter name:</label>
		<form:input path="name" />
		<br />

		<label>Enter quantity:</label>
		<form:input path="quantity" />

		<br />
		<input type="submit" value="Add new product" />
	</form:form>


	<br>
	<a href="./">Home Page</a>
	<br>
	<a href="/createGradeBook3">Add grades to GradeBook</a>

	<h2>Spring Page Redirection</h2>
	<p>Click below button to redirect the result to new page</p>
	<form:form method="GET" action="/NewssiteProject/news-short2">
		<table>
			<tr>
				<td><input type="submit" value="Redirect Page" /></td>
			</tr>
		</table>
		<img src="/NewssiteProject/imgs/dove-mail.jpg">
	</form:form>
</body>
</html>