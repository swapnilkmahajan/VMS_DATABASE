<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome User</title>
</head>
<link rel="stylesheet" href="../CSS/form_style.css" media="screen" type="text/css" /></head>

<body>
<form class="form-style">
<img src="../Images/DogAndCat.jpg" height=70 width=100 />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
<img src="../Images/VMS_Text.png" height=70 width=400  />
<br>
<h3>
<br>
	<a href="NewPetOwner.jsp">New</a> &nbsp; &nbsp; &nbsp; 
	<a href="NewAppointment.jsp">Appointment</a> &nbsp; &nbsp; &nbsp; 
	<a href="HealthRecords.jsp">Health Records</a> &nbsp; &nbsp; &nbsp; 
	<a href="Payments.jsp">Payments</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	&nbsp; 
<button>Log Out</button>
<br>
<br>
<br>
</h3>
<iframe src="DoctorList.jsp" height=300px width=120px></iframe>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<iframe src="AppointmentsForADay.jsp" height=300px width=450px></iframe>

</form>
</body>
</html>