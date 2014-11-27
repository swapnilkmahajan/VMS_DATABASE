package com.northeastern.database.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PetOwnerDAO {

	public static PetOwner insertPetOwnerDetails(PetOwner po) {
		// TODO Auto-generated method stub
		String name = po.getName();
		String email = po.getEmail();
		String profession = po.getProfession();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetOwnerDAO!!");
			
			String query = "insert into vms_database.PetOwner(name,email_address,profession) values (?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,profession);
			ps.executeUpdate();
			
			po.setInsertionOwnerDetails(true);

		}
		catch(Exception e){
			e.printStackTrace();
		}

		return po;
	}

}
