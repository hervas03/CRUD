<%@page import="tiendaVehiculos.models.Usuarios"%>
<%
	if(request.getSession().getAttribute("usuario")!= null){
		//Usuarios u = (Usuarios) request.getSession().getAttribute("usuario");
		//out.println("USUARIO LOGUEADO : " + u.getNombre());
		//System.out.println("USUARIO LOGUEADO : " + u.getNombre());
	}else{
		//Redirigir al login para introducir credenciales
		response.sendRedirect("menuController?action=login");
	}
%>