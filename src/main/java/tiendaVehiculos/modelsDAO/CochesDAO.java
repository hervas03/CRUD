package tiendaVehiculos.modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import tiendaVehiculos.config.Conexion;
import tiendaVehiculos.models.Coches;

public class CochesDAO {

	static Conexion conexion = new Conexion();

	static Connection connection;
	static PreparedStatement ps;
	static ResultSet rs;
	static Statement statement;

	static Coches coche = new Coches();
	static ArrayList<Coches> coches = new ArrayList<Coches>();

	String sql;

	public CochesDAO() {
		// TODO Auto-generated constructor stub
	}

	public Coches save(Coches coche) {

		sql = "INSERT INTO coches(marca, modelo, puertas, precio) VALUES ('" + coche.getMarca() + "','"
				+ coche.getModelo() + "','" + coche.getPuertas() + "','" + coche.getPrecio() + "')";

		try {
			connection = conexion.getConnection();
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return coche;

	}

	public boolean delete(int id) {

		sql = "DELETE FROM coches where id = " + id;

		try {
			connection = conexion.getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return true;

	}

	public Coches update(Coches coche) {

		sql = "UPDATE coches SET marca = '" + coche.getMarca() + "', modelo = '" + coche.getModelo() + "', puertas = '"
				+ coche.getPuertas() + "', precio = '" + coche.getPrecio() + "' WHERE id=" + coche.getId();

		try {
			connection = conexion.getConnection();
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return coche;
	}

	public Coches find(int id) {

		sql = "SELECT * FROM coches where id = " + id;

		try {
			connection = conexion.getConnection();
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				coche.setId(rs.getInt("id"));
				coche.setMarca(rs.getString("marca"));
				coche.setModelo(rs.getString("modelo"));
				coche.setPuertas(rs.getString("puertas"));
				coche.setPrecio(rs.getInt("precio"));

				return coche;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Coches> all() {

		sql = "SELECT * FROM coches";
		coches = new ArrayList<Coches>();

		try {
			connection = conexion.getConnection();
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				coche = new Coches();
				coche.setId(rs.getInt("id"));
				coche.setMarca(rs.getString("marca"));
				coche.setModelo(rs.getString("modelo"));
				coche.setPuertas(rs.getString("puertas"));
				coche.setPrecio(rs.getDouble("precio"));
				coches.add(coche);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return coches;
	}

}
