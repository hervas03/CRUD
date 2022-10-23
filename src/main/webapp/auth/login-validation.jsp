<%@page import="tiendaVehiculos.models.Usuarios"%>
<%
//restriccion de todo aquel que intente entrar en la parte de administracion de la pagina
if (request.getSession().getAttribute("usuario") != null) {
	//Usuarios u = (Usuarios) request.getSession().getAttribute("usuario");
	//out.println("USUARIO LOGUEADO : " + u.getNombre());
	//System.out.println("USUARIO LOGUEADO : " + u.getNombre());
} else {
	//Redirigir al login para introducir credenciales
	response.sendRedirect("menuController?action=login");
}
%>