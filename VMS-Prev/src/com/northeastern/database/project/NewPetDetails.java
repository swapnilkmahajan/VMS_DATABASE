package com.northeastern.database.project;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewPetDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response){
		try{
			
			Cat cat = new Cat();
			Dog dog = new Dog();
			
			System.out.println("Pet Owner: " + request.getParameter("petownerid"));
			System.out.println("breed:" + request.getParameter("breed"));
			System.out.println("color:" + request.getParameter("color"));
			System.out.println("dob:" + request.getParameter("dob"));
			System.out.println("gender:" + request.getParameter("gender"));
			System.out.println("type:" + request.getParameter("pet"));
			System.out.println("name: " + request.getParameter("petname"));
			
			Pet pet = new Pet();
			
			pet.setDob(request.getParameter("dob"));
			pet.setOwnerid(Integer.parseInt(request.getParameter("petownerid")));
			pet.setBreed(request.getParameter("breed"));
			pet.setColor(request.getParameter("color"));
			pet.setName(request.getParameter("petname"));
			pet.setGender(request.getParameter("gender"));
			pet.setType(request.getParameter("pet"));
			
			if(request.getParameter("pet").equals("Cat")){
				if (request.getParameter("regnumber").equals(""))
					cat.setRegNumber(0);
				else
					cat.setRegNumber(Long.parseLong(request.getParameter("regnumber")));
			}
			
			if(request.getParameter("pet").equals("Dog")){
				dog.setKciNumber(request.getParameter("kcinumber"));
				if (request.getParameter("microchipnumber").equals(""))
					dog.setMcNumber(0);
				else
					dog.setMcNumber(Long.parseLong(request.getParameter("microchipnumber")));
			}
			
			pet = PetDAO.insertPetDetails(pet,dog,cat);
			
			if (pet.isSuccess()){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Pet successfully added');");  
				out.println("</script>");
			}
			
			if (pet.isInsertionerror()){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Pet not added. Please try again later');");  
				out.println("</script>");
			}
			
			if (pet.isDuplicate()){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Duplicate pet record exists in the system. Please check the details and try again');");  
				out.println("</script>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}