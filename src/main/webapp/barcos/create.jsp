<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/auth/login-validation.jsp"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create barcos</title>
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
	<div class="row">
		<form class="form-add-bar col-sm-12 col-md-12 col-lg-12" method="POST"
			action="BarcosController?action=create">

			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Marca:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="text"
					name="marcaNew" required="required">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Modelo:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="text"
					name="modeloNew">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Licencia:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="campo-texto" required="required" type="text"
					name="licenciaNew">
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<button class="button-form" type="submit">Añadir</button>
			</div>
		</form>
	</div>
</body>
</html>