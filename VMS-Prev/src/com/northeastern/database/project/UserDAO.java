package com.northeastern.database.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	public static UserCredentials login (UserCredentials uc){
		
		String username=uc.getUsername();
		String password = uc.getPassword();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-Authentication!!");

			String query = "select * from vms_database.Authentication where userid = ? and userpassword = ?";
			try {
				PreparedStatement ps =  conn.prepareStatement(query);
				ps.setString(1, username);
				ps.setString(2, password);
				ResultSet rs = ps.executeQuery();
			
				boolean recordExists = rs.next();
				
				if(!recordExists)
					uc.setValid(false);
				else
					uc.setValid(true);
				
				rs.close();
				conn.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
		catch(Exception e){
			e.printStackTrace();
		}
		return uc;
	}
}