package mailClient;


public class User {

	private String base64Name = "";
	private String base64Pass = ""; // �����û���½

	public void setNameAndPass(String name, String pass) {
		this.base64Name = name;
		this.base64Pass = pass;
	}

	public String getBase64Name() {
		return base64Name;
	}

	public String getBase64Pass() {
		return base64Pass;
	}

}