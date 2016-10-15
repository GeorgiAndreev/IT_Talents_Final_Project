<%@page import="com.newssite.controller.ChangeThemes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Ежедневик.бг</title>
</head>
<body>
<c:forEach begin="0" end="10">
    Index: ${loop.index}<br/>
</c:forEach>
</body>

</html>