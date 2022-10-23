package tiendaVehiculos.modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import tiendaVehiculos.config.Conexion;
import tiendaVehiculos.models.Coches;
import tiendaVehiculos.models.Motos;

public class MotosDAO {

	static Conexion conexion = new Conexion();

	static Connection conn;
	static PreparedStatement ps;
	static ResultSet rs;
	static Statement statement;

	static Motos moto = new Motos();
	static ArrayList<Motos> motos = new ArrayList<Motos>();

	String sql;

	public MotosDAO() {
		// TODO Auto-generated constructor stub
	}

	public Motos save(Motos moto) {

		sql = "INSERT INTO motos(marca, modelo, caballos) VALUES ('" + moto.getMarca() + "','" + moto.getModelo()
				+ "','" + moto.getCaballos() + "')";

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return moto;

	}

	public boolean delete(int id) {

		sql = "DELETE FROM motos where id = " + id;

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

	public Motos update(Motos moto) {

		sql = "UPDATE motos SET marca = '" + moto.getMarca() + "', modelo = '" + moto.getModelo() + "', caballos = '"
				+ moto.getCaballos() + "' WHERE id=" + moto.getId();

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return moto;
	}

	public Motos find(int id) {

		sql = "SELECT * FROM motos where id = " + id;

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				moto.setId(rs.getInt("id"));
				moto.setMarca(rs.getString("marca"));
				moto.setModelo(rs.getString("modelo"));
				moto.setCaballos(rs.getString("caballos"));

				return moto;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Motos> all() {

		sql = "SELECT * FROM motos";
		motos = new ArrayList<Motos>();

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				moto = new Motos();
				moto.setId(rs.getInt("id"));
				moto.setMarca(rs.getString("marca"));
				moto.setModelo(rs.getString("modelo"));
				moto.setCaballos(rs.getString("caballos"));
				motos.add(moto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return motos;
	}

}
