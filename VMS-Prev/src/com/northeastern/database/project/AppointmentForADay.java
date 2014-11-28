package com.northeastern.database.project;

import java.io.IOException;
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

public class AppointmentForADay extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
        
		String apDate= request.getParameter("appointmentdate").toString();
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

	        String query = "select appt, petid, to_char(starts, 'dd/mm/yyyy hh:mm') as starts , to_char(ends,'dd/mm/yyyy hh:mm') as ends , owner, email, petname from vms_database.pet_details_for_appointment_vw where trunc(starts) = trunc(to_date (? ,'mm/dd/yyyy')) and doc = ? order by starts asc";
		
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setString(1, apDate);
			ps.setInt(2, 1);
			ResultSet rs = ps.executeQuery();
			ArrayList<Appointment> todaysappt= new ArrayList<Appointment>(); 
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
			request.setAttribute("appointments", todaysappt);
			RequestDispatcher view = request.getRequestDispatcher("/JSP/AppointmentsForADayResult.jsp");
			view.forward(request, response);
    
		}
		catch(Exception e){
			e.printStackTrace();
			}
}
}
