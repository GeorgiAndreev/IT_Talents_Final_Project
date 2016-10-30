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
import java.sql.Connection;
import java.sql.PreparedStatement;
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

	private static final String INSERT_NEWS_SQL = "INSERT INTO `article_from_api` (`article_from_api_id`,`title`,`text`,`article_photo`) VALUES (null, ?, ?, ?)";

	public ArrayList<Article> getAllArticlesByCategory(String category) {
		ArrayList<Article> articles = new ArrayList<Article>();
		try {
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st.executeQuery(
					"SELECT article_id,title, subtitle, article_photo, text FROM everydaynews.article_from_api where categories='"
							+ category + "';");
			while (resultSet.next()) {
				int id = resultSet.getInt("article_id");
				Article article = new Article(resultSet.getString("title"), resultSet.getString("subtitle"),
						resultSet.getString("article_photo"), resultSet.getString("text"));
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

	public ArrayList<New> getNewsFromFile() {
		ArrayList<New> news = new ArrayList<New>();
		JsonParser parser = new JsonParser();

		try {

			Object obj = parser.parse(new FileReader("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt"));
			// FileReader("C:/Users/Maria/workspace/news/NewssiteProject/src/main/webapp/static/json/file2.txt"));
			JsonObject jsonObject = (JsonObject) obj;

			JsonArray posts = jsonObject.getAsJsonArray("posts");

			int count = 0;
			for (Iterator<JsonElement> it = posts.iterator(); it.hasNext();) {
				count++;
				JsonObject jsonNew = (JsonObject) it.next();
				JsonObject thread = null;
				String mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";

				if (jsonNew.get("thread") != null) {
					thread = (jsonNew.get("thread")).getAsJsonObject();
					if (!thread.get("main_image").isJsonNull()) {
						mainImage = (thread.get("main_image")).getAsString();
						if (mainImage.equals("")) {
							mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";
						}
					}
				}
				if (jsonNew.get("title").getAsString().length() > 10
						&& jsonNew.get("text").getAsString().length() > 10) {
					System.out.println(jsonNew.get("title").getAsString());
					System.out.println();
					allNewsFromFile.add(
							new New(jsonNew.get("title").getAsString(), jsonNew.get("text").getAsString(), mainImage));
				}

			}

			return allNewsFromFile;
		} catch (Exception e) {
			e.printStackTrace();
			// throw new Exception(e.getMessage());
		}
		return null;
	}

	public List<New> getNewsByTitle(String query) throws Exception {
		ArrayList<New> news = new ArrayList<New>();
		HttpURLConnection connection = null;
		query = query.replace(' ', '+');
		try {
			connection = (HttpURLConnection) new URL(
					"https://webhose.io/search?token=8717bcce-e4bc-408b-9067-a021896e8d75&format=json&q=" + query
							+ "%20language%3A(english)").openConnection();

			connection.connect();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				try (BufferedInputStream bis = new BufferedInputStream(connection.getInputStream())) {
					JsonParser jp = new JsonParser(); // from gson
					InputStreamReader isr = new InputStreamReader(bis, "UTF-8");
					JsonElement root = jp.parse(isr);
					JsonObject result = root.getAsJsonObject();
					ByteArrayOutputStream buf = new ByteArrayOutputStream();
					int result1 = bis.read();
					while (result1 != -1) {
						buf.write((byte) result1);
						result1 = bis.read();
					}
					String text = buf.toString();
					System.out.println(result);
					JsonArray posts = result.getAsJsonArray("posts");
					int count = 0;
					for (Iterator<JsonElement> it = posts.iterator(); it.hasNext();) {
						count++;
						JsonObject jsonNew = (JsonObject) it.next();
						JsonObject thread = null;
						String mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";

						if (jsonNew.get("thread") != null) {
							thread = (jsonNew.get("thread")).getAsJsonObject();
							if (!thread.get("main_image").isJsonNull()) {
								mainImage = (thread.get("main_image")).getAsString();
								if (mainImage.equals("")) {
									mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";
								}
							}
						}
						if (jsonNew.get("title").getAsString().length() > 10
								&& jsonNew.get("text").getAsString().length() > 10) {
							news.add(new New(jsonNew.get("title").getAsString(),
									jsonNew.get("text").getAsString(), mainImage));
						}
					}

					return news;

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

	public boolean downloadNewsForAllCategories() throws Exception {
		ArrayList<New> news = new ArrayList<New>();
		Connection myConn = null;
		myConn = DBManager.getInstance().getConnection();
		HttpURLConnection connection = null;
		PreparedStatement pstmt;
		try {
			connection = (HttpURLConnection) new URL(
					"https://webhose.io/search?token=8717bcce-e4bc-408b-9067-a021896e8d75&format=json&q=" + "sport"
							+ "%20language%3A(english)").openConnection();

			connection.connect();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				try (BufferedInputStream bis = new BufferedInputStream(connection.getInputStream())) {
					JsonParser jp = new JsonParser(); // from gson
					InputStreamReader isr = new InputStreamReader(bis, "UTF-8");
					JsonElement root = jp.parse(isr);
					JsonObject result = root.getAsJsonObject();
					JsonArray posts = result.getAsJsonArray("posts");

					int count = 0;
					for (Iterator<JsonElement> it = posts.iterator(); it.hasNext();) {
						count++;
						JsonObject jsonNew = (JsonObject) it.next();
						JsonObject thread = null;
						String mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";

						if (jsonNew.get("thread") != null) {
							thread = (jsonNew.get("thread")).getAsJsonObject();
							if (!thread.get("main_image").isJsonNull()) {
								mainImage = (thread.get("main_image")).getAsString();
								if (mainImage.equals("")) {
									mainImage = "https://s4.postimg.org/f4u1w2b7x/news.png";
								}
							}
						}
						if (jsonNew.get("title").getAsString().length() > 10
								&& jsonNew.get("text").getAsString().length() > 10) {
				
							pstmt = myConn.prepareStatement(INSERT_NEWS_SQL, Statement.RETURN_GENERATED_KEYS);
							pstmt.setString(1, jsonNew.get("title").getAsString());
							pstmt.setString(2, jsonNew.get("text").getAsString());
							pstmt.setString(3, mainImage);
							pstmt.executeUpdate();
						}
					}
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		} finally {
			connection.disconnect();
		}
		return false;

	}

}
