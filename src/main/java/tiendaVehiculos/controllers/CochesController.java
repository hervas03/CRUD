package tiendaVehiculos.controllers;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiendaVehiculos.models.Coches;
import tiendaVehiculos.modelsDAO.CochesDAO;
import tiendaVehiculos.modelsDAO.UsuariosDAO;

/**
 * Servlet implementation class CochesController
 */
public class CochesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String acceso;
	String action;

	Coches coche;
	CochesDAO cochesDAO = new CochesDAO();
	RequestDispatcher vista;
	int id;
	String marca, modelo, puertas, precio;

	String index = "coches/index.jsp";
	String create = "coches/create.jsp";
	String edit = "coches/edit.jsp";

	ArrayList<Coches> coches;

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
			coches = cochesDAO.all();
			request.setAttribute("coc", coches);
			acceso = index;
			break;

		case "delete":
			id = Integer.parseInt(request.getParameter("id"));
			cochesDAO.delete(id);
			coches = cochesDAO.all();
			request.setAttribute("coc", coches);
			acceso = index;
			break;

		case "create":
			acceso = create;
			break;

		case "edit":
			id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("coc", cochesDAO.find(id));
			acceso = edit;
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
		acceso = "";
		action = request.getParameter("action");

		switch (action) {
		case "create":
			marca = request.getParameter("marcaNew");
			modelo = request.getParameter("modeloNew");
			puertas = request.getParameter("puertasNew");
			precio = request.getParameter("precioNew");

			coche = new Coches();
			coche.setMarca(marca);
			coche.setModelo(modelo);
			coche.setPuertas(puertas);
			coche.setPrecio(Double.parseDouble(precio));
			cochesDAO.save(coche);
			coches = cochesDAO.all();
			request.setAttribute("coc", coches);
			acceso = index;
			break;

		case "update":
			id = Integer.parseInt(request.getParameter("idEdit"));
			marca = request.getParameter("marcaEdit");
			modelo = request.getParameter("modeloEdit");
			puertas = request.getParameter("puertasEdit");
			precio = request.getParameter("precioEdit");

			coche = new Coches();
			coche.setId(id);
			coche.setMarca(marca);
			coche.setModelo(modelo);
			coche.setPuertas(puertas);
			coche.setPrecio(Double.parseDouble(precio));
			cochesDAO.update(coche);
			coches = cochesDAO.all();
			request.setAttribute("coc", coches);
			acceso = index;
			break;

		default:
			break;
		}

		// Lanzar la vista en funcion del action recibido
		vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);

	}

}
