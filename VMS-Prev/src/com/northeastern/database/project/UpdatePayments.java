package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdatePayments extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		
		try{
			int billid = Integer.parseInt(request.getParameter("billid"));
			System.out.println(request.getParameter("billid"));
			
			double paid = 0;
			if(!request.getParameter("paid").equals(""))
				paid = Double.parseDouble(request.getParameter("paid"));
			
			System.out.println("paid: " + paid);
		 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");
	
			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			String query = "update vms_database.PaidBill set paid_amount = ? " +
					"where bill_id = ?";
			
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setDouble(1, paid);
			ps.setInt(2, billid);
			int rs = ps.executeUpdate();
			if (rs == 1 ) {
				conn.commit();
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Bill Updated Successfully');");  
				out.println("</script>");
			}
			else{
				conn.rollback();
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Error occured. Please try agian');");  
				out.println("</script>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
