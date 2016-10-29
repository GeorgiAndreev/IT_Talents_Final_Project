package com.newssite.model;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.tomcat.jni.File;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;

public class NewArticleDAO {
	
	public static ArrayList<New> allNews = new ArrayList<New>();
	public static ArrayList<New> allNewsFromFile = new ArrayList<New>();
	
	public static ArrayList<Article> allSportNews = new ArrayList<Article>();
	
	public ArrayList<Article> getAllArticlesByCategory(String category){
		ArrayList<Article> articles = new ArrayList<Article>();
		try {
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st.executeQuery(
			"SELECT article_id,title, subtitle, article_photo, text FROM everydaynews.article where categories='"+category+"';");
			while(resultSet.next()){
				int id= resultSet.getInt("article_id");
				Article article= new Article(resultSet.getString("title"),
						resultSet.getString("subtitle"),
						resultSet.getString("article_photo"),
						resultSet.getString("text")
						);
				article.setId(id);
				articles.add(article);
				allSportNews.add(article);
			}
		} catch (SQLException e) {
			System.out.println("Oops, cannot make statement to get all articles.");
			return articles;
		}
		System.out.println("Article loaded successfully");
		return articles;
	}
	
	public ArrayList<New> getNewsFromFile(){
		ArrayList<New> news = new ArrayList<New>();
		JsonParser parser = new JsonParser();
		 
        try {
 
            Object obj = parser.parse(new FileReader("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt"));
        	//Object obj = parser.parse(new FileReader("C:/Users/Maria/workspace/news/NewssiteProject/src/main/webapp/static/json/file2.txt"));
            JsonObject jsonObject = (JsonObject) obj;
 
	
					       JsonArray posts = jsonObject.getAsJsonArray("posts");
					   
					       
					       int count = 0;
					for (Iterator<JsonElement> it = posts.iterator(); it.hasNext();) {
						count++;
						JsonObject jsonNew = (JsonObject) it.next();
						JsonObject thread = null;
						//String mainImage ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjGW1qX3FXUjoOwjYHIJNL67GsNHFilGjbHao_iA5LQDZqUbM";
						String mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";
						
						if (jsonNew.get("thread")!=null) {
							thread = (jsonNew.get("thread")).getAsJsonObject();
							if (!thread.get("main_image").isJsonNull()) {
								mainImage = (thread.get("main_image")).getAsString();
								if(mainImage.equals("")){
									mainImage ="https://s4.postimg.org/f4u1w2b7x/news.png";
								}
								//mainImage = (thread.get("title_full")).getAsString();
							}
						}
						if (mainImage.equals("")) {
							//mainImage = "${pageContext.request.contextPath}/images/sport-news-default.jpg";
						}
						if (count>10) {
							
						}
						//news.add(new New(jsonNew.get("title").getAsString(), jsonNew.get("text").getAsString(), jsonNew.get("main_image").getAsString()));
						if (jsonNew.get("title").getAsString().length() > 10 && jsonNew.get("text").getAsString().length() > 10) {
							System.out.println(jsonNew.get("title").getAsString());
							System.out.println();
							allNewsFromFile.add(new New(jsonNew.get("title").getAsString(), jsonNew.get("text").getAsString(), mainImage));
						}
	
						
					}
		
					return allNewsFromFile;
        } catch(Exception e){
        	
        }
       return null;
	}

	public List<New> getNewsByTitle(String query) throws Exception {
		ArrayList<New> news = new ArrayList<New>();
		HttpURLConnection connection = null;
		query = query.replace(' ', '+');
		try {
			connection = (HttpURLConnection) new URL("https://webhose.io/search?token=8717bcce-e4bc-408b-9067-a021896e8d75&format=json&q=" + query +"%20language%3A(english)")
													.openConnection();

			connection.connect();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				 
				    //JsonElement root = jp.parse(new InputStreamReader((InputStream) request.getContent())); //Convert the input stream to a json element
				  
				
				try (BufferedInputStream bis = new BufferedInputStream(connection.getInputStream())) {
					JsonParser jp = new JsonParser(); //from gson
					InputStreamReader isr = new InputStreamReader (bis, "UTF-8");
					JsonElement root = jp.parse(isr);
					  JsonObject result = root.getAsJsonObject();
					  
					//byte[] bytes = new byte[connection.getContentLength()];
					//byte[] bytes = new byte[10000];
					//bis.read(bytes);
					 
					  ByteArrayOutputStream buf = new ByteArrayOutputStream();
					  int result1 = bis.read();
					  while(result1 != -1) {
					      buf.write((byte) result1);
					      result1 = bis.read();
					  }
					  String text = buf.toString();
					
					
					
					
					
					//  JsonObject result = (JsonObject) new JsonParser().parse(json);
					System.out.println(result);
					       JsonArray posts = result.getAsJsonArray("posts");
					      // posts.size();
					//JsonObject jsonNew1 = (JsonObject)posts.get(0);
					       
					       int count = 0;
					for (Iterator<JsonElement> it = posts.iterator(); it.hasNext();) {
						count++;
						JsonObject jsonNew = (JsonObject) it.next();
						JsonObject thread = null;
						//String mainImage ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjGW1qX3FXUjoOwjYHIJNL67GsNHFilGjbHao_iA5LQDZqUbM";
						String mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";
						
						if (jsonNew.get("thread")!=null) {
							thread = (jsonNew.get("thread")).getAsJsonObject();
							if (!thread.get("main_image").isJsonNull()) {
								mainImage = (thread.get("main_image")).getAsString();
								if(mainImage.equals("")){
									mainImage ="https://s4.postimg.org/f4u1w2b7x/news.png";
								}
								//mainImage = (thread.get("title_full")).getAsString();
							}
						}
						if (mainImage.equals("")) {
							//mainImage = "${pageContext.request.contextPath}/images/sport-news-default.jpg";
						}
						if (count>10) {
							
						}
						//news.add(new New(jsonNew.get("title").getAsString(), jsonNew.get("text").getAsString(), jsonNew.get("main_image").getAsString()));
						if (jsonNew.get("title").getAsString().length() > 10 && jsonNew.get("text").getAsString().length() > 10) {
							allNews.add(new New(jsonNew.get("title").getAsString(), jsonNew.get("text").getAsString(), mainImage));
						}
	
						
					}

					return allNews;
					
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		} finally {
			connection.disconnect();
		}
		return null;
	}
	
	
}
