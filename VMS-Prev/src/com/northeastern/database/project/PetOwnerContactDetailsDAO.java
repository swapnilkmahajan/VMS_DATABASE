package com.northeastern.database.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PetOwnerContactDetailsDAO {

	private static String PRIMARY = "PRIMARY";
	private static String SECONDARY = "SECONDARY";
	private static String FAX = "FAX";
	private static String OWNER = "OWNER";
	
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
			
			if(primaryNumber!=0){
				
				String primaryNumQuery = "insert into vms_database.ContatDetails(per_id,role,phone_number,contact_type) values (?,?,?,?)";
				
				PreparedStatement ps = conn.prepareStatement(primaryNumQuery);
				ps.setInt(1,1);
				ps.setLong(2,1);
				ps.setString(3, OWNER);
				ps.setLong(4,primaryNumber);
				ps.setString(5,PRIMARY);
				ps.executeUpdate();
			}
			
			if(secondaryNumber!=0){
				
				String primaryNumQuery = "insert into vms_database.ContatDetails(per_id,role,phone_number,contact_type) values (?,?,?,?)";
				
				PreparedStatement ps = conn.prepareStatement(primaryNumQuery);
				ps.setInt(1,1);
				ps.setString(2, OWNER);
				ps.setLong(3, secondaryNumber);
				ps.setString(4, SECONDARY);
				ps.executeUpdate();
			}

			if(fax!=0){
				
				String primaryNumQuery = "insert into vms_database.ContatDetails(per_id,role,phone_number,contact_type) values (?,?,?,?)";
				
				PreparedStatement ps = conn.prepareStatement(primaryNumQuery);
				//ps.setLong(1,primaryNumber);
				ps.setString(2, OWNER);
				ps.setLong(3, fax);
				ps.setString(4, FAX);
				ps.executeUpdate();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}

		
		return petOwner;
	}
	
}
