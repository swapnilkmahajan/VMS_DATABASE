<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function validateForm()
{
    if(document.petOwnerForm.name.value=="")
    {
      alert("Name of the pet owner is a mandatory field");
      return false;
    }
    else if(document.petOwnerForm.email.value=="")
    {
      alert("Email address is a mandatory field");
      return false;
    }
    
    else if(document.petOwnerForm.primaryPhoneNumber.value=="")
    {
      alert("Primary phone number is a mandatory field");
      return false;
    }
    
}

</script>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form action="${pageContext.request.contextPath}/UpdateOwnerDetails" class="dark-matter" name="petOwnerForm" onSubmit="return validateForm()">
<h1>Update Pet Owner Details</h1>
<input type="hidden" name="petownerid" value="<%=request.getAttribute("ownerid")%>">
<h2>Basic Details: </h2>
Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="name" value="<%=request.getAttribute("ownername")%>"/>
<br>
Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" value="<%=request.getAttribute("email")%>" onBlur="return validateEmail()"/>
<br>
Profession:&nbsp;&nbsp; <input type="text" name="profession" value="<%=request.getAttribute("profession")%>"/>
<br>
<h2>Contact Details: </h2>
<br>
Primary Number:&nbsp;&nbsp;&nbsp; <input type="text" name="primaryPhoneNumber" value="<%=request.getAttribute("primarynumber")%>"/>
<br>
Phone Number: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="secondaryPhoneNumber" value="<%=request.getAttribute("secondarynumber")%>"/>
<br>
Fax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fax" value="<%=request.getAttribute("fax")%>"/>
<br>
<br>
<br>
<button class="button" type="submit" value="submit">Submit</button>
</form>
</body>
</html>