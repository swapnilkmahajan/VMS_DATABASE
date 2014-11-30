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

public class Payments extends HttpServlet {

	private static final long serialVersionUID = 1L;
	 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		String res = "";
		Payment payment = new Payment(); 
		
		int aptid = Integer.parseInt(request.getParameter("aptid"));
		
		
		payment.setConsultation(Double.parseDouble(request.getParameter("consultation")));
		payment.setDeworming(Double.parseDouble(request.getParameter("deworming")));
		payment.setMedication(Double.parseDouble(request.getParameter("medication")));
		payment.setVaccination(Double.parseDouble(request.getParameter("vaccination")));
		payment.setOther(Double.parseDouble(request.getParameter("other")));
		payment.setPaid(Double.parseDouble(request.getParameter("paid")));
		
		System.out.println("apointmentid: " + aptid);
		System.out.println(payment.getConsultation());
		System.out.println(payment.getDeworming());
		System.out.println(payment.getMedication());
		System.out.println(payment.getOther());
		System.out.println(payment.getVaccination());
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");
			
			String query = "{call vms_database.new_bill_info(?,?,?,?,?,?,?,?)}";
		    CallableStatement cstmt = conn.prepareCall(query);

		    cstmt.setInt(1,aptid);
		    cstmt.setDouble(2,payment.getConsultation());
		    cstmt.setDouble(3,payment.getDeworming());
		    cstmt.setDouble(4,payment.getMedication());
		    cstmt.setDouble(5,payment.getVaccination());
		    cstmt.setDouble(6,payment.getOther());
		    cstmt.setDouble(7, payment.getPaid());
		    cstmt.registerOutParameter(8, OracleTypes.VARCHAR);
		    cstmt.execute();

		    // Get the data
		    res = cstmt.getString(8);
		    System.out.println("result: "+ res);
		    // Close statement and connection
		    cstmt.close();
		    conn.close();
			
		    if(res.equals("ERROR")){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Could not save this payment. Please try again');");  
				out.println("</script>");

		    }
		    
		    if(res.equals("SUCCESS")){
		    	PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Billing information updated successfully');");  
				out.println("</script>");
		    }

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
