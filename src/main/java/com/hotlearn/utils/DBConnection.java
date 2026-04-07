/**
 * 
 */
package com.hotlearn.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utility class to manage MYSQL database connections for the hotlearn portal
 */
public class DBConnection {
	// Database Credentials
	private static final String URL = "jdbc:mysql://localhost:3306/hort_db";
	private static final String USER = "root";
	private static final String PASSWORD = "254elam56";
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// load the MySQL JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException | SQLException e) {
			((Throwable) e).printStackTrace();
		}
		return conn;
	}


public static void main(String[] args) {
    if (getConnection() != null) {
        System.out.println("Connection successful! Your database is ready.");
    } else {
        System.out.println("Connection failed. Check your password and JAR file.");
    }
}
}
