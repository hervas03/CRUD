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

	<%
	String favorito = null;

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (Cookie cokie_temporal : cookies) {
			if ("deporte_favorito".equals(cokie_temporal.getName())) {
		favorito = cokie_temporal.getValue();
		//out.print("UBICACION" + cokie_temporal.getPath());
			}
		}

	} else {
		favorito = "NO EXIXTE";
	}
	%>
	
	<p>Deporte favorito <%= favorito %></p>
		

</body>
</html>