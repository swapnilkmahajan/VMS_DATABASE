<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New PetDetails</title>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
    $(".dogdetails").hide();
    $(".catdetails").hide();
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
<form action="${pageContext.request.contextPath}/NewPetDetails" class="dark-matter" onsubmit="copyDetails();">
<h1> New Pet Details</h1>
<input type="hidden" name="petownerid" value="<%=request.getAttribute("ownerid")%>">
<input type="hidden" name="kcinumber" id="kcinumber">
<input type="hidden" name="microchipnumber" id="microchipnumber">
<input type="hidden" name="regnumber" id="regnumber">
*Name: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="petname">
<br>

*Breed: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="breed">
<br>
*Color: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="color">
<br>
DOB: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="datepicker"  name="dob">
<br>
*Gender:&nbsp;&nbsp; 
<input type="radio" value="female" class="radio" name="gender">Female
<input type="radio" value="male" class="radio" name="gender">Male
<br>
<hr>
<h3>Pet Type: </h3>
<input type="radio"  value="Cat" class="radio" name="pet"  onclick="showhidediv('cat');">Cat
<input type="radio"  value="Dog" class="radio" name="pet"  onclick="showhidediv('dog');">Dog
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