<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script>
  function setAptID(val){
	  
	  document.getElementById('aptid').value=val.value;
  }
  </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointments</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />


<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/">
<h1>Choose an appointment</h1>

<br>
<input type="hidden" id="aptid" name="aptid">
<table class="mytable">
                    <tbody>
                      <tr>
                      		<td> Choose </td>
                            <td> Number </td>
                            <td>Pet Name</td>

                        </tr>
                    <c:forEach items="${appointments}" var="aptdetails">
                    <tr>
                    	<td><input type="radio" value="${aptdetails.getApptId()}" name="aptid" onclick="setAptID(this);"></td>
                        <td>${aptdetails.getOwner()}</td>
                        <td>${aptdetails.getPetName()}</td>
                    </tr>
                    </c:forEach>

                    </tbody>

</table><br><br>
<input type="submit" value="Update Appointment" class="button">

</form>
</body>
</html>