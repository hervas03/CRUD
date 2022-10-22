<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="tiendaVehiculos.modelsDAO.BarcosDAO"%>
<%@ page import="tiendaVehiculos.models.Barcos"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/auth/login-validation.jsp"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BARCOS | index</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
	Cookie cookie = new Cookie("Tipo_vehiculo", "Barcos");

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
			<div class="nuestrosVehiculos col-sm-12 col-md-6 col-lg-6">Nuestros
				Barcos</div>
			<div class="anadir col-sm-12 col-md-6 col-lg-6">
				<a class="accionAdd" href="BarcosController?action=create">Añadir</a>
			</div>
			<div class="tabla col-sm-12 col-md-12 col-lg-12">
				<table>
					<thead>
						<tr>
							<th class="th">#</th>
							<th class="th">Marca</th>
							<th class="th">Modelo</th>
							<th class="th">Licencia</th>
							<th class="th">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<Barcos> barcos = (ArrayList<Barcos>) request.getAttribute("bar");

						for (int i = 0; i < barcos.size(); i++) {
							Barcos barco = barcos.get(i);
						%>
						<tr>
							<td class="td"><%=barco.getId()%></td>
							<td class="td"><%=barco.getMarca()%></td>
							<td class="td"><%=barco.getModelo()%></td>
							<td class="td"><%=barco.getLicencia()%></td>
							<td class="td"><a class="accionEditar"
								href="BarcosController?action=edit&id=<%=barco.getId()%>">Editar</a>
								<a class="accionEliminar"
								href="BarcosController?action=delete&id=<%=barco.getId()%>">Eliminar</a>
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