package com.newssite.model;

public class Comment {
	
	private String text;
	private int numberOfLikes;
	private Long userId;
	private Long newId;
	private Long questId;
	
	public Comment(String text, Long userId, Long newId) {
		this.text = text;
		this.userId = userId;
		this.newId = newId;
	}

	public String getText() {
		return text;
	}

	public int getNumberOfLikes() {
		return numberOfLikes;
	}

	public Long getUserId() {
		return userId;
	}

	public Long getNewId() {
		return newId;
	}

	public Long getQuestId() {
		return questId;
	}
	
	
	
}