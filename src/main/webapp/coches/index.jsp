<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="tiendaVehiculos.modelsDAO.CochesDAO"%>
<%@ page import="tiendaVehiculos.models.Coches"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="/auth/login-validation.jsp"%>
<!DOCTYPE html>
<html class="htmlFondo">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COCHES | index</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
	Cookie cookie = new Cookie("Tipo_vehiculo", "Coches");

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
						sesi�n</a>
					<%
					} else {
					%><a href="menuController?action=login" class="Registro">Iniciar
						sesi�n / Registrarse</a>
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
				Coches</div>
			<div class="anadir col-sm-12 col-md-6 col-lg-6">
				<a class="accionAdd" href="CochesController?action=create">A�adir</a>
			</div>
			<div class="tabla col-sm-12 col-md-12 col-lg-12">
				<table>
					<thead>
						<tr>
							<th class="th">#</th>
							<th class="th">Marca</th>
							<th class="th">Modelo</th>
							<th class="th">Puertas</th>
							<th class="th">Precio</th>
							<th class="th">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<Coches> coches = (ArrayList<Coches>) request.getAttribute("coc");

						for (int i = 0; i < coches.size(); i++) {
							Coches coche = coches.get(i);
						%>
						<tr>
							<td class="td"><%=coche.getId()%></td>
							<td class="td"><%=coche.getMarca()%></td>
							<td class="td"><%=coche.getModelo()%></td>
							<td class="td"><%=coche.getPuertas()%></td>
							<td class="td"><%=coche.getPrecio()%></td>
							<td class="td"><a class="accionEditar"
								href="CochesController?action=edit&id=<%=coche.getId()%>">Editar</a>
								<a class="accionEliminar"
								href="CochesController?action=delete&id=<%=coche.getId()%>">Eliminar</a></td>
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