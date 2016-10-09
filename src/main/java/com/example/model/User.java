package model;

import java.io.InputStream;

public class User {

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

	@Override
	public String toString() {
		return "User [username=" + username + ", name=" + name + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", profilePic=" + profilePic + "]";
	}
	
	
	
}
