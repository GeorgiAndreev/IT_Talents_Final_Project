package com.newssite.model;

public class NewArticle {
	private int id;
	private static int lastId;
	private String title;
	private String text;
	private String mainImage;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public NewArticle(String title, String text) {
		this.title = title;
		this.text = text;
	}
	
	public NewArticle() {
	}
	
	public NewArticle(String title, String text, String mainImage) {
		this.id = lastId++;
		this.title = title;
		this.text = text;
		this.mainImage = mainImage;
	}
}
