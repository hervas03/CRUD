<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="row">
		<form class="form-Login col-sm-12 col-md-12 col-lg-12" method="POST"
			action="menuController?action=login">
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Email:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="prueba" type="text" name="mail" required="required">
			</div>
			<div class="infoCamposTexto col-sm-12 col-md-12 col-lg-12">Password:</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<input class="prueba" type="text" name="password"
					required="required">
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<button class="button-form" type="submit">Iniciar sesión</button>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<a class="linkRegistro" href="menuController?action=register">¿No
					tienes cuenta todavia? Registrate</a>
			</div>
			<br>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<a class="linkRegistro" href="/menuController?action=index">Regresar
					a la pantalla de inicio</a>
			</div>
		</form>
	</div>
</body>
</html>