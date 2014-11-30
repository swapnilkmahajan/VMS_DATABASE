package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Appointment_ForPayment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
	
		ArrayList<Appointment> todaysappt= new ArrayList<Appointment>(); 
		
		String apDate= request.getParameter("appointmentdate").toString();
		todaysappt = AppointmentDAO.todaysappointment(apDate);
		
		if (todaysappt.size() == 0){
			PrintWriter out = response.getWriter();  
			response.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('No Appointments for selected date');");  
			out.println("</script>");	
		}
		else{
			request.setAttribute("appointmentsforpayment", todaysappt);
			RequestDispatcher view = request.getRequestDispatcher("/JSP/Appointment_ForPaymentResult.jsp");
			view.forward(request, response);
		}
	}
}
