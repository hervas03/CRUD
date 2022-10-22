<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file = "/auth/login-validation.jsp" %>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="UTF-8">
<title>HALA MADRID</title>
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
	<div class="row">

		<form class="form-add-mot col-sm-12 col-md-12 col-lg-12" method="POST"
			action="MotosController?action=create">

			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Marca:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="prueba" required="required" type="text"
					name="marcaNew" required="required">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Modelo:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="prueba" required="required" type="text"
					name="modeloNew">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Caballos:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="prueba" required="required" type="text"
					name="caballosNew">
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<button class="button-form" type="submit">Añadir</button>
			</div>
		</form>
	</div>
</body>
</html>