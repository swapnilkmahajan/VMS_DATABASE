package com.northeastern.database.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateThisPayment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		try{
			System.out.println(request.getParameter("billid"));
			
			int billid = Integer.parseInt(request.getParameter("billid"));
			
			double consultation = 0;
			double deworming = 0;
			double medication = 0;
			double vaccination = 0;
			double other = 0;
			double paid = 0;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");
	
			int aptid = 0;
			
			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			String query = "select distinct(apt_id) apid from vms_database.billinginfo where bill_id = ?";
			
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setInt(1, billid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				aptid = rs.getInt("apid");
			}
						
			query = "select description, amount from vms_database.billinginfo where apt_id = ? order by bill_id asc";
			double total = 0;
			ps = conn.prepareStatement(query);
			ps.setInt(1, aptid);
			rs = ps.executeQuery();
			int i = 0;
			while(rs.next()){
				if(i==0){
					consultation = rs.getDouble("amount");
					total = total + consultation;
				}
				if(i==1){
					deworming = rs.getDouble("amount");
					total = total + deworming;
				}
				if(i==2){
					medication = rs.getDouble("amount");
					total = total + medication;
				}
				if(i==3){
					vaccination = rs.getDouble("amount");
					total = total + vaccination;
				}
				if(i==4){
					other = rs.getDouble("amount");
					total = total + other;
				}
				i++;
			}
			
			
			
			query = "select paid_amount from vms_database.paidbill where bill_id = ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, billid);
			rs = ps.executeQuery();
			
			while(rs.next()){
				paid = rs.getInt("paid_amount");
			}
			
			double dues = total - paid;
			
			System.out.println("c" + consultation);
			System.out.println("d" + deworming);
			System.out.println("m" + medication);
			System.out.println("v" + vaccination);
			System.out.println("o" + other);
			System.out.println("p" + paid);
			
			request.setAttribute("consultation", consultation);
			request.setAttribute("deworming", deworming);
			request.setAttribute("medication", medication);
			request.setAttribute("vaccination", vaccination);
			request.setAttribute("other", other);
			request.setAttribute("paid", paid);
			request.setAttribute("dues", dues);
			request.setAttribute("total", total);
			request.setAttribute("billid", billid);
			RequestDispatcher view = request.getRequestDispatcher("/JSP/UpdatePayments.jsp");
			view.forward(request, response);

			}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
