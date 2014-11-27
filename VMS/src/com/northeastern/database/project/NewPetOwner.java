package com.northeastern.database.project;

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
			petOwner.setProfession(request.getParameter("profession"));
			petOwner.setPrimaryNumber(Long.parseLong(request.getParameter("primaryPhoneNumber")));
			petOwner.setSecondaryNumber(Long.parseLong(request.getParameter("secondaryPhoneNumber")));
			petOwner.setFax(Long.parseLong(request.getParameter("fax")));
			
			petOwner = PetOwnerDAO.insertPetOwnerDetails(petOwner);
			//petOwner = PetOwnerContactDetailsDAO.insertPetOwnerContactDetails(petOwner);
			if (petOwner.isOwnerContactDetailsSuccessful())
				System.out.println("Record inserted successfully");
			else
				System.out.println("Record was not inserted in the database");
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
