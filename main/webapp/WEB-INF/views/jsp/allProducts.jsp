<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Products</title>
<style>
	table, tr, td, thead, th {
		border: 2px solid black;
		border-collapse: collapse;
		padding: 2px;
	}
</style>
</head>
<body>

	<table>
		<thead>
			<th> Name </th>
			<th> Quantity </th>
		</thead>
		
		<c:forEach items="${allProducts}" var="product">
			<tr>
				<td> ${product.name} </td>
				<td> ${product.quantity} </td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>