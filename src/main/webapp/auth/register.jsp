<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="row">
	<form class="form-Registro col-sm-12 col-md-12 col-lg-12" method="POST" action="menuController?action=register">
	<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Nombre:</div>
	<div class="col-sm-12 col-md-12 col-lg-12"><input class="prueba" type="text" name="nombreRegistro" required="required"></div>
	<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Email:</div>
	<div class="col-sm-12 col-md-12 col-lg-12"><input class="prueba" type="text" name="mailRegistro" required="required"></div>
	<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Password:</div>
	<div class="col-sm-12 col-md-12 col-lg-12"><input class="prueba" type="text" name="passwordRegistro" required="required"></div>
	<div class="col-sm-12 col-md-12 col-lg-12"><button class="button-form" type="submit">Iniciar sesión</button></div>
	<div class="col-sm-12 col-md-12 col-lg-12"><a class="linkRegistro" href="menuController?action=login">¿No tienes cuenta todavia? Registrate</a></div>
	<br>
	<div class="col-sm-12 col-md-12 col-lg-12"><a class="linkRegistro" href="menuController?action=index">Regresar a la pantalla de inicio</a></div>
	</form>
	</div>
</body>
</html>