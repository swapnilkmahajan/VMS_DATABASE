package com.northeastern.database.project;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.OracleTypes;

public class PetOwnerDAO {

	public static int getOwnerId(String email){
		int ownerid = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-!!");

			String query = "select po.own_id as id, po.name as ownerName, PO.EMAIL_ADDRESS as email, CD.PHONE_NUMBER as priCont from vms_database.petowner po, vms_database.contactdetails cd where PO.EMAIL_ADDRESS = ? and CD.CONTACT_TYPE='PRIMARY'";
	        
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				ownerid = rs.getInt("id");
			}
			rs.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ownerid;
	}
	
	public static PetOwner insertPetOwnerDetails(PetOwner po) {
		// TODO Auto-generated method stub
		String name = po.getName();
		String email = po.getEmail();
		String profession = po.getProfession();
		long primary = po.getPrimaryNumber();
		long secondary = po.getSecondaryNumber();
		long fax = po.getFax();
		
		String res;
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
		    res = cstmt.getString(7);
		    System.out.println(cstmt.getString(7));
		    
		    // Close statement and connection
		    cstmt.close();
		    conn.close();
		    
		    if(res.equals("ERROR")){
		    	po.setInsertionError(true);
		    	po.setDuplicate(false);
		    	po.setInsertionOwnerDetails(false);
		    }
		    
		    if(res.equals("DUPLICATE")){
		    	po.setDuplicate(true);
		    	po.setInsertionOwnerDetails(false);
		    	po.setInsertionError(false);
		    }
		    
		    if(res.equals("SUCCESS")){
		    	po.setInsertionOwnerDetails(true);
		    	po.setDuplicate(false);
		    	po.setInsertionError(false);
		    }
		
		}
		catch(Exception e){
			e.printStackTrace();
			po.setInsertionOwnerDetails(false);
		}
		return po;
	}
}