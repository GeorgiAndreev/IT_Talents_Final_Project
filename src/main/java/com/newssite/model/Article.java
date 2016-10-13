package com.newssite.model;

public class Article {
	
	private String title;
	private String subtitle;
	private String articlePic;
	private String text;
	private int user_id;
	
	public Article(){
		
	}
	
	public Article(String title, String subtitle, String articlePic,String text) {
		this.title = title;
		this.subtitle = subtitle;
		this.articlePic = articlePic;
		this.text=text;
	}

	public String getTitle() {
		return title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public String getArticlePic() {
		return articlePic;
	}

	public int getUser_id() {
		return user_id;
	}
	
	public String getText() {
		return text;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	

}
