package com.newssite.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.sound.midi.ControllerEventListener;

public class NewsDownloader implements Runnable{


	private static final int HOURS_IN_ONE_DAY = 24;
	private static final int MINUTES_IN_ONE_HOUR = 60;
	private static final int SECONDS_IN_ONE_MINUTE = 60;
	private static final int ONE_SECOND = 1000;
	private static final int NUMBER_OF_DAYS = 3;
	private static final int LOAD_NEWS_INTERVAL = ONE_SECOND * SECONDS_IN_ONE_MINUTE * MINUTES_IN_ONE_HOUR
			* HOURS_IN_ONE_DAY * NUMBER_OF_DAYS;

	java.sql.Connection connection = DBManager.getInstance().getConnection();

	private static final String INSERT_NEWS_SQL = "INSERT INTO `everydaynews.articles` (`article_id`,`title`,`text`,`article_photo`) VALUES (null, ?, ?, ?)";
	
	private Collection<Article> articles;
	private Collection<New> news;
	private List<String>tags;
	private Connection myConn = null;
	
	public void downloadNewsByTag(String tag) throws Exception{
		this.news.addAll(NewDAO.getNewsByTitle(tag));
	}
	
	public void downloadNewsByTags() throws Exception{
		for(String tag: tags){
		this.news.addAll(NewDAO.getNewsByTitle(tag));
		}
		Collections.shuffle(tags);
	}

	@Override
	public void run() {
		while (true) {
			try {
				Thread.sleep(LOAD_NEWS_INTERVAL);
			} catch (InterruptedException e) {
				// e.printStackTrace();
				return;
			}
			
			myConn = DBManager.getInstance().getConnection();
			
			for(Article article: articles){
				PreparedStatement pstmt;
				try {
					pstmt = myConn.prepareStatement(INSERT_NEWS_SQL, Statement.RETURN_GENERATED_KEYS);
					pstmt.setString(1, article.getTitle());
					pstmt.setString(2, article.getText());
					pstmt.setString(3, article.getArticlePic());
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}
		}
	}
	
}