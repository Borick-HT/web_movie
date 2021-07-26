package edu.poly.domain;

public class ChangePassword {
	private String username;
	private String password;
	private String confirmpassword;
	private String currentpassword;

	public ChangePassword() {
	}

	public ChangePassword(String username, String password, String confirmpassword, String currentpassword) {
		this.username = username;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.currentpassword = currentpassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getCurrentpassword() {
		return currentpassword;
	}

	public void setCurrentpassword(String currentpassword) {
		this.currentpassword = currentpassword;
	}

}
