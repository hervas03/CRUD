<!DOCTYPE html>
<%@page import="jakarta.servlet.http.Cookie"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title>HOME</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<header class="headerIndex">
		<div class="row">
			<div class="home col-sm-12 col-md-4 col-lg-4">HOME</div>
			<div class="col-sm-0 col-md-4 col-lg-5"></div>
			<div class="col-sm-12 col-md-4 col-lg-3">
				<div class="registro">
					<%
					//consulta si el usuario esta registrado
					if (request.getSession().getAttribute("usuario") != null) {
					%><a href="menuController?action=logout" class="Registro"
						id="AuthLogout">Cerrar sesión</a>
					<%
					} else {
					%><a href="menuController?action=login" class="Registro"
						id="AuthLogin">Iniciar sesión / Registrarse</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</header>
	<hr />
	<nav>
		<div class="row">
			<div class="navigation col-sm-0 col-md-1 col-lg-1"></div>
			<div class="navigation col-sm-12 col-md-2 col-lg-2">
				<a href="" class="navigationLink">Nuestros vehiculos</a>
			</div>
			<div class="navigation col-sm-12 col-md-2 col-lg-2">
				<a href="" class="navigationLink">Buscar y comprar</a>
			</div>
			<div class="navigation col-sm-12 col-md-2 col-lg-2">
				<a href="" class="navigationLink">Asesoramiento de compra</a>
			</div>
			<div class="navigation col-sm-12 col-md-2 col-lg-2">
				<a href="" class="navigationLink">Servicios</a>
			</div>
			<div class="navigation col-sm-12 col-md-2 col-lg-2">
				<a href="" class="navigationLink">Innovación</a>
			</div>
			<div class="navigation col-sm-0 col-md-1 col-lg-1"></div>
		</div>
	</nav>

	<main class="main">
		<div class="row">
			<div class="relleno col-sm-12 col-md-12 col-lg-12"></div>
			<div class="col-sm-12 col-md-7 col-lg-7"></div>
			<div class="contenidoMain col-sm-11 col-md-4 col-lg-4">Descubre
				nuestra gama</div>
			<div class="col-sm-1 col-md-1 col-lg-1"></div>
			<div class="col-sm-12 col-md-7 col-lg-7"></div>
			<div class="contenidoMain2 col-sm-11 col-md-4 col-lg-4">El
				lugar donde comienza la nueva era de la movilidad.</div>
			<div class="col-sm-1 col-md-1 col-lg-1"></div>
			<div class="col-sm-12 col-md-7 col-lg-7"></div>
			<div class="botonMain col-sm-11 col-md-4 col-lg-4">
				<input class="boton" type="button" value="Saber mas">
			</div>
			<div class="col-sm-1 col-md-1 col-lg-1"></div>
		</div>
	</main>

	<section>
		<div class="row">
			<div class="vehiculos col-sm-12 col-md-4 col-lg-4">
				<div class="cartas">
					<img src="imagenes/coche.jpeg"> <label class="labels">Turismos</label>
					<br> <label class="labels2">Disponible proximamente</label> <br>
					<a href="CochesController?action=index"> <input type="submit"
						class="botonTablas" value="Descubrelo">

					</a>
				</div>
			</div>
			<div class="vehiculos col-sm-12 col-md-4 col-lg-4">
				<div class="cartas">
					<img src="imagenes/moto.jpeg"> <label class="labels">Motocicletas</label>
					<br> <label class="labels2">Preparado para todo</label> <br>
					<a href="MotosController?action=index"> <input type="submit"
						class="botonTablas" value="Descubrelo">
					</a>
				</div>
			</div>
			<div class="vehiculos col-sm-12 col-md-4 col-lg-4">
				<div class="cartas">
					<img src="imagenes/barco.jpeg"> <label class="labels">Yates</label>
					<br> <label class="labels2">Para nuevos desafios</label> <br>
					<a href="BarcosController?action=index"> <input type="submit"
						class="botonTablas" value="Descubrelo">
					</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>