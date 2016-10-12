package com.newssite.model;

import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.newssite.model.UserDAO;

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
	
	public void regUser(String username, String name, String password, String address, String email, String profilePic){
		User user = new User(username, name, password, email, address, profilePic);
		registerredUsers.put(username, user);
		UserDAO.getInstance().saveUser(user);
	}
	
	public Map<String, User> getAllUsers(){
		return Collections.unmodifiableMap(registerredUsers);
	}
}
