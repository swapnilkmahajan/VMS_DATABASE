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
    //  document.logmein.username.focus();
      return false;
    }
    else if(document.petOwnerForm.email.value=="")
    {
      alert("Email address is a mandatory field");
      document.logmein.password.focus();
      return false;
    }
    
    else if(document.petOwnerForm.primaryPhoneNumber.value=="")
    {
      alert("Primary phone number is a mandatory field");
      document.logmein.password.focus();
      return false;
    }
    
}
function validateEmail()
{
	var x = document.petOwnerForm.email.value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }

</script>
</head>
<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" /></head>
<body>
<form action="${pageContext.request.contextPath}/NewPetOwner" class="dark-matter" name="petOwnerForm" onSubmit="return validateForm()">
<h1>New Pet Owner Details</h1>

<h2>Basic Details: </h2>
Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="name"/>
<br>
Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" onBlur="return validateEmail()"/>
<br>
Profession:&nbsp;&nbsp; <input type="text" name="profession"/>
<br>
<h2>Contact Details: </h2>
<br>
Primary Number:&nbsp;&nbsp;&nbsp; <input type="text" name="primaryPhoneNumber"/>
<br>
Phone Number: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="secondaryPhoneNumber"/>
<br>
Fax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fax"/>
<br>
<br>
<br>
<button class="button" type="submit" value="submit">Submit</button>
</form>
</body>
</html>