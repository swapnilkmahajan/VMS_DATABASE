<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" media="screen" type="text/css" /></head>
<body>
<form action="${pageContext.request.contextPath}/NewAppointment" class="dark-matter">
<input type="hidden" name="petid" value="<%=request.getAttribute("petid")%>">
<input type="text" name="petownerid" value="<%=request.getAttribute("petownerid")%>">
<h1>New Appointment</h1>
Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="basic-grey" type="text" id="datepicker" name="appointmentdate"/> 
<br>
Start Time:
&nbsp;&nbsp;
<select name="starttime">
<option value="09:00:00">09:00 am </option>
<option value="09:15:00">09:15 am </option>
<option value="09:30:00">09:30 am </option>
<option value="09:45:00">09:45 am </option>

<option value="10.00:00">10:00 am </option>
<option value="10.15:00">10:15 am </option>
<option value="10.30:00">10:30 am </option>
<option value="10.45:00">10:45 am </option>

<option value="11.00:00">11:00 am </option>
<option value="11.15:00">11:15 am </option>
<option value="11.30:00">11:30 am </option>
<option value="11.45:00">11:45 am </option>

<option value="12.00:00">12:00 pm </option>
<option value="12.15:00">12:15 pm </option>
<option value="12.30:00">12:30 pm </option>
<option value="12.45:00">12:45 pm </option>

<option value="13.00:00">01:00 pm </option>
<option value="13.15:00">01:15 pm </option>
<option value="13.30:00">01:30 pm </option>
<option value="13.45:00">01:45 pm </option>

<option value="14.00:00">02:00 pm </option>
<option value="14.15:00">02:15 pm </option>
<option value="14.30:00">02:30 pm </option>
<option value="14.45:00">02:45 pm </option>

<option value="15.00:00">03:00 pm </option>
<option value="15.15:00">03:15 pm </option>
<option value="15.30:00">03:30 pm </option>
<option value="15.45:00">03:45 pm </option>

<option value="16.00:00">04:00 pm </option>
<option value="16.15:00">04:15 pm </option>
<option value="16.30:00">04:30 pm </option>
<option value="16.45:00">04:45 pm </option>

<option value="17.00:00">05:00 pm </option>
<option value="17.15:00">05:15 pm </option>
<option value="17.30:00">05:30 pm </option>
<option value="17.45:00">05:45 pm </option>

</select>

<br>
End Time:
&nbsp;&nbsp;&nbsp;
<select name="endtime">
<option value="09:15:00">09:15 am </option>
<option value="09:30:00">09:30 am </option>
<option value="09:45:00">09:45 am </option>

<option value="10.00:00">10:00 am </option>
<option value="10.15:00">10:15 am </option>
<option value="10.30:00">10:30 am </option>
<option value="10.45:00">10:45 am </option>

<option value="11.00:00">11:00 am </option>
<option value="11.15:00">11:15 am </option>
<option value="11.30:00">11:30 am </option>
<option value="11.45:00">11:45 am </option>

<option value="12.00:00">12:00 pm </option>
<option value="12.15:00">12:15 pm </option>
<option value="12.30:00">12:30 pm </option>
<option value="12.45:00">12:45 pm </option>

<option value="13.00:00">01:00 pm </option>
<option value="13.15:00">01:15 pm </option>
<option value="13.30:00">01:30 pm </option>
<option value="13.45:00">01:45 pm </option>

<option value="14.00:00">02:00 pm </option>
<option value="14.15:00">02:15 pm </option>
<option value="14.30:00">02:30 pm </option>
<option value="14.45:00">02:45 pm </option>

<option value="15.00:00">03:00 pm </option>
<option value="15.15:00">03:15 pm </option>
<option value="15.30:00">03:30 pm </option>
<option value="15.45:00">03:45 pm </option>

<option value="16.00:00">04:00 pm </option>
<option value="16.15:00">04:15 pm </option>
<option value="16.30:00">04:30 pm </option>
<option value="16.45:00">04:45 pm </option>

<option value="17.00:00">05:00 pm </option>
<option value="17.15:00">05:15 pm </option>
<option value="17.30:00">05:30 pm </option>
<option value="17.45:00">05:45 pm </option>

<option value="18.00:00">06:00 pm </option>

</select>

<br>
Notes:
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<textarea rows=20 name="notes"></textarea> 
<input type="submit" value="Submit" class="button">

</form>
</body>
</html>