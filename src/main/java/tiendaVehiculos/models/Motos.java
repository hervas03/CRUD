package tiendaVehiculos.models;

public class Motos {

	private int id;
	private String marca;
	private String modelo;
	private String caballos;

	public Motos() {
		super();
	}

	public Motos(int id, String marca, String modelo, String caballos) {
		super();
		this.id = id;
		this.marca = marca;
		this.modelo = modelo;
		this.caballos = caballos;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getCaballos() {
		return caballos;
	}

	public void setCaballos(String caballos) {
		this.caballos = caballos;
	}

	@Override
	public String toString() {
		return "motos [id=" + id + ", marca=" + marca + ", modelo=" + modelo + ", caballos=" + caballos + "]";
	}

}
