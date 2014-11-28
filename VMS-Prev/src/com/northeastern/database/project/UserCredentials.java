package com.northeastern.database.project;

public class UserCredentials {

	private String username, password;
	public Boolean valid=true;

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

	public void setValid(boolean b) {
		// TODO Auto-generated method stub
		valid  = b;
	}

	public boolean isValid() {
		// TODO Auto-generated method stub
		return valid;
	}
	
}
