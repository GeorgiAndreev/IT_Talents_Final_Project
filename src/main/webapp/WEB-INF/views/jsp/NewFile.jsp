<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.time.LocalDateTime"%>
<%@page import="com.example.model.NewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.New"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TTTTTTTTTTTT</title>
</head>
<body>
TTTTTTTTTTTTTTTTTTTTTT
<%=request.getAttribute("newIdToShow") %>

<%
				int newIdInt = 0;
				New singleNew = new New();
				if (request.getAttribute("newIdToShow") != null) {
					String newId = (String) request.getAttribute("newIdToShow");
					out.print(newId);
					newIdInt = Integer.parseInt(newId);

					ArrayList<New> allNews = NewDAO.allNewsFromFile;
					for (int index = 0; index < allNews.size(); index++) {
						if (allNews.get(index).getId() == newIdInt) {
							singleNew = allNews.get(index);
							break;
						}
					}
				}
			%>
			<br>
<%=singleNew.getTitle()%>
<br>
<br>
<%=singleNew.getText()%>
</body>
</html>