package com.example.test1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class jdbcConnection {
//	public static void main(String[] args){
//		
//		System.out.println("22222222222222222");
//		String connurl = "jdbc:postgresql://localhost/postgres";
//		String user = "mskim";
//		String password = "1234";
//		
//		 try
//	        {
//	            Connection connect = null;
//	            connect = DriverManager.getConnection(connurl, user, password);
//	            if(connect != null) {
//	                System.out.println("Connection successful!!");
//	            }
//	            else {
//	                throw new SQLException("no connection...");
//	            }
//	        } catch (SQLException ex) {
//	        	ex.printStackTrace();
//	        }
//	}
	public static void con() throws ClassNotFoundException{
		Class.forName("org.postgresql.Driver"); 
		
		String connurl = "jdbc:postgresql://localhost/postgres";
		String user = "mskim";
		String password = "1234";

		try {
			Connection connect = null;
			connect = DriverManager.getConnection(connurl, user, password);
			if (connect != null) {
				System.out.println("Connection successful!!");
			} else {
				throw new SQLException("no connection...");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}
