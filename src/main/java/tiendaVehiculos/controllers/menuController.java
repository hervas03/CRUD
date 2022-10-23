package tiendaVehiculos.controllers;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiendaVehiculos.models.Usuarios;
import tiendaVehiculos.modelsDAO.UsuariosDAO;

public class menuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String acceso;
	String action;

	Usuarios usuario;
	UsuariosDAO usuariosDAO = new UsuariosDAO();

	String login = "auth/login.jsp";
	String register = "auth/register.jsp";
	String index = "index.jsp";
	RequestDispatcher vista;
	String nombre, mail, password;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		acceso = "";
		action = request.getParameter("action");

		switch (action) {
		case "login":
			acceso = login;
			break;
		case "register":
			acceso = register;
			break;
		case "index":
			acceso = index;
			break;
		case "logout":
			request.getSession().removeAttribute("usuario");
			acceso = index;
			break;

		default:
			break;
		}
		vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		action = request.getParameter("action");

		switch (action) {
		case "login":
			mail = request.getParameter("mail");
			password = request.getParameter("password");
			if (usuariosDAO.validarRegistro(mail, getMD5(password))) {
				request.getSession().setAttribute("usuario", usuariosDAO.getUser(mail, getMD5(password)));
				Usuarios u = (Usuarios) request.getSession().getAttribute("usuario");
				System.out.println(u.getMail());
				ArrayList<Usuarios> usuarios = usuariosDAO.all();
				request.getSession().setAttribute("usuarios", usuarios);
				acceso = index;
			} else {
				acceso = login;
			}

			break;
		case "register":
			nombre = request.getParameter("nombreRegistro");
			mail = request.getParameter("mailRegistro");
			password = request.getParameter("passwordRegistro");

			usuario = new Usuarios();
			usuario.setNombre(nombre);
			usuario.setMail(mail);
			usuario.setPassword(getMD5(password));

			usuariosDAO.insertarUsuario(usuario);

			if (usuariosDAO.validarRegistro(mail, getMD5(password))) {
				request.getSession().setAttribute("usuario", usuariosDAO.getUser(mail, getMD5(password)));
				Usuarios u = (Usuarios) request.getSession().getAttribute("usuario");
				System.out.println(u.getMail());
				ArrayList<Usuarios> usuarios = usuariosDAO.all();
				request.getSession().setAttribute("usuarios", usuarios);
				acceso = index;
			} else {
				acceso = register;
			}

			break;

		default:
			break;
		}

		vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);
	}

	public String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] encBytes = md.digest(input.getBytes());
			BigInteger numero = new BigInteger(1, encBytes);
			String encString = numero.toString(16);
			while (encString.length() < 32) {
				encString = "0" + encString;
			}
			return encString;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
