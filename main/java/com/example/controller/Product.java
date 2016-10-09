package com.example.controller;

public class Product {
	@Override
	public String toString() {
		return "Product [name=" + name + ", quantity=" + quantity + "]";
	}
	private String name;
	private int quantity;
	
	
	public Product(String name, int quantity) {
		this.name = name;
		this.quantity = quantity;
	}
	
	public Product() {
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
