package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Appointment_ForHRResult extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			
			int count = 0;
			
			System.out.println("inside afhrr");
			System.out.println(request.getParameter("aptid"));
			
			int aptid = Integer.parseInt(request.getParameter("aptid"));
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");
	
			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");
			
			String query = "select count(*) as cnt from vms_database.AppointmentHealthRecord where rec_id = ?";
			
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setInt(1, aptid);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()){
				count = rs.getInt("cnt");
			}

			if(count == 0){
				request.setAttribute("aptid", aptid);
				RequestDispatcher view = request.getRequestDispatcher("/JSP/HealthRecords.jsp");
				view.forward(request, response);
			}
			else{
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Appointment has a health record. Please update it through Search Records');");  
				out.println("</script>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
