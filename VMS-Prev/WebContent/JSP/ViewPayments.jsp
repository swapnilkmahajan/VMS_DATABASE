<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
function populateAptID(id)
{
	document.getElementById('billid').value=id;
	
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Payment</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />


<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/UpdateThisPayment">
<h1>Choose a payment you wish to update:</h1>
<input type="hidden" name="billid" id="billid">
<br>
<table class="mytable">
                    <tbody>
     				     <tr>
                        	<td>Choose </td>
                            <td>Owner Name </td>
                            <td>Pet Name </td>
                            <td>Date </td>
                            <td>Start Time</td>
                            <td>End Time</td>
                            <td>Total</td>
                            <td>Paid</td>
                            <td>Dues</td>
                        </tr>
                    <c:forEach items="${appointmentsforpayment}" var="aptdetails">
                    <tr>
                    	<td> <input type="radio" value="${aptdetails.getBillid()}" name="tempbillid"  onclick="populateAptID('${aptdetails.getBillid()}')"> </td>       
                        <td>${aptdetails.getOwnername()}</td>
                        <td>${aptdetails.getPetname()}</td>
                        <td>${aptdetails.getDate()}</td>
                        <td>${aptdetails.getStarttime()}</td>
                        <td>${aptdetails.getEndtime()}</td>
                        <td>${aptdetails.getTotalAmt()}</td>
                        <td>${aptdetails.getPaid()}</td>
                        <td>${aptdetails.getDues()}</td>
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