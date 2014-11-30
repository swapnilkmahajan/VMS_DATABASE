package com.northeastern.database.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;


public class HealthRecords extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
		try{
				System.out.println("inside healthrecords");
				System.out.println("id:" + request.getParameter("aptid"));
				System.out.println("count: " + request.getParameter("rowcount"));
				int rowcount = Integer.parseInt(request.getParameter("rowcount"));
				String[] vaccination = new String[rowcount];
				String[] dates = new String[rowcount];
				//rowcount--;
				
				double height = 0;
				double weight = 0;
				int aptid = 0;
				
				height = Double.parseDouble(request.getParameter("height"));
				weight = Double.parseDouble(request.getParameter("weight"));
				aptid = Integer.parseInt(request.getParameter("aptid"));
				
				for(int j = 0, i = 1 ; i < rowcount ; j++ , i++){
					String vaccinenum = "vaccination" + i;
					String dp = "datepicker" + i;
					//System.out.println(vaccinenum);
					System.out.println("vaccination" + i +": " + request.getParameter(vaccinenum));
					vaccination[j] = request.getParameter(vaccinenum);
					System.out.println("date" + i +": " + request.getParameter(dp));
					dates[j] = request.getParameter(dp);
				}

				for(int i=0;i<(rowcount-1);i++){
					System.out.println(vaccination[i]);
				}
				
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("\nConnection Established!");

				String USER = "SYSTEM";
				String PASS = "root";
				String URL ="jdbc:oracle:thin:[vms_database/vms_database]@localhost:1521/XE";
				Connection conn = DriverManager.getConnection(URL,USER,PASS);
				System.out.println("Connected to database-PetDetailsForAppointment!!");

				OracleCallableStatement callStmt = null;

			    try {
			      callStmt = (OracleCallableStatement)conn.prepareCall("{call vms_database.add_vaccinations(?,?,?,?,?)}");

			      // create array holding values for ProjectType object's properties
			      Object[] obj = new Object[rowcount-1];
			      for (int i=0;i<(rowcount-1);i++)
			      {
			    	  obj[i] = new Object[] {vaccination[i], dates[i]};
			      }

			      // descriptor for OBJECT type defined in database
			      StructDescriptor projectTypeDesc = StructDescriptor.createDescriptor("VMS_DATABASE.VACCINATION_REC", conn);

			      // each struct is one ProjectType object
			      STRUCT[] str = new STRUCT[rowcount-1];
			      for (int i=0;i<(rowcount-1);i++)
			      {
			    	  str[i] = new STRUCT(projectTypeDesc, conn, (Object[])obj[i]);
			      }

			      //STRUCT[] structArrayOfProjects = {structProject1, structProject2};

			      // descriptor of TABLE type defined in database
			      ArrayDescriptor projectTypeArrayDesc = ArrayDescriptor.createDescriptor("VMS_DATABASE.VACCINATION_ARRAY", conn);

			      // array holding two ProjectType objects
			      ARRAY arrayOfvac = new ARRAY(projectTypeArrayDesc, conn, str);
			      
			      callStmt.setInt(1,aptid);
			      callStmt.setARRAY(2, arrayOfvac);
			      callStmt.setDouble(3, height);
			      callStmt.setDouble(4, weight);
			      callStmt.registerOutParameter(5, OracleTypes.VARCHAR);
			      callStmt.execute();
			      
			      String res  = callStmt.getString(5);
				    System.out.println(callStmt.getString(5));
				    
				    // Close statement and connection
				    callStmt.close();
				    conn.close();
				    
				    if(res.equals("ERROR")){
				    	PrintWriter out = response.getWriter();  
						response.setContentType("text/html");  
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Error Occured. Please try again.');");  
						out.println("</script>");	
				    }
				    
				    if(res.equals("DUPLICATE VAC")){
				    	PrintWriter out = response.getWriter();  
						response.setContentType("text/html");  
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Vaccination details already exist.');");  
						out.println("</script>");				    
						}
				    
				    if(res.equals("DUPLICATE HEALTH")){
				    	PrintWriter out = response.getWriter();  
						response.setContentType("text/html");  
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Health details for this appointment already exist. Please try again later');");  
						out.println("</script>");				    
						}
				    
				    if(res.equals("SUCCESS")){
				    	PrintWriter out = response.getWriter();  
						response.setContentType("text/html");  
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Health and Vaccination details submitted successfully');");  
						out.println("</script>");	
				    	System.out.println("SUCCESS");
				    } 
			      
			    }
			    catch(Exception e){
			    	e.printStackTrace();
			    }
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}
}
