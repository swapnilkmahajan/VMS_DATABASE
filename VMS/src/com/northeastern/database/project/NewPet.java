package com.northeastern.database.project;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewPet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			System.out.println("Pet Owner: " + request.getParameter("petownerid"));
			System.out.println("breed:" + request.getParameter("breed"));
			System.out.println("color:" + request.getParameter("color"));
			System.out.println("dob:" + request.getParameter("dob"));
			System.out.println("gender:" + request.getParameter("gender"));
			System.out.println("type:" + request.getParameter("type"));
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			
			Date dateOfBirth = 	formatter.parse(request.getParameter("dob"));
			System.out.println(formatter.format(dateOfBirth));
			Pet pet = new Pet();
			
			pet.setOwnerid(Integer.parseInt(request.getParameter("petownerid")));
			pet.setBreed(request.getParameter("breed"));
			pet.setColor(request.getParameter("color"));
			pet.setDob(dateOfBirth);
			pet.setGender(request.getParameter("gender"));
			pet.setType(request.getParameter("type"));
			
			pet = PetDAO.insertPetDetails(pet);
	
			if (pet.isPetAddedSuccessfully())
				System.out.println("Record inserted successfully");
			else
				System.out.println("Record was not inserted in the database");
			
			if(request.getParameter("type").equals("cat")){
				System.out.println("new cat");
			}
			if(request.getParameter("type").equals("dog"))
				System.out.println("new dog");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}