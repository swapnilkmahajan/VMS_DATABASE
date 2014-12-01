package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.OracleTypes;

public class UpdateThisPet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			System.out.println("inside update this pet");
			
			int petid;
			String petname;
			String gender;
			String color;
			String breed;
			String kci;
			long mchip;
			long cregno;
			String pettype;
			String dob;
			petid = Integer.parseInt(request.getParameter("petid"));
			petname= request.getParameter("petname");
			gender = request.getParameter("gender");
			color = request.getParameter("color");
			breed = request.getParameter("breed");
			//kci = request.getParameter("kcinumber");
			pettype = request.getParameter("pet");
			dob = request.getParameter("dob");
			
			if(request.getParameter("div_microchipnumber")== null || request.getParameter("div_microchipnumber").equals("null")|| request.getParameter("div_microchipnumber").equals("")){
				mchip = 0;
			}
			else
				mchip = Long.parseLong(request.getParameter("div_microchipnumber"));
			
			if(request.getParameter("div_regnumber")== null || request.getParameter("div_regnumber").equals("null") || request.getParameter("div_regnumber").equals("")){
				cregno = 0;
			}
			else
				cregno = Long.parseLong(request.getParameter("div_regnumber"));
			
			if(request.getParameter("div_kcinumber")== null || request.getParameter("div_kcinumber").equals("null") || request.getParameter("div_kcinumber").equals("")){
				kci = "";
			}
			else
				kci = request.getParameter("div_kcinumber");
			
			if(request.getParameter("dob")== null || request.getParameter("dob").equals("null") || request.getParameter("dob").equals("")){
				dob = "";
			}
			else
				dob = request.getParameter("dob");
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);

			String query = "{call vms_database.update_pet(?,?,?,?,?,?,?,?,?,?,?)}";
		    CallableStatement cstmt = conn.prepareCall(query);
		    System.out.println("gender" + gender);
		    System.out.println("pettype"+ pettype);
		    
		    cstmt.setInt(1,petid);
		    cstmt.setString(2,petname);
		    cstmt.setString(3,breed);
		    cstmt.setString(4,color);
		    cstmt.setString(5,dob);
		    cstmt.setString(6,gender);
		    cstmt.setString(7,pettype);
		    cstmt.setString(8,kci);
		    cstmt.setLong(9,mchip);
		    cstmt.setLong(10,cregno);
		    cstmt.registerOutParameter(11, OracleTypes.VARCHAR);
		    cstmt.execute();
		    
		    String res = cstmt.getString(11);
		    System.out.println(cstmt.getString(11));
		    
		    // Close statement and connection
		    cstmt.close();
		    conn.close();
		    
		    if(res.equals("ERROR")){
		    	PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Could not update pet details. Please try again later');");  
				out.println("</script>");	
		    }
		    
		    if(res.equals("DUPLICATE")){
		    	PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Duplicate pet details exist. Please enter correct values');");  
				out.println("</script>");
		    }
		    
		    if(res.equals("SUCCESS")){
		    	PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Updated pet details successfully');");  
				out.println("</script>");
		    }

		    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
