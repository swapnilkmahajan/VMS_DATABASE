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
			double consultation = 0;
			double deworming = 0;
			double medication = 0;
			double vaccination = 0;
			double other = 0;
			double paid = 0;
			double totalamount = 0;
			double totaldues = 0;
			
			Payment payment = new Payment();
			
			if(!request.getParameter("consultation").equals(""))
				consultation = Double.parseDouble(request.getParameter("consultaion"));
			
			if(!request.getParameter("deworming").equals(""))
				deworming = Double.parseDouble(request.getParameter("deworming"));
			
			if(!request.getParameter("medication").equals(""))
				medication = Double.parseDouble(request.getParameter("medication"));
			
			if(!request.getParameter("vaccination").equals(""))
				vaccination = Double.parseDouble(request.getParameter("vaccination"));
			
			if(!request.getParameter("other").equals(""))
				other = Double.parseDouble(request.getParameter("other"));
			
			if(!request.getParameter("paid").equals(""))
				paid = Double.parseDouble(request.getParameter("paid"));
			
			if(!request.getParameter("total").equals(""))
				totalamount = Double.parseDouble(request.getParameter("total"));
			
			if(!request.getParameter("due").equals(""))
				totaldues = Double.parseDouble(request.getParameter("due"));
			
			payment.setPaymentid(Integer.parseInt(request.getParameter("aptid")));
			payment.setConsultation(consultation);
			payment.setDeworming(deworming);
			payment.setMedication(medication);
			payment.setOther(other);
			payment.setPaid(paid);
			payment.setTotalamount(totalamount);
			payment.setTotaldues(totaldues);
			payment.setVaccination(vaccination);
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");
	
			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			String query = "update vms_database.PaidBill set paid_amount = ? " +
					"where bill_id = (select min(bill_id) from vms_database.BillingInfo where apt_id = ?)";
			
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setDouble(1, paid);
			ps.setInt(2, 2);
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
			System.out.println("inside update payments");

		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
