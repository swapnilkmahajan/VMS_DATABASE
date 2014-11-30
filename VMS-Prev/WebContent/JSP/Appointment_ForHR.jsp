<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
  <script>
  function validateForm(){
	 if( document.getElementById('datepicker').value =="")
		 {
		 alert("Please choose a date of appointment to enter health record details")
		 return false;
		 }
  }
  </script>
  <SCRIPT type="text/javascript">
  function getAppointments() {
  location.href = "${pageContext.request.contextPath}/Appointment_ForHR";}
  </SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Health Records</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/Appointment_ForHR" onSubmit="return validateForm()">
<h1>Choose an appointment date to enter health records</h1>

<br>
*Date: <input class="basic-grey" type="text" id="datepicker" name="appointmentdate"/> 
<input type="submit" value="Search" class="button">



</form>
</body>
</html>