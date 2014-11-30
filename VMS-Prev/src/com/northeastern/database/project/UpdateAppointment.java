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

public class UpdateAppointment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		try{
			System.out.println("inside update appointment");
			int aptid = Integer.parseInt(request.getParameter("aptid"));
			
			String apointmentdate = "";
			String starttime = "";
			String endtime = "";
			String notes ="";
			
			System.out.println(aptid);
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			PreparedStatement ps = null ;
			
			String query = "select to_char(start_time,'mm/dd/yyyy')as aptdate ,to_char(start_time,'hh24:mi')" +
					" aptstart ,to_char(end_time,'hh24:mi') as aptend, notes from vms_database.appointment where apt_id = ?";
			
			ps =  conn.prepareStatement(query);
			ps.setInt(1, aptid);

			ResultSet rs = ps.executeQuery();

			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println("inside while");
				apointmentdate = rs.getString("aptdate");
				starttime = rs.getString("aptstart");
				endtime = rs.getString("aptend");
				notes = rs.getString("notes");
			}
			System.out.println(notes);

			request.setAttribute("appointmentid", aptid);
			request.setAttribute("appointmentdate", apointmentdate);
			request.setAttribute("starttime", starttime);
			request.setAttribute("endtime", endtime);
			request.setAttribute("notes", notes);
			RequestDispatcher view = request.getRequestDispatcher("/JSP/UpdateAppointments.jsp");
			view.forward(request, response);

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
