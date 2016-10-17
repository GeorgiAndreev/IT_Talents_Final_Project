package com.newssite.model;

import java.util.concurrent.ConcurrentHashMap;

public abstract class CommentDAO {
	
	static ConcurrentHashMap<Long, Comment> commentsForNews = new ConcurrentHashMap<Long, Comment>();
	static ConcurrentHashMap<Long, Comment> commentsForQuest = new ConcurrentHashMap<Long, Comment>();
	
	public static void addCommentToNew(Comment comment) {
		commentsForNews.put(comment.getNewId(), comment);
	}
	
	

}
