package com.northeastern.database.project;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewAppointment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			System.out.println("pet-id: " + request.getParameter("petid"));
			System.out.println("start-time: " + request.getParameter("starttime"));
			System.out.println("end-time: " + request.getParameter("endtime"));
			System.out.println("notes: " + request.getParameter("notes"));
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
