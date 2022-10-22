package tiendaVehiculos.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiendaVehiculos.models.Barcos;
import tiendaVehiculos.models.Coches;
import tiendaVehiculos.modelsDAO.BarcosDAO;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class BarcosController
 */
public class BarcosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String acceso;
	String action;

	Barcos barco;
	BarcosDAO barcosDAO = new BarcosDAO();

	int id;
	String marca, modelo, licencia;

	String index = "barcos/index.jsp";
	String create = "barcos/create.jsp";
	String edit = "barcos/edit.jsp";

	ArrayList<Barcos> barcos;

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
			barcos = barcosDAO.all();
			request.setAttribute("bar", barcos);
			acceso = index;
			break;
			
		case "delete":
			id = Integer.parseInt(request.getParameter("id"));
			barcosDAO.delete(id);
			barcos = barcosDAO.all();
			request.setAttribute("bar", barcos);
			acceso = index;
			break;

		case "create":
			acceso = create;
			break;

		case "edit":
			id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("bar", barcosDAO.find(id));
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
			licencia = request.getParameter("licenciaNew");

			barco = new Barcos();
			barco.setMarca(marca);
			barco.setModelo(modelo);
			barco.setLicencia(licencia);
			barcosDAO.save(barco);
			barcos = barcosDAO.all();
			request.setAttribute("bar", barcos);
			acceso = index;
			break;
			
		case "update":
			id = Integer.parseInt(request.getParameter("idEdit"));
			marca = request.getParameter("marcaEdit");
			modelo = request.getParameter("modeloEdit");
			licencia = request.getParameter("licenciaEdit");
			
			barco = new Barcos();	
			barco.setId(id);
			barco.setMarca(marca);
			barco.setModelo(modelo);
			barco.setLicencia(licencia);
			barcosDAO.update(barco);
			barcos = barcosDAO.all();
			request.setAttribute("bar", barcos);
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
