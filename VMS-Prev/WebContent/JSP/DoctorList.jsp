<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter">
<h6>
<img src="${pageContext.request.contextPath}/Images/DognCat_2.jpg" height=90 width=110/>
<br>
<br><br>
<br>
<input class= "iframebutton" type="button" value="New Appointment" onclick="parent.setURL('SearchPetOwner_Appointment.jsp')">
<br>
<br>
<input class="iframebutton" type="button" value="Appointments by Date" onclick="parent.setURL('AppointmentsForADay.jsp')">
</h6>
</form>
</body>
</html>