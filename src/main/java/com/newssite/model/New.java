package com.newssite.model;

public class New {
	private int id;
	private static int lastId;
	private String title;
	private int year;
	private String genre;
	private String actors;
	private String plot;
	private String posterURL;
	private String[] actorsArray;
	private String text;
	private String mainImage;
	
	public String[] getActorsArray() {
		return actorsArray;
	}
	public void setActorsArray(String[] actorsArray) {
		this.actorsArray = actorsArray;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getPosterURL() {
		return posterURL;
	}
	public void setPosterURL(String posterURL) {
		this.posterURL = posterURL;
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
	public New(String title, int year, String genre, String actors, String plot, String posterURL) {
		this.title = title;
		this.year = year;
		this.genre = genre;
		this.actors = actors;
		this.plot = plot;
		this.posterURL = posterURL;
		this.actorsArray = actors.split(",");
	}
	public New(String title, String text) {
		this.title = title;
		this.text = text;
	}
	public New() {
	}
	public New(String title, String text, String mainImage) {
		this.id = lastId++;
		this.title = title;
		this.text = text;
		this.mainImage = mainImage;
	}
}
