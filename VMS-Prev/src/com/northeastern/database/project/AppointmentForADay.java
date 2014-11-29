package com.northeastern.database.project;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppointmentForADay extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
        
		ArrayList<Appointment> todaysappt= new ArrayList<Appointment>(); 
		
		String apDate= request.getParameter("appointmentdate").toString();
		todaysappt = AppointmentDAO.todaysappointment(apDate);

		request.setAttribute("appointments", todaysappt);
		RequestDispatcher view = request.getRequestDispatcher("/JSP/AppointmentsForADayResult.jsp");
		view.forward(request, response);

	}
}
