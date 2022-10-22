package tiendaVehiculos.modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import tiendaVehiculos.config.Conexion;
import tiendaVehiculos.models.Usuarios;

public class UsuariosDAO {

	Conexion conexion = new Conexion();

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	Statement statement;

	Usuarios usuario = new Usuarios();
	ArrayList<Usuarios> usuarios = new ArrayList<Usuarios>();

	public UsuariosDAO() {
		super();
	}

	public ArrayList<Usuarios> all() {

		String sql = "SELECT * FROM usuarios";
		usuarios = new ArrayList<Usuarios>();

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				usuario = new Usuarios();
				usuario.setId(rs.getInt("idusuarios"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setMail(rs.getString("mail"));
				usuario.setPassword(rs.getString("password"));
				usuarios.add(usuario);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return usuarios;
	}

	public Usuarios insertarUsuario(Usuarios usuario) {

		String sql = "INSERT INTO usuarios(nombre, mail, password) VALUES ('" + usuario.getNombre() + "','"
				+ usuario.getMail() + "','" + usuario.getPassword() + "')";

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return usuario;
	}

	public Usuarios getUser(String mail, String password) {

		String sql = "SELECT * FROM usuarios WHERE mail = '" + mail + "' AND password = '" + password + "'";

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				usuario.setId(rs.getInt("idusuarios"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setMail(rs.getString("mail"));
				usuario.setPassword(rs.getString("password"));

				return usuario;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return null;
	}

	public boolean validarRegistro(String mail, String password) {

		String sql = "SELECT * FROM usuarios WHERE mail = '" + mail + "' AND password = '" + password + "'";

		try {
			conn = conexion.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return false;
	}

}
