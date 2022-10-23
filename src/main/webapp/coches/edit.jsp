<%@page import="tiendaVehiculos.models.Coches"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/auth/login-validation.jsp"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit coches</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<div class="row">
			<div class="home col-sm-12 col-md-12 col-lg-12">
				<a href="CochesController?action=index" class="inicio">Volver al
					registro</a>
			</div>
		</div>
	</header>
	<%
	Coches coche = (Coches) request.getAttribute("coc");
	%>
	<div class="row">
		<form class="form-create-coc col-sm-12 col-md-12 col-lg-12"
			method="POST" action="CochesController?action=update">
			<input type="hidden" name="idEdit" value="<%=coche.getId()%>">
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Marca:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="text"
					name="marcaEdit" value="<%=coche.getMarca()%>">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Modelo:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="text"
					name="modeloEdit" value="<%=coche.getModelo()%>">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Puertas:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="number"
					name="puertasEdit" value="<%=coche.getPuertas()%>">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Precio:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="number"
					step="0.01" name="precioEdit" value="<%=coche.getPrecio()%>">
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<button class="button-form" type="submit">Actualizar</button>
			</div>
		</form>
	</div>
</body>
</html>