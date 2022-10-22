<%@page import="tiendaVehiculos.models.Motos"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file = "/auth/login-validation.jsp" %>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="UTF-8">
<title>Hala madiurd</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
		<div class="row">
			<div class="home col-sm-12 col-md-12 col-lg-12">
				<a href="MotosController?action=index" class="inicio">Volver al
					registro</a>
			</div>
		</div>
	</header>
	<%
	Motos moto = (Motos) request.getAttribute("mot");
	%>
<div class="row">
	<form class="form-create-mot col-sm-12 col-md-12 col-lg-12" method="POST"
		action="MotosController?action=update">
		<input type="hidden" name="idEdit" value="<%=moto.getId()%>">
		<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Marca:</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<input class="prueba" required="required" type="text"
				name="marcaEdit" value="<%=moto.getMarca()%>">
		</div>
		<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Modelo:</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<input class="prueba" required="required" type="text"
				name="modeloEdit" value="<%=moto.getModelo()%>">
		</div>
		<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Cabalos:</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<input class="prueba" required="required" type="text"
				name="caballosEdit" value="<%=moto.getCaballos()%>">
		</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<button class="button-form" type="submit">Actualizar</button>
		</div>
	</form>
</div>
</body>
</html>