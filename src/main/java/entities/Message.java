package entities;

public class Message {
	private String content;
	private String type;
	private String cssClasse;
	
	public Message(String content, String type, String cssClasse) {
		super();
		this.content = content;
		this.type = type;
		this.cssClasse = cssClasse;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCssClasse() {
		return cssClasse;
	}

	public void setCssClasse(String cssClasse) {
		this.cssClasse = cssClasse;
	}
	
	
}
