package com.northeastern.database.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdatePetOwnerDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			PreparedStatement ps = null;
			System.out.println("inside update update pet owner");
			
			long secondary = 0;
			long fax = 0;
			
			int ownerid = Integer.parseInt(request.getParameter("petownerid"));
			SearchRecord record = new SearchRecord();
	
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");
	
			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");
			
			String query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
					" pet_type, breed, dkci, c_reg_no, profession from vms_database.all_pt_All_details_vw where own_id = ?";
			
			
			ps =  conn.prepareStatement(query);
			ps.setInt(1, ownerid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				record.setPetid(rs.getInt("pet_id"));
				record.setOwnerid(rs.getInt("own_id"));
				record.setEmail(rs.getString("email"));
				record.setBreed(rs.getString("breed"));
				record.setCatregno(rs.getLong("c_reg_no"));
				record.setKci(rs.getString("dkci"));
				record.setOwnername(rs.getString("ownername"));
				record.setPetname(rs.getString("pet_name"));
				record.setPettype(rs.getString("pet_type"));
				record.setPhonenumber(rs.getLong("contact"));
				record.setProfession(rs.getString("profession"));
			}
			
			query = "select phone_number as sec from vms_database.contactdetails where per_id = ? and contact_type ='SECONDARY' " +
					"and role ='OWNER'";
			
			ps =  conn.prepareStatement(query);
			ps.setInt(1, ownerid);
			rs = ps.executeQuery();
			
			while(rs.next())
				secondary = rs.getLong("sec");
			
			record.setSecondary(secondary);
			
			query = "select phone_number as fax from vms_database.contactdetails where per_id = ? and contact_type ='FAX' " +
					"and role ='OWNER'";
			
			ps =  conn.prepareStatement(query);
			ps.setInt(1, ownerid);
			rs = ps.executeQuery();
			
			while(rs.next())
				fax = rs.getLong("fax");
			
			record.setFax(fax);
			
			request.setAttribute("petid", record.getPetid());
			request.setAttribute("ownerid", record.getOwnerid());
			request.setAttribute("petname", record.getPetname());
			request.setAttribute("ownername", record.getOwnername());
			request.setAttribute("breed", record.getBreed());
			request.setAttribute("catregno", record.getCatregno());
			request.setAttribute("kci", record.getKci());
			request.setAttribute("email", record.getEmail());
			request.setAttribute("contact", record.getPhonenumber());
			request.setAttribute("pettype", record.getPettype());
			request.setAttribute("profession", record.getProfession());
			request.setAttribute("secondarynumber", record.getSecondary());
			request.setAttribute("fax", record.getFax());
			RequestDispatcher view = request.getRequestDispatcher("/JSP/UpdateOwnerDetails.jsp");
			view.forward(request, response);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		//record.setBreed(request.getParameter("breed"));
	}
}
