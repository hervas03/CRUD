package tiendaVehiculos.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiendaVehiculos.config.Conexion;
import tiendaVehiculos.models.Coches;
import tiendaVehiculos.models.Motos;
import tiendaVehiculos.modelsDAO.CochesDAO;
import tiendaVehiculos.modelsDAO.MotosDAO;

/**
 * Servlet implementation class MotosController
 */
public class MotosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	Conexion conexion = new Conexion();
	Connection conn;
	 
	String acceso;
	String action;

	Motos moto;
	MotosDAO motosDAO = new MotosDAO();

	int id;
	String marca, modelo, caballos;

	String index = "motos/index.jsp";
	String create = "motos/create.jsp";
	String edit = "motos/edit.jsp";

	ArrayList<Motos> motos;

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
		case "index":
			motos = motosDAO.all();
			request.setAttribute("mot", motos);
			acceso = index;
			break;
		case "delete":
			id = Integer.parseInt(request.getParameter("id"));
			motosDAO.delete(id);
			motos = motosDAO.all();
			request.setAttribute("mot", motos);
			acceso = index;
			break;
		case "create":
			acceso = create;
			break;

		case "edit":
			id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("mot", motosDAO.find(id));
			acceso = edit;
			break;
		default:
			break;
		}

		RequestDispatcher vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		acceso = "";
		action = request.getParameter("action");


		switch (action) {
		case "create":
			marca = request.getParameter("marcaNew");
			modelo = request.getParameter("modeloNew");
			caballos = request.getParameter("caballosNew");

			moto = new Motos();
			moto.setMarca(marca);
			moto.setModelo(modelo);
			moto.setCaballos(caballos);
			motosDAO.save(moto);
			motos = motosDAO.all();
			request.setAttribute("mot", motos);
			acceso = index;
			break;
			
		case "update":
			id = Integer.parseInt(request.getParameter("idEdit"));
			marca = request.getParameter("marcaEdit");
			modelo = request.getParameter("modeloEdit");
			caballos = request.getParameter("caballosEdit");
			
			moto = new Motos();	
			moto.setId(id);
			moto.setMarca(marca);
			moto.setModelo(modelo);
			moto.setCaballos(caballos);
			motosDAO.update(moto);

			motos = motosDAO.all();
			request.setAttribute("mot", motos);
			acceso = index;
			break;
			
		default:
			break;
		}

		// Lanzar la vista en funcion del action recibido
		RequestDispatcher vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);

	}

}
