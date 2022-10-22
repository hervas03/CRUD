package tiendaVehiculos.config;

import java.sql.*;

public class Conexion {

	Connection conection;
	Statement sentenciaSQL;
	
	public Conexion() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculos", "root", "");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
	}

	public Connection getConnection() {
		return conection;
	}

	public Connection desconectar() {
		conection = null;
		return conection;
	}
	/*
	public Connection abrirConexion() throws SQLException {
		
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			conection = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			System.out.println("ESTADO CONEXION: CONECTADO");
		}
		
		return conection;
		
	}
	*/
	/*
	public Connection cerrarConexion() throws SQLException {
		
		try {
			sentenciaSQL.close();
			conection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			System.out.println("ESTADO CONEXION: DESCONECTADO");
		}
		
		return conection;
		
	}
*/
}
