package com.northeastern.database.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		ServletContext sc = this.getServletContext();
		RequestDispatcher rd = 	sc.getRequestDispatcher("/JSP/LogMeIn.jsp");
		try {
			rd.include(request, response);
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{
				UserCredentials user = new UserCredentials();
				user.setUsername(request.getParameter("username"));
				user.setPassword(request.getParameter("password"));
				
				System.out.println("Obtained username and password");
				System.out.println("username: "+request.getParameter("username"));
				System.out.println("password: "+request.getParameter("password"));
				
				user = UserDAO.login(user);
				if(user.isValid())
				{
					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", user);
					response.sendRedirect("JSP/WelcomeUser.jsp");
					System.out.println("Logged In");
				}
				
				else
					response.sendRedirect("JSP/InvalidLogMeIn.jsp");
			
		}catch(Exception e){
				e.printStackTrace();
		}
	}
}