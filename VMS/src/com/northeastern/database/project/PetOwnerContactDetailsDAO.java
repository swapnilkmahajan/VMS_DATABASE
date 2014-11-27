package com.northeastern.database.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PetOwnerContactDetailsDAO {

	public static PetOwner insertPetOwnerContactDetails(PetOwner petOwner) {
		// TODO Auto-generated method stub
		long primaryNumber = petOwner.getPrimaryNumber();
		long secondaryNumber = petOwner.getSecondaryNumber();
		long fax = petOwner.getFax();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetOwnerContactDetailsDAO!!");
			
			String query = "insert into vms_database.ContatDetails(role,) values (?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setLong(1,primaryNumber);
			ps.setLong(2,secondaryNumber);
			ps.setLong(3,fax);
			ps.executeUpdate();

		}
		catch(Exception e){
			e.printStackTrace();
		}

		
		return petOwner;
	}
	
}
