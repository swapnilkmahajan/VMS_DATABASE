package com.northeastern.database.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AppointmentDAO {

	public static ArrayList<Appointment> todaysappointment(String apDate) {
		// TODO Auto-generated method stub
		ArrayList<Appointment> todaysappt= new ArrayList<Appointment>(); 
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");
			
			
	        String query = "select appt, petid, to_char(starts, 'dd/mm/yyyy hh:mi AM') as starts , to_char(ends,'dd/mm/yyyy hh:mi AM') as ends , owner, email, petname from vms_database.pet_details_for_appointment_vw where trunc(starts) = trunc(to_date (? ,'mm/dd/yyyy')) and doc = ? order by starts asc";
		
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setString(1, apDate);
			ps.setInt(2, 1);
			ResultSet rs = ps.executeQuery();
			
				while(rs.next()){
					Appointment apointment = new Appointment();
					apointment.setApptId(rs.getInt("appt"));
					apointment.setPetId(rs.getInt("petid"));
					apointment.setEmail(rs.getString("email"));
					apointment.setEndTime(rs.getString("ends"));
					apointment.setStartTime(rs.getString("starts"));
					apointment.setPetName(rs.getString("petname"));
					apointment.setOwner(rs.getString("owner"));
					
					todaysappt.add(apointment);
				}
		}
		catch(Exception e){
			e.printStackTrace();
			}
		return todaysappt;
	}

	public static ArrayList<Pet> newAppointment(int ownerId) {
		// TODO Auto-generated method stub
		ArrayList<Pet> pets = new ArrayList<Pet>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			String query = "select pet_id, pet_name,pet_type from vms_database.all_pt_All_details_vw where own_id = ?";
			
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setInt(1, ownerId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				Pet pet = new Pet();
				pet.setName(rs.getString("pet_name"));
				pet.setId(rs.getInt("pet_id"));
				pet.setType(rs.getString("pet_type"));
				pets.add(pet);
			}
			
			rs.close();
			conn.close();
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		
		return pets;
	}

	public static int addNewAppointment(String start_dt_time, String end_dt_time) {
		int count=0;
		// TODO Auto-generated method stub
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");
			
			
			String query = "select count(*) as cnt from vms_database.appointment apt where " +
			"to_date(?, 'mm/dd/yyyy hh24:mi:ss') between APT.START_TIME " +
			"and APT.END_TIME or to_date(?, 'mm/dd/yyyy hh24:mi:ss') between APT.START_TIME and APT.END_TIME";
			
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setString(1, start_dt_time);
			ps.setString(2, end_dt_time);
			ResultSet rs = ps.executeQuery();
			
			
			while (rs.next()){
				count = rs.getInt("cnt");
			}

		}
		catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	public static int addNewAppointmentHelper(int petid, int docid, String start_dt_time, String end_dt_time, String notes) {
		// TODO Auto-generated method stub
		int insertres = 0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");
			

			String query = "insert into vms_database.appointment values " +
					"(vms_database.apt_id_seq.nextval, ?, ?, " +
					"to_date(?, 'mm/dd/yyyy hh24:mi:ss'), to_date(?, 'mm/dd/yyyy hh24:mi:ss'), ?)";
	
			PreparedStatement ps1 =  conn.prepareStatement(query);
			ps1.setInt(1, petid);
			ps1.setInt(2, docid);
			ps1.setString(3, start_dt_time);
			ps1.setString(4, end_dt_time);
			ps1.setString(5, notes);
			
			insertres = ps1.executeUpdate();
			
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return insertres;
	}

}
