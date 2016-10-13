package com.newssite.model;

import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User {

	private static final int MIN_PASSWORD_SIZE = 6;
	private static final int MIN_USERNAME_SIZE = 4;
	private String username;
	private String name;
	private String password;
	private String email;
	private String address;
	private String profilePic;//file name of the profile pic on server dir
	
	public User(String username, String name, String password, String email, String address, String profilePic) {
		this.username = username;
		this.name = name;
		this.password = password;
		this.email = email;
		this.address = address;
		this.profilePic = profilePic;
	}
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}
	
	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}
	
	public String getProfilePic() {
		return profilePic;
	}
	
	private static boolean isValidPassword(String password) {
		if (password != null && password.length() >= MIN_PASSWORD_SIZE && !password.matches("[^A-Z]+")
				&& !password.matches("[^a-z]+") && !password.matches("[^0-9]+")) {
			return true;
		}
		return false;
	}
	
	private static boolean isValidEmail(String email) {
		if (email == null) {
			return false;
		}
		String emailPattern = "^[\\w!#$%&’*+/=?`{|}~^-]+(?:\\.[\\w!#$%&’*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
		Pattern p = Pattern.compile(emailPattern);
		Matcher m = p.matcher(email);
		return m.matches();
	}


	private static boolean isValidUsername(String username) {

		if (username != null && username.length() >= MIN_USERNAME_SIZE && username.matches("[A-Za-z0-9]+")) {
			return true;
		}
		return false;
	}

	private static boolean isValidName(String name) {
		if (name != null && name.matches("[A-Za-z]+")) {
			return true;
		}
		return false;
	}
	
	public static boolean isValidateAddress(String address) {
		if (address == null) {
			return false;
		}
		Pattern pattern = Pattern.compile(new String("^[a-zA-Z0-9\\s]*$"));
		Matcher matcher = pattern.matcher(address);
		return matcher.matches();
	}
	
	public static boolean isValidUser(String username,String name, String password, String email, String address){
		if(User.isValidUsername(username)==true && User.isValidName(name)==true && User.isValidPassword(password)==true &&
				User.isValidEmail(email)==true && User.isValidateAddress(address)==true){
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", name=" + name + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", profilePic=" + profilePic + "]";
	}
	
	
	
}
