package com.northeastern.database.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChoosePet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		try{
			System.out.println(request.getParameter("petownerid"));		
			System.out.println(request.getParameter("petid"));
			
			request.setAttribute("petid", request.getParameter("petid"));
			request.setAttribute("petownerid", request.getParameter("petownerid"));
			RequestDispatcher view = request.getRequestDispatcher("/JSP/NewAppointment.jsp");
			view.forward(request, response);
	
		}
	catch(Exception e){
		e.printStackTrace();
	}
	}
}
