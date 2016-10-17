package com.newssite.model;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.newssite.model.ArticleDAO;

public class ArticleManager {
	

		private ConcurrentHashMap<String, Article> allArticles;//username -> user
		private static ArticleManager instance;
		private ArticleManager(){
			allArticles = new ConcurrentHashMap<String, Article>();
			for(Article u : ArticleDAO.getInstance().getAllArticles()){
				allArticles.put(u.getTitle(), u);
			}
		}
		
		public Article getArticle(String title){
			return allArticles.get(title);
		}
		
		public synchronized static ArticleManager getInstance(){
			if(instance == null){
				instance = new ArticleManager();
			}
			return instance;
		}
		
		
		public void createArticle(String title, String subtitle, String articlePic,String text,int user_id,String category){
			Article article = new Article(title, subtitle, articlePic, text);
			article.setUser_id(user_id);
			article.setCategory(category);
			allArticles.put(title, article);
			ArticleDAO.getInstance().saveArticle(article);
		}
		
		public Map<String, Article> getAllArticles(){
			return Collections.unmodifiableMap(allArticles);
		}
	}



