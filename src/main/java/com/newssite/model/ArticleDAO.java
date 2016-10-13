package com.newssite.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

import com.newssite.model.Article;

public class ArticleDAO {
	
private static ArticleDAO instance;
	
	private ArticleDAO(){}
	
	public synchronized static ArticleDAO getInstance(){
		if(instance == null){
			instance = new ArticleDAO();
		}
		return instance;
	}
	
	public Set<Article> getAllArticles(){
		Set<Article> articles = new HashSet<Article>();
		try {
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st.executeQuery("SELECT title, subtitle, article_pohoto, text FROM user.article;");
			while(resultSet.next()){
				articles.add(new Article( resultSet.getString("title"),
									resultSet.getString("subtitle"),
									resultSet.getString("article_photo"),
									resultSet.getString("text")
									));
			}
		} catch (SQLException e) {
			System.out.println("Oops, cannot make statement to add article.");
			return articles;
		}
		System.out.println("Article loaded successfully");
		return articles;
	}
	
	
	public static Article getArticle(String title){
		Article currentArticle= new Article();
		try {
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st.executeQuery("SELECT title, subtitle, article_photo,text "
					+ "FROM user.article where title='"+title+"';");
			while(resultSet.next()){
				currentArticle=new Article(	resultSet.getString("title"),
									resultSet.getString("subtitle"),
									resultSet.getString("article_photo"),
									resultSet.getString("text")
									);
			}
		} catch (SQLException e) {
			System.out.println("Oops, cannot make statement to get article.");
			//return currentUser;
		}
		System.out.println("Article loaded successfully");
		return currentArticle;
	}
	
	public void saveArticle(Article article){
		try {
			PreparedStatement st = DBManager.getInstance().getConnection().prepareStatement("INSERT INTO user.article (title, subtitle, article_photo,text) VALUES (?, ?, ?,?);");
			st.setString(1, article.getTitle());
			st.setString(2, article.getSubtitle());
			st.setString(3, article.getArticlePic());
			st.setString(4, article.getText());
			st.executeUpdate();
			System.out.println("Article added successfully");
		} catch (SQLException e) {
			System.out.println("Oops .. did not save the article");
			e.printStackTrace();
		}
		
	}

}
