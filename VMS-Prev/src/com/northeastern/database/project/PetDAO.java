package com.northeastern.database.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

public class PetDAO {

	public static Pet insertPetDetails(Pet pet) {
		// TODO Auto-generated method stub
		int petOwnerId = pet.getOwnerid();
		String breed = pet.getBreed();
		String color = pet.getColor();
		Date dob = pet.getDob();
		String gender = pet.getGender();
		//String petOwner = getOwner(petOwnerId);
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDAO!!");
			
			String query = "insert into vms_database.Pet(pet_id,pet_owner,breed,color,date_of_birth,gender) values (?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(query);
			//ps.setInt(1,);
			ps.setInt(2,petOwnerId);
			ps.setString(3,breed);
			ps.setString(4,color);
			ps.setDate(5,(java.sql.Date) dob);
			ps.setString(6,gender);
			ps.executeUpdate();
			
			pet.PetAddedSuccessfully(true);

		}
		catch(Exception e){
			e.printStackTrace();
			pet.PetAddedSuccessfully(false);
		}

		return pet;
	}

}