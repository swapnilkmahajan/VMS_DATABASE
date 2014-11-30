<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
function populateAptID(id)
{
	alert("apt id="+id);
	document.getElementById('aptid').value=id;
	
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />


<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/Appointment_ForHRResult">
<h1>Appointments and Calenders</h1>
<input type="hidden" name="aptid" id="aptid">
<br><br><br>
Date: <input class="basic-grey" type="text" id="datepicker" /> 
<input type="submit" value="Search" class="button">
<table class="mytable">
                    <thead>
                        <tr>
                        	<th>Choose </th>
                            <th>Appointment Start Time </th>
                            <th>Appointment End Time  </th>
                            <th>Pet Owner Name</th>

                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${appointmentsforhr}" var="aptdetails">
                    <tr>
                    	<td> <input type="radio" value="${aptdetails.getApptId()}" name="petid"  onclick="populateAptID('${aptdetails.getApptId()}')"> </td>       
                        <td>${aptdetails.getStartTime()}</td>
                        <td>${aptdetails.getEndTime()}</td>
                        <td>${aptdetails.getOwner()}</td>
                    </tr>
                    </c:forEach>

                    </tbody>

</table>
<br>
<br>
<input type="submit" value="Submit" class="button">
</form>
</body>
</html>