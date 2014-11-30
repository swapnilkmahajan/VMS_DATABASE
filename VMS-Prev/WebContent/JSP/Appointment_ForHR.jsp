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
  <SCRIPT type="text/javascript">
  function getAppointments() {
  location.href = "${pageContext.request.contextPath}/Appointment_ForHR";}
  </SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" />

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/Appointment_ForHR">
<h1>Appointments and Calenders</h1>

<br><br><br>
Date: <input class="basic-grey" type="text" id="datepicker" name="appointmentdate"/> 
<input type="submit" value="Search" class="button">



</form>
</body>
</html>