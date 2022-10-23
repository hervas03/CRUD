<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="tiendaVehiculos.modelsDAO.MotosDAO"%>
<%@ page import="tiendaVehiculos.models.Motos"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/auth/login-validation.jsp"%>
<!-- TAG -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="motosTAG"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index motos</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
	//Se añade una cukie del apartado correspondiente
	Cookie cookie = new Cookie("Tipo_vehiculo", "Motos");

	cookie.setMaxAge(60 * 60);

	response.addCookie(cookie);
	%>
	<!-- menu de navegacion y cierre de sesion -->
	<header>
		<div class="row">
			<div class="home col-sm-12 col-md-4 col-lg-4">
				<a href="menuController?action=index" class="inicio">Volver al
					inicio</a>
			</div>
			<div class="col-sm-0 col-md-4 col-lg-5"></div>
			<div class="col-sm-12 col-md-4 col-lg-3">
				<div class="registro">
					<%
					//consulta si el usuario esta registrado
					if (request.getSession().getAttribute("usuario") != null) {
					%><a href="menuController?action=logout" class="Registro">Cerrar
						sesión</a>
					<%
					} else {
					%><a href="menuController?action=login" class="Registro">Iniciar
						sesión / Registrarse</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</header>
	<!-- Contenidod el index de la seccion de motos -->
	<main>
		<div class="row" id="tablas">
			<div class="nuestrosVehiculos col-sm-12 col-md-6 col-lg-6">Nuestras
				Motos</div>
			<div class="anadir col-sm-12 col-md-6 col-lg-6">
				<a class="accionAdd" href="MotosController?action=create">Añadir</a>
			</div>

			<div class="tabla col-sm-12 col-md-12 col-lg-12">
				<table>
					<thead>
						<tr>
							<th class="th">#</th>
							<th class="th">Marca</th>
							<th class="th">Modelo</th>
							<th class="th">caballos</th>
							<th class="th">Acciones</th>
						</tr>
					</thead>

					<tbody>

						<!-- var es la variable, items, el contenido que le paso -->
						<motosTAG:forEach var="motos" items="${mot}">

							<tr>
								<td class="td">${motos.getId()}</td>
								<td class="td">${motos.getMarca()}</td>
								<td class="td">${motos.getModelo()}</td>
								<td class="td">${motos.getCaballos()}</td>
								<td class="td"><a class="accionEditar"
									href="MotosController?action=edit&id=${motos.getId()}">Editar</a>
									<a class="accionEliminar"
									href="MotosController?action=delete&id=${motos.getId()}">Eliminar</a>
								</td>
							</tr>

						</motosTAG:forEach>

					</tbody>
				</table>
			</div>
		</div>

	</main>

</body>
</html>