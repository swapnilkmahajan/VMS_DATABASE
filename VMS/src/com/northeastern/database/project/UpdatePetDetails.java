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

public class UpdatePetDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			System.out.println("inside update pet details");
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetOwnerDAO!!");
			
			int petid = Integer.parseInt(request.getParameter("petid"));
			System.out.println(petid);
			String name = "";
			String breed ="";
			String color ="";
			String dob ="";
			String gender ="";
			String pettype ="";
			String kci ="";
			long cregno = 0;
			long mchip = 0;
			
			String query = "select pet_name, breed, color ,to_char(trunc(date_of_birth),'mm/dd/yyyy') date_of_birth, gender, upper(pet_type) pet_type, dkci, c_reg_no, dmchip from vms_database.all_pt_all_details_vw where pet_id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, petid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				name = rs.getString("pet_name");
				breed =rs.getString("breed");
				color =rs.getString("color");
				dob =rs.getString("date_of_birth");
				gender =rs.getString("gender");
				pettype =rs.getString("pet_type");
				kci =rs.getString("dkci");
				cregno = rs.getLong("c_reg_no");
				mchip = rs.getLong("dmchip");
			}

			
			if(gender.equals("MALE")){
				request.setAttribute("male", true);
				request.setAttribute("female", false);	
			}
			
			if(gender.equals("FEMALE")){
				request.setAttribute("male", false);
				request.setAttribute("female", true);	
			}
			
			if (dob == null || dob.equals("null")){
				dob = "";
			}
			
			request.setAttribute("petid",petid);
			request.setAttribute("petname", name);
			request.setAttribute("breed", breed);
			request.setAttribute("color", color);
			request.setAttribute("dob", dob);
			
			if(pettype.equals("CAT")){
				System.out.println("inside cat");
				request.setAttribute("cat", true);
				request.setAttribute("dog", false);
				request.setAttribute("cregno", cregno);
			}
			if(pettype.equals("DOG")){
				request.setAttribute("cat", false);
				request.setAttribute("dog", true);
				request.setAttribute("kci", kci);
				request.setAttribute("mchip", mchip);
			}
			
			System.out.println("pudhe aalo re baaba");
			RequestDispatcher view = request.getRequestDispatcher("/JSP/UpdatePetDetails.jsp");
			view.forward(request, response);

		}
		catch(Exception e){
			
		}
	}
}
