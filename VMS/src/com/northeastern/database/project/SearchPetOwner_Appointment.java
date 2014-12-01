package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchPetOwner_Appointment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		ArrayList<Pet> pets = new ArrayList<Pet>();
		String email = request.getParameter("owneremail");
		int ownerid = 0;
		
		ownerid = PetOwnerDAO.getOwnerId(email);
		
		System.out.println("owner-id: " + ownerid);
			
		if(ownerid==0){
			PrintWriter out = response.getWriter();  
			response.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Enter correct date.');");  
			out.println("</script>");
		}
		else{	
			pets = AppointmentDAO.newAppointment(ownerid);
			
			if(pets.size()==0){
				request.setAttribute("ownerid", ownerid);
				RequestDispatcher view = request.getRequestDispatcher("/JSP/NewPetDetails.jsp");
				view.forward(request, response);
			}
			if(pets.size()==1){
				request.setAttribute("ownerid", ownerid);
				RequestDispatcher view = request.getRequestDispatcher("/JSP/NewAppointment.jsp");
				view.forward(request, response);
			}
			if(pets.size()>1){
				request.setAttribute("pets", pets);
				request.setAttribute("ownerid", ownerid);
				RequestDispatcher view = request.getRequestDispatcher("/JSP/ChoosePet.jsp");
				view.forward(request, response);
			}
		}
	}
}
