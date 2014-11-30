package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchRecords extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		String searchString="";
		String searchbasedon = "";
		try{
			searchString = request.getParameter("searchbytext");
			if (searchString.equals("")){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Please enter a valid value');");  
				out.println("</script>");
			}
			else{
				ArrayList<SearchRecord> records = new ArrayList<SearchRecord>();
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("\nConnection Established!");

				String USER = "SYSTEM";
				String PASS = "root";
				String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
				Connection conn = DriverManager.getConnection(URL,USER,PASS);
				System.out.println("Connected to database-PetDetailsForAppointment!!");

				PreparedStatement ps = null ;
				
				String query= "";
				searchbasedon = request.getParameter("searchbasedon");
				if (searchbasedon.equals("OwnerName")){
				query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
						" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where upper(name) = upper(?)";
				
				ps =  conn.prepareStatement(query);
				ps.setString(1, searchString);
				
				}
				if (searchbasedon.equals("RegistrationorMicrochipNumber")){
					if(request.getParameter("regdetails").equals("Cat")){
						query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
							" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where c_reg_no =?";
						
						ps =  conn.prepareStatement(query);
						ps.setInt(1, Integer.parseInt(searchString));
					}
					if(request.getParameter("regdetails").equals("Dog")){
						query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
							" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where dkci = ?";
						
						ps =  conn.prepareStatement(query);
						ps.setString(1, (searchString));
					}
				}
				if (searchbasedon.equals("PetName")){
					query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
							" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where upper(pet_name) = upper(?)";
					ps =  conn.prepareStatement(query);
					ps.setString(1, (searchString));
					}
				
				if (searchbasedon.equals("PetType")){
					if (request.getParameter("pettype").equals("Cat")){
						query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
							" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where upper(pet_type) = 'CAT'";
						
						ps =  conn.prepareStatement(query);
						ps.setString(1, searchString);
						}
					if (request.getParameter("pettype").equals("Dog")){
						query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
							" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where upper(pet_type) = 'DOG'";
						
						ps =  conn.prepareStatement(query);
						ps.setString(1, searchString);
						
						}
					}
				if (searchbasedon.equals("Breed")){
					query = "select pet_id, own_id , pet_name, name as ownername, phone_number as contact,email_Address as email," +
							" pet_type, breed, dkci, c_reg_no from vms_database.all_pt_All_details_vw where upper(breed) = upper(?)";
					
					ps =  conn.prepareStatement(query);
					ps.setString(1, searchString);
					
					}
				
				ResultSet rs = ps.executeQuery();
				if (!rs.next())
				{
					PrintWriter out = response.getWriter();  
					response.setContentType("text/html");  
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('No records match the search criteria');");  
					out.println("</script>");
					
				}
				else
				{
					rs = ps.executeQuery();
					while(rs.next()){
						System.out.println("inside while");
						SearchRecord sr = new SearchRecord();
						sr.setPetid(rs.getInt("pet_id"));
						sr.setOwnerid(rs.getInt("own_id"));
						sr.setEmail(rs.getString("email"));
						sr.setBreed(rs.getString("breed"));
						sr.setCatregno(rs.getLong("c_reg_no"));
						sr.setKci(rs.getString("dkci"));
						sr.setOwnername(rs.getString("ownername"));
						sr.setPetname(rs.getString("pet_name"));
						sr.setPettype(rs.getString("pet_type"));
						sr.setPhonenumber(rs.getLong("contact"));
						System.out.println(sr.getPetid());
						records.add(sr);
					}
					System.out.println("records: "+records.size());
					
					request.setAttribute("records", records);
					RequestDispatcher view = request.getRequestDispatcher("/JSP/SearchRecordsResult.jsp");
					view.forward(request, response);
				}	
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
