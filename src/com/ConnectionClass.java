package com;

import java.sql.*;

public class ConnectionClass {
	private static final String FOR_NAME = "com.mysql.jdbc.Driver";
	private static final String DATABASE = "jdbc:mysql://localhost:3306/dtuclassroom";
	private static final String USER = "root";
	private static final String PWD = "root";
	
	private static ConnectionClass connection;

	private ConnectionClass() {

	}

	public static ConnectionClass getInstance() {
		if (connection == null) {
			connection = new ConnectionClass();
		}
		return connection;
	}
	
	public ResultSet getResultSet(String query) {
		ResultSet rs = null;
		try {
			Class.forName(FOR_NAME);
			Connection con = DriverManager.getConnection(DATABASE, USER, PWD);
			System.out.println(query);
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return rs;
	}
	
	public boolean updateDb(String query) {
		boolean result = false;
		try {
			Class.forName(FOR_NAME);
			Connection con = DriverManager.getConnection(DATABASE, USER, PWD);
			System.out.println(query);
			Statement st = con.createStatement();
			int x = st.executeUpdate(query);
			if(x > 0) { result = true; }
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
}
