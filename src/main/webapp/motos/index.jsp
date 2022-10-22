<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="tiendaVehiculos.modelsDAO.MotosDAO"%>
<%@ page import="tiendaVehiculos.models.Motos"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/auth/login-validation.jsp"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOTOS | index</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
	Cookie cookie = new Cookie("Tipo_vehiculo", "Motos");

	cookie.setMaxAge(60 * 60);

	response.addCookie(cookie);
	%>

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
						<%
						ArrayList<Motos> motos = (ArrayList<Motos>) request.getAttribute("mot");

						for (int i = 0; i < motos.size(); i++) {
							Motos moto = motos.get(i);
						%>
						<tr>
							<td class="td"><%=moto.getId()%></td>
							<td class="td"><%=moto.getMarca()%></td>
							<td class="td"><%=moto.getModelo()%></td>
							<td class="td"><%=moto.getCaballos()%></td>
							<td class="td"><a class="accionEditar"
								href="MotosController?action=edit&id=<%=moto.getId()%>">Editar</a>
								<a class="accionEliminar"
								href="MotosController?action=delete&id=<%=moto.getId()%>">Eliminar</a>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>




	</main>


</body>
</html>