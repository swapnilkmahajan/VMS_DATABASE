package com.northeastern.database.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchPetOwner extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
        
		String email = request.getParameter("owneremail");
		int ownerid = 0;
		
		ownerid = PetOwnerDAO.getOwnerId(email);
		
		System.out.println("owner-id: " + ownerid);
			
		if(ownerid==0){
			response.sendRedirect("JSP/SearchPetOwner.jsp");
		}
		else{	
			request.setAttribute("ownerid", ownerid);
			RequestDispatcher view = request.getRequestDispatcher("/JSP/NewPetDetails.jsp");
			//response.sendRedirect("JSP/NewPetDetails.jsp");
			view.forward(request, response);
		}
	}
}
