package entities;

public class Place {
	private int id;
	private int numero;
	private String etat;
	private String type;
	private int section;
	public Place()
	{
		
	}

	public Place(int id, int numero, String etat, String type, int section) {
		super();
		this.id = id;
		this.numero = numero;
		this.etat = etat;
		this.type = type;
		this.section = section;
	}

	public Place(int numero, String etat, String type, int section) {
		super();
		this.numero = numero;
		this.etat = etat;
		this.type = type;
		this.section = section;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	@Override
	public String toString() {
		return "Place [id=" + id + ", numero=" + numero + ", etat=" + etat + ", type=" + type + ", section=" + section
				+ "]";
	}

}
