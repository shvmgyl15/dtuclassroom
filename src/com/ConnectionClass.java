package com;

import java.sql.*;

import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;

public class ConnectionClass {
	private static final String FOR_NAME = "com.mysql.cj.jdbc.Driver";
	private static final String DATABASE = "jdbc:mysql://localhost:3306/dtuclassroom";
	private static final String USER = "root";
	private static final String PWD = "";
	
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
		CachedRowSet rowset = null;
		try {
			Class.forName(FOR_NAME);
			Connection con = DriverManager.getConnection(DATABASE, USER, PWD);
			System.out.println(query);
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
			rowset = new CachedRowSetImpl();
			rowset.populate(rs);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return rowset;
	}
	
	public boolean updateDb(String query) {
		boolean result = false;
		try {
//			Class.forName(FOR_NAME);
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
