package com.example.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ChangeThemes {
	
	public static String returnTheme(int themeId) {
		return null;
	}
	
	public static String returnColor(String theme) {
		switch (theme) {
		case "red":
			return "background-color: red;";
		case "green":
			return "background-color: #00FF00;";
		case "blue":
			return "background-color: blue;";
		case "gold":
			return "background-color: #FFF68F;";
		default:
			return "background-color: red;";
		}
	}
	

	public static String returnHeaderImage(String theme) {
		switch (theme) {
		case "red":
			return "news-header5.png;";
		case "green":
			return "news-header5grl.png;";
		case "blue":
			return "news-header5b.png;";
		case "gold":
			return "samo11.png;";
		default:
			return "news-header5.png;";
		}
	}
	
	public static String returnImage(String theme) {
		switch (theme) {
		case "red":
			return "red-stars1.jpg;";
		case "green":
			return "forest1.jpg;";
		case "blue":
			return "snow1.jpg;";
		case "gold":
			return "gray22221.jpg;";
		default:
			return "red-stars1.jpg;";
		}
	}
	
	public static String returnBorder(String theme) {
		switch (theme) {
		case "red":
			return "border-top: 10px solid red;border-right: 70px solid red;border-bottom: 10px solid red;border-left: 60px solid red;border-radius: 25px;font-size: 26px;";
		case "green":
			return "border-top: 10px solid #00FF00;border-right: 70px solid #00FF00;border-bottom: 10px solid #00FF00;border-left: 60px solid #00FF00;border-radius: 25px;font-size: 26px;";
		case "blue":
			return "border-top: 10px solid blue;border-right: 70px solid blue;border-bottom: 10px solid blue;border-left: 60px solid blue;border-radius: 25px;font-size: 26px;";
		case "gold":
			return "border-top: 10px solid gold;border-right: 70px solid gold;border-bottom: 10px solid gold;border-left: 60px solid gold;border-radius: 25px;font-size: 26px;";
		default:
			return "border-top: 10px solid red;border-right: 70px solid red;border-bottom: 10px solid red;border-left: 60px solid red;border-radius: 25px;font-size: 26px;";
		}
	}

	public Map<Integer, JSPEvent> events = new HashMap<>();

	public static class JSPEvent {
		public String id;
		public String name;
		public String description;

		public JSPEvent(String id, String name, String description) {
			this.id = id;
			this.name = name;
			this.description = description;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((description == null) ? 0 : description.hashCode());
			result = prime * result + ((id == null) ? 0 : id.hashCode());
			result = prime * result + ((name == null) ? 0 : name.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			JSPEvent other = (JSPEvent) obj;
			if (description == null) {
				if (other.description != null)
					return false;
			} else if (!description.equals(other.description))
				return false;
			if (id == null) {
				if (other.id != null)
					return false;
			} else if (!id.equals(other.id))
				return false;
			if (name == null) {
				if (other.name != null)
					return false;
			} else if (!name.equals(other.name))
				return false;
			return true;
		}

		@Override
		public String toString() {
			return "Event [id=" + id + ", name=" + name + ", description=" + description + "]";
		}
	}

	public void fillEvents() {
		JSPEvent e1 = new JSPEvent("1", "tanci1", "narodni1");
		System.out.println(e1);
		JSPEvent e2 = new JSPEvent("2", "tanci2", "narodni2");
		System.out.println(e2);
		JSPEvent e3 = new JSPEvent("3", "tanci3", "narodni3");
		System.out.println(e3);
		events.put(1, e1);
		events.put(2, e2);
		events.put(3, e3);
	}

	public static String returnString() {
		double random = Math.random();
		if (random >= 0.0 && random <= 0.3) {
			return "����� ����� �����, ����� �����.";
		}
		if (random > 0.3 && random < 0.6) {
			return "�� ���� ���� � 100 ����� �� �����.";
		} else {
			return "�� ����� ������ ���� ��� ����.";
		}

	}
	
	public static String returnStyle(String file) throws IOException {
		 StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(new FileReader(file));
		try {
		   
		    String line = br.readLine();

		    while (line != null) {
		        sb.append(line);
		        sb.append(System.lineSeparator());
		        line = br.readLine();
		    }
		    String everything = sb.toString();
		    return everything;
		} finally {
		    br.close();
		}
		

	}

	public static String returnEventInfo(String eventId) {
		StringBuilder builder = new StringBuilder("");
		ChangeThemes j = new ChangeThemes();
		j.fillEvents();
		System.out.println(eventId);
		System.out.println(j.events.get(eventId));
		if ((eventId == null) || (eventId.equals(""))) {
			builder.append("<br><br>Enter event id.");
			return builder.toString();
		}
		if (!(j.events.containsKey(Integer.parseInt(eventId)))) {
			builder.append("<br><br>No event with such id found.");
			return builder.toString();
		}
		if (j.events.containsKey(Integer.parseInt(eventId))) {
			System.out.println("contains");
			builder.append("<br><br>");
			builder.append(j.events.get(Integer.parseInt(eventId)).name);
			builder.append("<br><br>");
			builder.append(j.events.get(Integer.parseInt(eventId)).description);
		}
		System.out.println(builder.toString());
		return builder.toString();
	}
	
	public static String returnEventImage(String eventId) {
		StringBuilder builder = new StringBuilder("");
		ChangeThemes j = new ChangeThemes();
		j.fillEvents();
		System.out.println(eventId);
		System.out.println(j.events.get(eventId));
		if ((eventId == null) || (eventId.equals(""))) {
			builder.append("<br><br>Enter event id.");
			return builder.toString();
		}
		if (!(j.events.containsKey(Integer.parseInt(eventId)))) {
			builder.append("<br><br>No event with such id found.");
			return builder.toString();
		}
		if (j.events.containsKey(Integer.parseInt(eventId))) {
			System.out.println("contains");
			builder.append("<br><br>");
			builder.append(j.events.get(Integer.parseInt(eventId)).name);
			builder.append("<br><br>");
			builder.append(j.events.get(Integer.parseInt(eventId)).description);
		}
		System.out.println(builder.toString());
		return builder.toString();
	}


	public static String returnEventsList() {
		StringBuilder builder = new StringBuilder("");
		ChangeThemes j = new ChangeThemes();
		j.fillEvents();
		for (Map.Entry<Integer, JSPEvent> entry : j.events.entrySet()) {
			// System.out.println(entry.getKey() + "/" + entry.getValue());
			builder.append("<br><br>");
			builder.append(entry.getKey() + " " + entry.getValue().name);
		}
		return builder.toString();
	}
	
	public static String returnEventImage(int whichImage) {
//		StringBuilder builder = new StringBuilder("${pageContext.request.contextPath}/images/bag1.jpg");
//		StringBuilder builder = new 
//				StringBuilder(
		if (whichImage == 1) {
			return "/smile-1.png";
		} else {
			return "/bag1.jpg";
		}
		
//						);
		
//		return builder.toString();
	}

	public static String validateNameAndEmail(String name, String email) {
		if ((name == null) || (email == null)) {
			return "";
		}
		if ((name.length() == 0) && (email.length() == 0)) {
			return "";
		}
		if ((name.length() > 0) && (email.length() == 0)) {
			return "Fill email.";
		}
		if ((name.length() == 0) && (email.length() > 0)) {
			return "Fill name.";
		}
		if ((name.length() > 0) && (email.length() > 0)) {
			if ((name.length() < 3) && (email.length() < 3)) {
				return "Invalid name and email.";
			}
			if ((name.length() < 3) && (email.length() >= 3)) {
				return "Invalid name.";
			}
			if ((name.length() >= 3) && (email.length() < 3)) {
				return "Invalid email.";
			}
		}
		return "You subscribed successfully!";
	}

	public static String returnMessage(String name, String email) {
		if (name.length() < 3) {
			return "Invalid name";
		}
		if (email.length() < 3) {
			return "Invalid email";
		} else {
			return "You subscribed successfully!";
		}

	}

	public static void main(String[] args) {
		ChangeThemes j = new ChangeThemes();
		j.fillEvents();
	}

}
