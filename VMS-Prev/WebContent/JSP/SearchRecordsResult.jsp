<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function setFormAction(value)
{
	document.getElementById('resultform').action="${pageContext.request.contextPath}/"+value;
	alert(document.getElementById('resultform').action);
	}
function populateData(val)
{
document.getElementById('petid').value=val.value;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter" id="resultform">
<input type="text" name="petid" id="petid">
<h2>Search Results: </h2>
<table class="mytable">
                    <tbody>
                    <tr>
                        	<td>Choose </td>
                            <td>Pet Owner</td>
                            <td>Contact</td>
                            <td>Email ID</td>
                            <td>Pet Name</td>
                            <td>Pet Type</td>
                            <td>Breed</td>
                            <td>Dog KCI Number</td>
                            <td>Cat Registration Number</td>
                            <td>Pet id</td>
                    </tr>
                    <c:forEach items="${records}" var="details">
                    <tr>
                    	
                    	<td> <input type="radio" value="${details.getPetid()}" name="petid" onclick="populateData(this);"> </td>       
                        <td>${details.getOwnername()}</td>
                        <td>${details.getPhonenumber()}</td>
                        <td>${details.getEmail()}</td>
                        <td>${details.getPetname()}</td>
                        <td>${details.getPettype()}</td>
                        <td>${details.getBreed()}</td>
                        <td>${details.getKci()}</td>
                        <td>${details.getCatregno()}</td>
                        
                        <td><input type="text" value="${details.getOwnerid()}" name="petownerid" ></td>
                    </tr>
                    </c:forEach>

                    </tbody>

</table>
<br>
<br>
<input type="submit" class="button" value="Update Pet Owner Details" onclick="setFormAction('UpdatePetOwnerDetails')">
<input type="submit" class="button" value="Update Pet Details" onclick="setFormAction('UpdatePetDetails')">
</form>
</body>
</html>