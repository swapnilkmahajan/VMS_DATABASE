package com.northeastern.database.project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewDues extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		try{
			System.out.println("inside view dues");
			
			String ownername;
			String petname;
			String date;
			String starttime;
			String endtime;
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
