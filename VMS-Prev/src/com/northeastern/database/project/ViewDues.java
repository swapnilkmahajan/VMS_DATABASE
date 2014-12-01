package com.northeastern.database.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewDues extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		try{
			System.out.println("inside view dues");
			ArrayList<Dues> allDues = new ArrayList<Dues>();
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("\nConnection Established!");

			String USER = "SYSTEM";
			String PASS = "root";
			String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			System.out.println("Connected to database-PetDetailsForAppointment!!");

			PreparedStatement ps = null ;
			
			String query= "select bill_id, name, pet_name, aptdate, aptstart, aptend, total, paid_amount, (total-paid_amount) due " +
					"from vms_database.all_dues_apt where (total - paid_amount) != 0";
			
			ps =  conn.prepareStatement(query);
			
			ResultSet res = ps.executeQuery();
			while(res.next())
			{
				Dues d = new Dues();
				d.setBillid(res.getInt("bill_id"));
				d.setPetname(res.getString("pet_name"));
				d.setOwnername(res.getString("name"));
				d.setDate(res.getString("aptdate"));
				d.setStarttime(res.getString("aptstart"));
				d.setEndtime(res.getString("aptend"));
				d.setDues(res.getDouble("due"));
				d.setTotalAmt(res.getDouble("total"));
				d.setPaid(res.getDouble("paid_amount"));
				allDues.add(d);
			}
			request.setAttribute("appointmentsforpayment", allDues);
			RequestDispatcher view = request.getRequestDispatcher("/JSP/ViewPayments.jsp");
			view.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
