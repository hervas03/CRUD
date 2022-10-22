<%@page import="tiendaVehiculos.models.Barcos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file = "/auth/login-validation.jsp" %>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="UTF-8">
<title>Barcos</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
		<div class="row">
			<div class="home col-sm-12 col-md-12 col-lg-12">
				<a href="BarcosController?action=index" class="inicio">Volver al
					registro</a>
			</div>
		</div>
	</header>
	<%
	Barcos barco = (Barcos) request.getAttribute("bar");
	%>
	<div class="row">
	<form class="form-create-bar col-sm-12 col-md-12 col-lg-12" method="POST"
		action="BarcosController?action=update">
		<input type="hidden" name="idEdit" value="<%=barco.getId()%>">
		<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Marca:</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<input class="prueba" required="required" type="text"
				name="marcaEdit" value="<%=barco.getMarca()%>">
		</div>
		<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Modelo:</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<input class="prueba" required="required" type="text"
				name="modeloEdit" value="<%=barco.getModelo()%>">
		</div>
		<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Licencia:</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<input class="prueba" required="required" type="text"
				name="licenciaEdit" value="<%=barco.getLicencia()%>">
		</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<button class="button-form" type="submit">Actualizar</button>
		</div>
	</form>
</div>
</body>
</html>