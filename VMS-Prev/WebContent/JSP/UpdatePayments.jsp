<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Update Payments</title>
<script>
$(document).ready(function(){
	document.getElementById('total').disabled=true;
	document.getElementById('due').disabled=true;
	
	
});

function calculateTotal(fieldval)
{
	document.getElementById('total').value = parseInt(document.getElementById('total').value) + parseInt(fieldval.value);
	
	}
	
function calculatedue(paid)
{
	document.getElementById('due').value = parseInt(document.getElementById('total').value) - parseInt(paid.value);
	
	}
</script>
</head>

<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" /></head>
<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/UpdatePayments" >

<input type="hidden" name="billid" value="<%=request.getAttribute("billid")%>">
<input type="hidden" name="lastdue" value="<%=request.getAttribute("dues")%>">

<h1> Payment Details: </h1>
Consultation: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="consultation" id="consultation" onblur="calculateTotal(this);"  value="<%=request.getAttribute("consultation")%>">
<br>
De-worming: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="deworming" id="deworming" onblur="calculateTotal(this);"  value="<%=request.getAttribute("deworming")%>"><br>
Medication: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="medication" id="medication" onblur="calculateTotal(this);"  value="<%=request.getAttribute("medication")%>"><br>
Vaccination: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="vaccination" id="vaccination" onblur="calculateTotal(this);"  value="<%=request.getAttribute("vaccination")%>"><br>
Other: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="other" id="other" onblur="calculateTotal(this);"  value="<%=request.getAttribute("other")%>">
<br>Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="total" id="total" value="<%=request.getAttribute("total")%>">

<hr>
Paid:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="paid" id="paid" onblur="calculatedue(this);"  value="<%=request.getAttribute("paid")%>"><br>
Due: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="due" id="due" value="<%=request.getAttribute("dues")%>"><br>
<input type="submit" value="Submit" class="button">
</form>
</body>
</html>