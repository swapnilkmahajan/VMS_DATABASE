package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateThisAppointment extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			String start_dt_time = request.getParameter("appointmentdate")+ " " + request.getParameter("starttime");
			String end_dt_time = request.getParameter("appointmentdate") + " " + request.getParameter("endtime");
			String notes = request.getParameter("notes");
			int aptid = Integer.parseInt(request.getParameter("appointmentid"));
			System.out.println(aptid);
			System.out.println(notes);
			System.out.println(start_dt_time);
			
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			PreparedStatement ps = null ;
			
			String query= "update vms_database.appointment " +
					"set start_time = to_date(?, 'mm/dd/yyyy hh24:mi:ss')," +
					" end_time = to_date(?, 'mm/dd/yyyy hh24:mi:ss') , notes = ? where apt_id = ?";
			
			ps =  conn.prepareStatement(query);
			ps.setString(1, start_dt_time);
			ps.setString(2, end_dt_time);
			ps.setString(3, notes);
			ps.setInt(4, aptid);
			int res = ps.executeUpdate();
			
			if(res == 1){
				conn.commit();
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Appointment updated successfully');");  
				out.println("</script>");
			}
			else{
				conn.rollback();
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Could not update the appointment. Please try again later.');");  
				out.println("</script>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
