<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<h1>Choose an appointment to enter health records</h1>
<input type="hidden" name="aptid" id="aptid">
<br>
<table class="mytable">

                    <tbody>
                    <tr>
                        	<td>Choose </td>
                            <td>Appointment Start Time </td>
                            <td>Appointment End Time  </td>
                            <td>Pet Owner Name</td>

                        </tr>
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