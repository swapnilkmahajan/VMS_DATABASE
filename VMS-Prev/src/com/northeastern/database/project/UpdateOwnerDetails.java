package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateOwnerDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			long fax = 0;
			long primarynum = 0;
			long secondarynum = 0;
			int id = 0;
			
			if(request.getParameter("petownerid").equals(""))
				id = 0;
			else
				id = Integer.parseInt(request.getParameter("petownerid"));
			
			if (request.getParameter("primaryPhoneNumber").equals(""))
				primarynum = 0;
			else
				primarynum = Long.parseLong(request.getParameter("primaryPhoneNumber"));
			
			if (request.getParameter("secondaryPhoneNumber").equals(""))
				secondarynum = 0;
			else
				secondarynum = Long.parseLong(request.getParameter("secondaryPhoneNumber"));
			if (request.getParameter("fax").equals(""))
				fax = 0;
			else
				fax = Long.parseLong(request.getParameter("fax"));
			
			PetOwner petowner = new PetOwner();
			petowner.setEmail(request.getParameter("email"));
			petowner.setFax(fax);
			petowner.setName(request.getParameter("name"));
			petowner.setPrimaryNumber(primarynum);
			petowner.setSecondaryNumber(secondarynum);
			petowner.setProfession(request.getParameter("profession"));
			petowner.setId(id);
			
			petowner = PetOwnerDAO.updateOwnerDetails(petowner);
			
			if(petowner.isUpdatesuccess()){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Owner details successfully updated.');");  
				out.println("</script>");
			}
			
			if(petowner.isUpdateerror()){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Could not update owner details. Please try again later..');");  
				out.println("</script>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
