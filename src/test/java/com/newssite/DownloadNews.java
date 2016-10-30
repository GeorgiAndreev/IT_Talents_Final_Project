package com.newssite;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.BeansException;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.newssite.model.NewArticleDAO;

public class DownloadNews {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws BeansException, Exception {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(NewArticleConfiguration.class);
		context.getBean(NewArticleDAO.class).downloadNewsForAllCategories();
		context.close();
	}

}
