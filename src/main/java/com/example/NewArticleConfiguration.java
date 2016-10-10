package com.example;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.example.model.NewArticle;
import com.example.model.NewArticleDAO;

@Configuration
public class NewArticleConfiguration {
	
	@Bean
	public NewArticleDAO newArticleDAO() {
		return new NewArticleDAO();
	}
	
	@Bean
	public NewArticle newArticle() {
		return new NewArticle();
	}
}
