package com.newssite.model;

import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.newssite.model.UserDAO;
import com.newssite.model.User;

public class UsersManager {

	private ConcurrentHashMap<String, User> registerredUsers;
	private static UsersManager instance;
	private UsersManager(){
		registerredUsers = new ConcurrentHashMap<String, User>();
		for(User u : UserDAO.getInstance().getAllUsers()){
			registerredUsers.put(u.getUsername(), u);
		}
	}
	
	public User getUser(String username){
		return registerredUsers.get(username);
	}
	
	public String MD5(String md5) {
		   try {
		        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
		        byte[] array = md.digest(md5.getBytes());
		        StringBuffer sb = new StringBuffer();
		        for (int i = 0; i < array.length; ++i) {
		          sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
		       }
		        return sb.toString();
		    } catch (java.security.NoSuchAlgorithmException e) {
		    }
		    return null;
		}
	
	public boolean hasUser(String username, String password) {
		String password2=MD5(password);
		if (registerredUsers != null) {
			if (registerredUsers.containsKey(username)) {
				if (registerredUsers.get(username).getPassword().equals((password2))) {
					return true;
				}
			}
		} else {
			System.out.println("No users");
		}
		return false;
	}
	
	public synchronized static UsersManager getInstance(){
		if(instance == null){
			instance = new UsersManager();
		}
		return instance;
	}
	
	public boolean validLogin(String username, String password){
		if(!registerredUsers.containsKey(username)){
			return false;
		}
		return registerredUsers.get(username).getPassword().equals(password);
	}
	
	public void regUser(String username, String first_name,String last_name, String password, String address, String email, String profilePic){
		if(User.isValidUser(username, first_name,last_name, password, email, address)){
		User user = new User(username, first_name,last_name, password, email, address, profilePic);
		registerredUsers.put(username, user);
		UserDAO.getInstance().saveUser(user);
		}
	}
	
	public Map<String, User> getAllUsers(){
		return Collections.unmodifiableMap(registerredUsers);
	}
}
