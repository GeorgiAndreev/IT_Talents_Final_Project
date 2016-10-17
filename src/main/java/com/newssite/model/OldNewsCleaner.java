package com.newssite.model;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class OldNewsCleaner implements Runnable {

	private static final int HOURS_IN_ONE_DAY = 24;
	private static final int MINUTES_IN_ONE_HOUR = 60;
	private static final int SECONDS_IN_ONE_MINUTE = 60;
	private static final int ONE_SECOND = 1000;
	private static final int NUMBER_OF_DAYS = 7;
	private static final int CLEAN_INTERVAL = ONE_SECOND * SECONDS_IN_ONE_MINUTE * MINUTES_IN_ONE_HOUR
			* HOURS_IN_ONE_DAY * NUMBER_OF_DAYS;

	java.sql.Connection connection = DBManager.getInstance().getConnection();

	private static final String DELETE_OLD_NEWS_SQL = "DELETE FROM `newss` WHERE `pubDate` < ?;";

	@Override
	public void run() {
		while (true) {
			try {
				Thread.sleep(CLEAN_INTERVAL);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				return;
			}
			// DateTimeFormatter format =
			// DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'");

			LocalDateTime now = LocalDateTime.now();
			LocalDateTime then = now.minusDays(NUMBER_OF_DAYS);

			// System.out.println(String.format("Now: %s\nThen:
			// %s",now.format(format),then.format(format)));

			/*
			 * // get Calendar instance Calendar cal = Calendar.getInstance();
			 * cal.setTime(new Date());
			 * 
			 * // substract 7 days // If we give 7 there it will give 8 days
			 * back cal.set(Calendar.DAY_OF_MONTH,
			 * cal.get(Calendar.DAY_OF_MONTH)-6);
			 * 
			 * // convert to date Date myDate = cal.getTime();
			 */
			PreparedStatement pstmt;
			try {
				pstmt = connection.prepareStatement(DELETE_OLD_NEWS_SQL, Statement.RETURN_GENERATED_KEYS);
				// da se konvertira
				pstmt.setString(1, then.toString());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
