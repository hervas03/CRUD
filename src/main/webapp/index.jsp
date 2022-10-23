<!DOCTYPE html>
<%@page import="jakarta.servlet.http.Cookie"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title>HOME</title>
<!-- Estilos del menu desplegable -->
<style type="text/css">
/*Estilos de la etiqueta nav*/
nav {
	/*color de fondo*/
	background-color: #222;
	/*color*/
	color: #fff;
	/*papel en la pantalla*/
	display: flex;
	/*disposicion de espacio*/
	justify-content: space-between;
	/*Que se centre el contenido de testo*/
	align-items: center;
	/*espacio en los margenes*/
	padding: .5rem 2rem;
	/*altura*/
	height: 80px;
}
/*Estilos de dentro de la clase logo-header, de la etiqueta img*/
.logo-header img {
	/*anchura*/
	width: 50px;
}

/*Estilos de la etiqueta a*/
a {
	text-decoration: none;
}
/*Estilos de la etiqueta li*/
li {
	/* Sin estilos en la lista*/
	list-style: none;
}
/*Estilos de dentro de la clase logo-header, de la etiqueta img*/
.nav-menu ul {
	display: flex;
	/*Que se centre el contenido de testo*/
	align-items: center;
}

.nav-menu li {
	/*margen a la derecha*/
	margin-right: 1rem;
}

/*Color de las letras del nav*/
.nav-menu a {
	color: white;
}

.menu-icon img {
	/*ancho y alto de la imagen + borde en las esquinas*/
	width: 30px;
	height: 30px;
	border-radius: 2px;
}

/*estrilos de una clase y un id*/
.menu-icon, #check {
	/*no mostrar*/
	display: none;
}
/*medidas de pantalla de movil*/
@media ( max-width :599px) {
	/*selector universal*/
	* {
		margin: 0;
	}
	.checkbtn {
		/*se genera un bloque*/
		display: block;
	}
	.menu-icon {
		display: block;
		/*posicion fija*/
		position: fixed;
		top: 20px;
		right: 20px;
		cursor: pointer;
	}
	.nav-menu ul {
		display: block;
		position: fixed;
		top: 80px;
		left: -120%;
		background: white;
		width: 100%;
		height: 100vh;
		right: 0;
	}
	.nav-menu ul li {
		padding: 2rem;
		display: flex;
		justify-content: center;
		margin: 0;
	}
	/*estilos del ultimo elemento de class+etiqueta+etiqueta*/
	.nav-menu ul li:last-child {
		background: none;
		padding: 1rem;
	}
	/*estilos de pulsado*/
	#check:checked ~ ul {
		left: 0;
		background-color: black;
		transition: all .25s;
	}
}
</style>
<!-- Enlace de style -->
<link href="Style.css" rel="stylesheet">
</head>
<body>
	<!-- Seleccion de cookie por defecto -->
	<%
	Cookie cookieDefault = new Cookie("Tipo_vehiculo", "Default");

	cookieDefault.setMaxAge(60 * 60 * 60);

	response.addCookie(cookieDefault);
	%>

	<!-- Parte de arriba del navegador -->
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
	<!-- Menu -->
	<nav class="nav">

		<div class="nav-menu">
			<input type="checkbox" id="check"> <label for="check"
				class="checkbtn"> <i class="menu-icon"><img
					src="imagenes/menu.png" alt="" style="background-color: black;"></i>
			</label>
			<ul>
				<li class="navigation"><a class="navigationLink" href="#">Nuestros
						vehiculos</a></li>
				<li class="navigation"><a class="navigationLink" href="#">Buscar
						y comprar</a></li>
				<li class="navigation"><a class="navigationLink" href="#">Asesoramiento
						de compra</a></li>
				<li class="navigation"><a class="navigationLink" href="#">Servicios</a></li>
			</ul>
		</div>

	</nav>
	<!-- Comprobacion y lectura de cookies -->
	<%
	String vehiculo = null;
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if ("Tipo_vehiculo".equals(cookie.getName())) {
		vehiculo = cookie.getValue();

		switch (vehiculo) {

		case "Barcos":
	%>

	<main class="mainBarco">
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

	<%
	break;

	case "Coches":
	%>

	<main class="mainCoche">
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

	<%
	break;

	case "Motos":
	%>

	<main class="mainMoto">
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

	<%
	break;

	case "Default":
	%>

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

	<%
	break;

	default:

		break;

	}

	}
	}

	} else {
	%>

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

	<%
	}
	%>
	<!-- Seccion que lleva al usuario a la parte de administradion -->
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

	<!--Pie de pagina -->
	<!--<footer></footer>-->
</body>
</html>