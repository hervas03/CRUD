package tiendaVehiculos.modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import tiendaVehiculos.config.Conexion;
import tiendaVehiculos.models.Barcos;

public class BarcosDAO {

	Conexion conexion = new Conexion();

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	Statement statement;
	int resultSet;

	Barcos barco = new Barcos();
	ArrayList<Barcos> barcos = new ArrayList<Barcos>();

	public BarcosDAO() {
		// TODO Auto-generated constructor stub
	}

	public Barcos save(Barcos barco) {
		/*
		 * try { conexion.abrirConexion();
		 * System.out.println("ESTADO CONEXION INSERTAR BARCO: CONECTADO"); statement =
		 * conn.createStatement(); String sql =
		 * "INSERT INTO barcos(marca, modelo, licencia) VALUES ('" + barco.getMarca() +
		 * "','" + barco.getModelo() + "','" + barco.getLicencia() + "')";
		 * 
		 * resultSet = statement.executeUpdate(sql);
		 * System.out.println("Barcos insertados");
		 * 
		 * } catch (Exception e) { // TODO: handle exception e.printStackTrace(); }
		 * finally { try { conexion.cerrarConexion();
		 * System.out.println("ESTADO CONEXION INSERTAR BARCO: DESCONECTADO"); } catch
		 * (Exception e) { // TODO: handle exception System.out.println("ERROR"); }
		 * 
		 * }
		 */

		String sql = "INSERT INTO barcos(marca, modelo, licencia) VALUES ('" + barco.getMarca() + "','"
				+ barco.getModelo() + "','" + barco.getLicencia() + "')";

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) { // TODO: handle exception
			e.printStackTrace();
		}

		return barco;

	}

	public boolean delete(int id) {

		String sql = "DELETE FROM barcos where id = " + id;

		try {
			conn = conexion.getConnection();
			statement = conn.createStatement();
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return true;

	}

	public Barcos update(Barcos barco) {

		String sql = "UPDATE barcos SET marca = '" + barco.getMarca() + "', modelo = '" + barco.getModelo()
				+ "', licencia = '" + barco.getLicencia() + "' WHERE id=" + barco.getId();

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return barco;
	}

	public Barcos find(int id) {

		String sql = "SELECT * FROM barcos where id = " + id;

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				barco.setId(rs.getInt("id"));
				barco.setMarca(rs.getString("marca"));
				barco.setModelo(rs.getString("modelo"));
				barco.setLicencia(rs.getString("licencia"));

				return barco;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Barcos> all() {
		/*
		 * try { conn = conexion.abrirConexion(); statement = conn.createStatement();
		 * String sql = "SELECT * FROM barcos"; rs = statement.executeQuery(sql);
		 * 
		 * while(rs.next()) { barco = new Barcos(); barco.setId(rs.getInt("id"));
		 * barco.setMarca(rs.getString("marca"));
		 * barco.setModelo(rs.getString("modelo"));
		 * barco.setLicencia(rs.getString("licencia")); barcos.add(barco); }
		 * 
		 * } catch (SQLException e) { // TODO Auto-generated catch block
		 * System.out.println("ERROR ALL"); e.printStackTrace(); } finally { try {
		 * conexion.cerrarConexion(); } catch (SQLException ex) {
		 * System.out.println("ERROR CERRAR CONEXION"); } }
		 */
		String sql = "SELECT * FROM barcos";
		barcos = new ArrayList<Barcos>();

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				barco = new Barcos();
				barco.setId(rs.getInt("id"));
				barco.setMarca(rs.getString("marca"));
				barco.setModelo(rs.getString("modelo"));
				barco.setLicencia(rs.getString("licencia"));
				barcos.add(barco);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return barcos;
	}

}
