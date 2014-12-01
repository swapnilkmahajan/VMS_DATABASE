<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pet Owner Details:</title>
  <script>
  function validateForm(){
	    if(document.getElementById('name').value=="")
	    {
	      alert("Name of the pet owner is a mandatory field");
	      return false;
	    }
	   if(document.getElementById('email').value=="")
	    {
	      alert("Email address is a mandatory field");
	      return false;
	    }
	    
	    if(document.getElementById('primaryPhoneNumber').value=="")
	    {
	      alert("Primary phone number is a mandatory field");
	      return false;
	    }
	    
	    var x = document.getElementById('email').value;
	    var atpos = x.indexOf("@");
	    var dotpos = x.lastIndexOf(".");
	    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
	        alert("Please enter a valid email address");
	        return false;
	    }
  }
  function validateEmail(val)
  {

	  var x = val.value;
	    var atpos = x.indexOf("@");
	    var dotpos = x.lastIndexOf(".");
	    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
	        alert("Not a valid e-mail address");
	        return false;
	    }
  }
  </script>
</head>
<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" /></head>
<body>
<form action="${pageContext.request.contextPath}/NewPetOwner" class="dark-matter" name="petOwnerForm" onSubmit="return validateForm()">
<h1>New Pet Owner Details</h1>

<h2>Basic Details: </h2>
*Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="name" id="name"/>
<br>
*Email: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" id="email" onblur="return validateEmail(this);"/>
<br>
Profession:&nbsp;&nbsp;&nbsp; <input type="text" name="profession"/>
<br>
<h2>Contact Details: </h2>
<br>
*Primary Number:&nbsp;&nbsp; <input type="text" name="primaryPhoneNumber" id="primaryPhoneNumber"/>
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