<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update PetDetails</title>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  function validateForm()
  {
	  if(document.getElementById('name').value=="")
		  {
		  	alert("Please enter a name");
		  	return false;
		  	
		  }
	  if(document.getElementById('color').value=="")
	  {
	  	alert("Please enter color of the pet");
	  	return false;
	  	
	  }
	  if(document.getElementById('gender_male').checked==false && document.getElementById('gender_female').checked==false)
	  {
	  	alert("Please enter gender of the pet");
	  	return false;
	  	
	  }
	  if(document.getElementById('breed').value=="")
	  {
	  	alert("Please enter breed of the pet");
	  	return false;
	  	
	  }
	  if(document.getElementById('pettype_cat').checked==false &&document.getElementById('pettype_dog').checked==false)
	  {
	  	alert("Please enter pet type");
	  	return false;  	
	  }
  }
  </script>
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
    if(document.getElementById('pettype_cat').checked==true){
    	 $(".catdetails").show();
    	 $(".dogdetails").hide();
    }
    if(document.getElementById('pettype_dog').checked==true){
   	 $(".catdetails").hide();
   	 $(".dogdetails").show();
   }
    
  });
  </script>
 <script language="JavaScript" type="text/javascript">
  function showhidediv(value){
  if(value=='cat')
  {
	  $(".catdetails").show();
	  $(".dogdetails").hide();
  }
  if(value=='dog')
  {
      $(".dogdetails").show();
      $(".catdetails").hide();
  }   
 }
  function copyDetails()
  {
	  document.getElementById("kcinumber").value=document.getElementById("div_kcinumber").value;
	  document.getElementById("microchipnumber").value=document.getElementById("div_microchipnumber").value;
	  document.getElementById("regnumber").value=document.getElementById("div_regnumber").value;
  }
</script>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />
<body>
<form action="${pageContext.request.contextPath}/UpdatePetDetails" class="dark-matter" onsubmit="copyDetails();return validateForm();">
<h1> Update Pet Details</h1>
<input type="hidden" name="petownerid" value="<%=request.getAttribute("ownerid")%>">
<input type="hidden" name="kcinumber" id="kcinumber">
<input type="hidden" name="microchipnumber" id="microchipnumber">
<input type="hidden" name="regnumber" id="regnumber">
*Name: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="petname" id="name" value="<%=request.getAttribute("name")%>">
<br>

*Breed: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="breed" id="breed" value="<%=request.getAttribute("breed")%>">
<br>
*Color: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="color" id="color" value="<%=request.getAttribute("color")%>">
<br>
DOB: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="datepicker"  name="dob" value="<%=request.getAttribute("dob")%>">
<br>
*Gender:&nbsp;&nbsp; 
<input type="radio" id="gender_male" value="female" class="radio" name="gender" checked="<%=request.getAttribute("gender_male")%>">Female
<input type="radio" id="gender_female" value="male" class="radio" name="gender" checked="<%=request.getAttribute("gender_female")%>">Male
<br>
<hr>
<h3>*Pet Type: </h3>
<input type="radio" id="pettype_cat" value="Cat" class="radio" name="pet"  onclick="showhidediv('cat');" checked="<%=request.getAttribute("pettype_cat")%>">Cat
<input type="radio"  id="pettype_dog" value="Dog" class="radio" name="pet"  onclick="showhidediv('dog');" checked="<%=request.getAttribute("pettype_dog")%>">Dog
<br>
<br>
<div class="dogdetails" id="dogdetails">
KCI Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="div_kcinumber" name="div_kcinumber">
<br>
MicroChipNumber: &nbsp;&nbsp;<input type="text" name="div_microchipnumber" id="div_microchipnumber">
<br>
</div>
<div class="catdetails" id="catdetails">
Reg Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="div_regnumber" name="div_regnumber">
<br>
</div>
<input type="submit" value="Submit" class="button">
</form>
</body>
</html>