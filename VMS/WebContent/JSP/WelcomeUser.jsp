<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome User</title>
<script>
function setURL(url){
    document.getElementById('mainIframe').src = url;
}
</script>
</head>

<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" /></head>

<body>
<form class="dark-matter" >
<input type="button"  class="logoutbutton" />
<img src="../Images/DogAndCat.jpg" height=90 width=110 align="right"/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
&nbsp; &nbsp; &nbsp; 
<font size="6" face="verdana">Veternary Management System </font>
<br>
<br>
<br>
<hr>
<h3>
<br>
	<input type="button" onclick="setURL('NewPetOwner.jsp')" value="New Pet Owner" class="button"> &nbsp; &nbsp; 
	<input type="button" onclick="setURL('NewPetDetails.jsp')" class="button" value="New Pet Details"> &nbsp; &nbsp;
	<input type="button" onclick="setURL('NewAppointment.jsp')" value="Appointment" class="button"> &nbsp; &nbsp;
	<input type="button" onclick="setURL('HealthRecords.jsp')" class="button" value="Health Records"> &nbsp; &nbsp; 
	<input type="button" onclick="setURL('SearchRecords.jsp.jsp')" class="button" value="Search Records"> &nbsp; &nbsp; 
	<input type="button" onclick="setURL('Payments.jsp')" class="button" value="Payments"> &nbsp; &nbsp;   
	&nbsp; 
<br>
<br>
<br>
</h3>
<iframe src="DoctorList.jsp" height=500px width=170px></iframe>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<iframe src="AppointmentsForADay.jsp" height=500px width=650px id="mainIframe"></iframe>

</form>
</body>
</html>