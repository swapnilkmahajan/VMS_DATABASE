package com.northeastern.database.project;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

import oracle.jdbc.OracleTypes;

public class PetOwnerDAO {

	public static PetOwner insertPetOwnerDetails(PetOwner po) {
		// TODO Auto-generated method stub
		String name = po.getName();
		String email = po.getEmail();
		String profession = po.getProfession();
		long primary = po.getPrimaryNumber();
		long secondary = po.getSecondaryNumber();
		long fax = po.getFax();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetOwnerDAO!!");
			
			String query = "{call vms_database.add_new_pet_owner(?,?,?,?,?,?,?)}";
		    CallableStatement cstmt = conn.prepareCall(query);

		    cstmt.setString(1,name);
		    cstmt.setString(2,email);
		    cstmt.setString(3,profession);
		    cstmt.setLong(4,primary);
		    cstmt.setLong(5,secondary);
		    cstmt.setLong(6,fax);
		    cstmt.registerOutParameter(7, OracleTypes.VARCHAR);
		    cstmt.execute();

		    // Get the data
		    System.out.println(cstmt.getString(7));
		    
		    // Close statement and connection
		    cstmt.close();
		    conn.close();
		    po.setInsertionOwnerDetails(true);
		}
		catch(Exception e){
			e.printStackTrace();
			po.setInsertionOwnerDetails(false);
		}
		return po;
	}
}