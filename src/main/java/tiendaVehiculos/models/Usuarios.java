package tiendaVehiculos.models;

public class Usuarios {

	int id;
	String nombre;
	String mail;
	String password;

	public Usuarios() {
		super();
	}

	public Usuarios(int id, String nombre, String mail, String password) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.mail = mail;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
