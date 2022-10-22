<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p>insertando la coockie</p>
	<%
	String deporte = request.getParameter("favorito");

	Cookie cookie = new Cookie("deporte_favorito", deporte);

	cookie.setMaxAge(60 * 60);

	response.addCookie(cookie);
	%>


	<a href="getCookies.jsp"> ver deporte</a>


</body>
</html>