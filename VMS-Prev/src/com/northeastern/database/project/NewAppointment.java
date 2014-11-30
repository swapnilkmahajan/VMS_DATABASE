package com.northeastern.database.project;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewAppointment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response){

		try{
			System.out.println("owner-id: " + request.getParameter("petownerid"));
			System.out.println("pet-id: " + request.getParameter("petid"));
			System.out.println("appointment-date: " + request.getParameter("appointmentdate"));
			System.out.println("start-time: " + request.getParameter("starttime"));
			System.out.println("end-time: " + request.getParameter("endtime"));
			System.out.println("notes: " + request.getParameter("notes"));
			//int ownerId = Integer.parseInt(request.getParameter("petownerid"));
			String start_dt_time = request.getParameter("appointmentdate")+ " " + request.getParameter("starttime");
			String end_dt_time = request.getParameter("appointmentdate") + " " + request.getParameter("endtime");
			String notes = request.getParameter("notes");
			int petid = Integer.parseInt(request.getParameter("petid"));
			
			System.out.println(start_dt_time);
			System.out.println(end_dt_time);
			int count = 0;
			int insertres= 0;
			
			count = AppointmentDAO.addNewAppointment(start_dt_time,end_dt_time);
								
			if (count >= 1 ) {
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Appointment clashes with other scheduled.');");  
				out.println("</script>");
			} 
			else{
			
				insertres = AppointmentDAO.addNewAppointmentHelper(petid,1,start_dt_time,end_dt_time,notes);
										
				if (insertres == 0) {
					PrintWriter out = response.getWriter();  
					response.setContentType("text/html");  
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('Error occured, Please try again!');");  
					out.println("</script>");
				}
				else{
					PrintWriter out = response.getWriter();  
					response.setContentType("text/html");  
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('Appointment scheduled');");  
					out.println("</script>");
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
