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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" />

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/AppointmentForADay">
<h1>Appointments and Calenders</h1>

<br><br><br>
Date: <input class="basic-grey" type="text" id="datepicker" /> 
<input type="submit" value="Search" class="button">
<table class="table tableshow">
                    <thead>
                        <tr>
                            <th>Owner Name</th>
                            <th>Pet Name</th>
                            <th>Owner Email ID</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${appointments}" var="aptdetails">
                    <tr>
                        <td>${aptdetails.getOwner()}</td>
                        <td>${aptdetails.getPetName()}</td>
                        <td>${aptdetails.getEmail()}</td>
                        <td>${aptdetails.getStartTime()}</td>
                        <td>${aptdetails.getEndTime()}</td>
                    </tr>
                    </c:forEach>

                    </tbody>

                </table>

</form>
</body>
</html>