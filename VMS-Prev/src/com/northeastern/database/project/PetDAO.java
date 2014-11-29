package com.northeastern.database.project;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

import oracle.jdbc.OracleTypes;

public class PetDAO {

	public static Pet insertPetDetails(Pet pet, Dog dog, Cat cat) {
		// TODO Auto-generated method stub
		int petOwnerId = pet.getOwnerid();
		String breed = pet.getBreed();
		String color = pet.getColor();
		String dob = pet.getDob();
		String gender = pet.getGender();
		String pettype = pet.getType();
		String petname = pet.getName();
		System.out.println("Pet Name" + petname);
		
		String kci = dog.getKciNumber();
		long mchip = dog.getMcNumber();
		System.out.println("kci: "+kci);
		System.out.println("mchip: "+mchip);
		long regnum = cat.getRegNumber();
		System.out.println("regnum: "+regnum);
		String res;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDAO!!");
			
			String query = "{call vms_database.addNewPet(?,?,?,?,?,?,?,?,?,?,?)}";
	
			CallableStatement cstmt = conn.prepareCall(query);
		
			cstmt.setInt(1,petOwnerId);
			cstmt.setString(2,petname);
			cstmt.setString(3,breed);
			cstmt.setString(4,color);
			cstmt.setString(5, dob);
			cstmt.setString(6,gender);
			cstmt.setString(7,pettype);
			cstmt.setString(8,kci);
			cstmt.setLong(9,mchip);
			cstmt.setLong(10,regnum);
			cstmt.registerOutParameter(11, OracleTypes.VARCHAR);
			cstmt.executeUpdate();
			
			res = cstmt.getString(11);
		    System.out.println(cstmt.getString(11));
			
			cstmt.close();
			conn.close();
		    
		    if(res.equals("ERROR")){
		    	pet.setInsertionerror(true);
		    	pet.setDuplicate(false);
		    	pet.setSuccess(false);
		    }
		    
		    if(res.equals("DUPLICATE")){
		    	pet.setDuplicate(true);
		    	pet.setSuccess(false);
		    	pet.setInsertionerror(false);
		    }
		    
		    if(res.equals("SUCCESS")){
		    	pet.setSuccess(true);
		    	pet.setDuplicate(false);
		    	pet.setInsertionerror(false);
		    }

		}
		catch(Exception e){
			e.printStackTrace();
			pet.setSuccess(false);
		}
		return pet;
	}
}