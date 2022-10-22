package tiendaVehiculos.models;

public class Coches {

	private int id;
	private String marca;
	private String modelo;
	private String puertas;
	private double precio;

	public Coches() {
		super();
	}

	public Coches(int id, String marca, String modelo, String puertas, double precio) {
		super();
		this.id = id;
		this.marca = marca;
		this.modelo = modelo;
		this.puertas = puertas;
		this.precio = precio;
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

	public String getPuertas() {
		return puertas;
	}

	public void setPuertas(String puertas) {
		this.puertas = puertas;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	@Override
	public String toString() {
		return "coches [id=" + id + ", marca=" + marca + ", modelo=" + modelo + ", puertas=" + puertas + ", precio="
				+ precio + "]";
	}

}
