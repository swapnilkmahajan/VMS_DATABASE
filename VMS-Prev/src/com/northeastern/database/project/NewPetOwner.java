package com.northeastern.database.project;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewPetOwner extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			System.out.println("new pet owner:" + request.getParameter("name"));
			System.out.println("email:" + request.getParameter("email"));
			System.out.println("profession:" + request.getParameter("profession"));
			System.out.println("primary phone:" + request.getParameter("primaryPhoneNumber"));
			System.out.println("secondary phone:" + request.getParameter("secondaryPhoneNumber"));
			System.out.println("fax:" + request.getParameter("fax"));
			
			PetOwner petOwner = new PetOwner();
			
			petOwner.setName(request.getParameter("name"));
			petOwner.setEmail(request.getParameter("email"));
			
			if(request.getParameter("profession").equals(""))
				petOwner.setProfession(null);
			else
				petOwner.setProfession(request.getParameter("profession"));
			
			petOwner.setPrimaryNumber(Long.parseLong(request.getParameter("primaryPhoneNumber")));
			
			if(request.getParameter("secondaryPhoneNumber").equals(""))
				petOwner.setSecondaryNumber(0);
			else
				petOwner.setSecondaryNumber(Long.parseLong(request.getParameter("secondaryPhoneNumber")));
			
			if(request.getParameter("fax").equals(""))
				petOwner.setFax(0);
			else
				petOwner.setFax(Long.parseLong(request.getParameter("fax")));
			
			petOwner = PetOwnerDAO.insertPetOwnerDetails(petOwner);

			if (petOwner.isOwnerDetailsSuccessful()){
				//System.out.println("Record inserted successfully");
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Pet Owner successfully added');");  
				out.println("</script>");
			}
			else{
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Pet Owner not added. Please try again later');");  
				out.println("</script>");
				//System.out.println("Record was not inserted in the database");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
