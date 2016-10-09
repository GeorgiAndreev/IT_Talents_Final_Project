package com.example.model;

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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.tomcat.jni.File;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;

public abstract class NewDAO {
	
	public static ArrayList<New> allNews = new ArrayList<New>();
	public static ArrayList<New> allNewsFromFile = new ArrayList<New>();
	
	public static ArrayList<New> getNewsFromFile(){
		ArrayList<New> news = new ArrayList<New>();
		JsonParser parser = new JsonParser();
		 
        try {
 
            Object obj = parser.parse(new FileReader("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt"));
 
            JsonObject jsonObject = (JsonObject) obj;
 
			
				 
				    //JsonElement root = jp.parse(new InputStreamReader((InputStream) request.getContent())); //Convert the input stream to a json element
				  
			
					//byte[] bytes = new byte[connection.getContentLength()];
					//byte[] bytes = new byte[10000];
					//bis.read(bytes);
					 
					
					//PrintWriter writer = new PrintWriter("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt", "UTF-8");
					//writer.println(result);
					//writer.close();
					
					
					//String json = new String(bytes, "UTF-8");
					//System.out.println(json);
					//java.io.File jsonTestFile = new java.io.File("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt");
					//PrintWriter printWriter = new PrintWriter(jsonTestFile);
					//printWriter.println(new InputStreamReader(bis, "UTF-8"));
					//printWriter.println("uuuuuuuuuuuuuuuuuuuuuuuu");
					//printWriter.close();
					//try (Writer writer = new BufferedWriter(new OutputStreamWriter(
				  //            new FileOutputStream("filename.txt"), "utf-8"))) {
				 //  writer.write(json);
				//}
					
				//	String title = null;
				//	String text = null;
					
				//	Gson gson = new Gson();
				//	New[] news1 = gson.fromJson(json, New[].class);
					
				/* JsonReader:
			
					JsonReader jsonReader = new JsonReader(new StringReader(json));
					
					jsonReader.setLenient(true);
					
					jsonReader.beginObject();
					
					String name = jsonReader.nextName();
				  
				  System.out.println(name);  
				  
				  jsonReader.beginArray();
				  
				  jsonReader.beginObject();
				  
				  while (jsonReader.hasNext()) {
		                 String n = jsonReader.nextName();
		                 if (n.equals("title")){
		                     System.out.println(jsonReader.nextString());
		                 } else {
							jsonReader.skipValue();
						}
		                 
		             }
				
					jsonReader.close(); 
					
				*/

				  /*  jsonReader.beginArray();

				    while (jsonReader.hasNext()) {

				    String name = jsonReader.nextName();
				        if (name.equals("posts")) {
				             readApp(jsonReader);

				        }
				    }

				   jsonReader.endObject();
				   jsonReader.close();
					*/
					
					
					
					
					
					//  JsonObject result = (JsonObject) new JsonParser().parse(json);
					System.out.println(jsonObject);
					       JsonArray posts = jsonObject.getAsJsonArray("posts");
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
							System.out.println(jsonNew.get("title").getAsString());
							System.out.println();
							allNewsFromFile.add(new New(jsonNew.get("title").getAsString(), jsonNew.get("text").getAsString(), mainImage));
						}
	
						
					}
		//news.add(new New(jsonNew1.get("title").getAsString(), jsonNew1.get("text").getAsString()));
		//			news.add(new New("test new", "text"));
					return allNewsFromFile;
        } catch(Exception e){
        	
        }
       return null;
	}

	public static List<New> getNewsByTitle(String query) throws Exception {
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
					
					//PrintWriter writer = new PrintWriter("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt", "UTF-8");
					//writer.println(result);
					//writer.close();
					
					
					//String json = new String(bytes, "UTF-8");
					//System.out.println(json);
					//java.io.File jsonTestFile = new java.io.File("C:/Users/Jorj Andre/workspace/ServiceDemo/file2.txt");
					//PrintWriter printWriter = new PrintWriter(jsonTestFile);
					//printWriter.println(new InputStreamReader(bis, "UTF-8"));
					//printWriter.println("uuuuuuuuuuuuuuuuuuuuuuuu");
					//printWriter.close();
					//try (Writer writer = new BufferedWriter(new OutputStreamWriter(
				  //            new FileOutputStream("filename.txt"), "utf-8"))) {
				 //  writer.write(json);
				//}
					
				//	String title = null;
				//	String text = null;
					
				//	Gson gson = new Gson();
				//	New[] news1 = gson.fromJson(json, New[].class);
					
				/* JsonReader:
			
					JsonReader jsonReader = new JsonReader(new StringReader(json));
					
					jsonReader.setLenient(true);
					
					jsonReader.beginObject();
					
					String name = jsonReader.nextName();
				  
				  System.out.println(name);  
				  
				  jsonReader.beginArray();
				  
				  jsonReader.beginObject();
				  
				  while (jsonReader.hasNext()) {
		                 String n = jsonReader.nextName();
		                 if (n.equals("title")){
		                     System.out.println(jsonReader.nextString());
		                 } else {
							jsonReader.skipValue();
						}
		                 
		             }
				
					jsonReader.close(); 
					
				*/

				  /*  jsonReader.beginArray();

				    while (jsonReader.hasNext()) {

				    String name = jsonReader.nextName();
				        if (name.equals("posts")) {
				             readApp(jsonReader);

				        }
				    }

				   jsonReader.endObject();
				   jsonReader.close();
					*/
					
					
					
					
					
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
		//news.add(new New(jsonNew1.get("title").getAsString(), jsonNew1.get("text").getAsString()));
		//			news.add(new New("test new", "text"));
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
	
	/*public void readApp(JsonReader jsonReader) throws IOException{
	    jsonReader.beginObject();
	     while (jsonReader.hasNext()) {
	         String name = jsonReader.nextName();
	         System.out.println(name);
	         if (name.contains("thread")){
	             jsonReader.beginObject();
	             while (jsonReader.hasNext()) {
	                 String n = jsonReader.nextName();
	                 if (n.equals("title")){
	                     System.out.println(jsonReader.nextString());
	                 }
	                 if (n.equals("age")){
	                     System.out.println(jsonReader.nextInt());
	                 }
	                 if (n.equals("text")){
	                     jsonReader.beginArray();
	                     while  (jsonReader.hasNext()) {
	                          System.out.println(jsonReader.nextString());
	                     }
	                     jsonReader.endArray();
	                 }
	             }
	             jsonReader.endObject();
	         }

	     }
	     jsonReader.endObject();
	}*/
}
