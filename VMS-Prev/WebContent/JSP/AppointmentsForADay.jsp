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
			 alert("Please choose a date of appointment to view appointment details")
			 return false;
			 }
	  }
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointments</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/AppointmentForADay" onSubmit="return validateForm()">
<h1>Appointments and Calenders</h1>

<br>
*Date: <input class="basic-grey" type="text" id="datepicker" name="appointmentdate"/> 
<input type="submit" value="Search" class="button">



</form>
</body>
</html>