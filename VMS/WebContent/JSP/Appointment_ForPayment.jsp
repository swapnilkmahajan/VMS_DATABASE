<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>

  function setFormAction(value)
  {
  	document.getElementById('paymentform').action="${pageContext.request.contextPath}/"+value;
  	alert(document.getElementById('paymentform').action);
  	}
  </script>
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Details</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter" id="paymentform">
<h1>Payment Details</h1>
<h3> Choose a date to enter payment details:</h3>
*Date: <input class="basic-grey" type="text" id="datepicker" name="appointmentdate"/> 
<input type="submit" value="Search" class="button" onclick="setFormAction('Appointment_ForPayment');">
<br>
<hr>
<br>
<h3>View current dues:</h3>
<input type="submit" value="View Dues" class="button" onclick="setFormAction('ViewDues');">

</form>
</body>
</html>