<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search Records</title>
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
<script>
  $(document).ready(function() {

    $(".dogorcat").hide();
    $(".pet-type").hide();

  });
 
  </script>
   <script language="JavaScript" type="text/javascript">
  function showdiv(){
	
	  $(".dogorcat").show();
	  $(".pet-type").hide();
	  document.getElementById("searchbytext").disabled=false;
	  document.getElementById('regdetails').value="";
	  document.getElementById('pettype').value="";
 }
  
  function hidediv(){
		$(".dogorcat").hide();
		$(".pet-type").hide();  
		document.getElementById("searchbytext").disabled=false;
		 document.getElementById('regdetails').value="";
		 document.getElementById('pettype').value="";
	 }
  
  function showpettypediv(){
		$(".dogorcat").hide();
		$(".pet-type").show();
		document.getElementById("searchbytext").disabled=true;
		 document.getElementById('regdetails').value="";
		 document.getElementById('pettype').value="";
	 }
  
  function setDogOrCat(val){
	  document.getElementById('regdetails').value=val.value;
	  
  }
  
  function setpettype(val){
	  document.getElementById('pettype').value=val.value;
	  
  }
  function setsearchtype(val){
	  document.getElementById('searchbasedon').value=val.value;
  }
</script>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/SearchRecords">
<input type="hidden" name="regdetails" id="regdetails">
<input type="hidden" name="pettype" id="pettype">
<input type="text" name="searchbasedon" id="searchbasedon">
<h2>Enter search string here: </h2>
<input type="text" name="searchbytext" id="searchbytext">
<br>
<input type="radio" name="searchtype" value="OwnerName" onclick="hidediv();setsearchtype(this);"> Owner Name
<br>
<br>
<input type="radio" name="searchtype" value="RegistrationorMicrochipNumber" onclick="showdiv();setsearchtype(this);"> Registration/Microchip Number

<div class="dogorcat" id="dogorcat">
<br>
Pet Type: 
<input type="radio"  value="Cat" class="radio" name="pet" onclick="setDogOrCat(this)">Cat
<input type="radio"  value="Dog" class="radio" name="pet" onclick="setDogOrCat(this)">Dog
<br>
</div>
<br>
<br>
<input type="radio" name="searchtype" value="PetName" onclick="hidediv();setsearchtype(this);"> Pet Name
<br>
<br>
<input type="radio" name="searchtype" value="PetType" onclick="showpettypediv();setsearchtype(this);"> Pet Type
<div class="pet-type" id="pet-type">
<br>
Pet Type: 
<input type="radio"  value="Cat" class="radio" name="typeofpet" onclick="setpettype(this)">Cat
<input type="radio"  value="Dog" class="radio" name="typeofpet" onclick="setpettype(this)">Dog
<br>
</div>
<br>
<br>
<input type="radio" name="searchtype" value="Breed" onclick="hidediv();setsearchtype(this);"> Breed

<br>
<br>
<input type="submit" class="button" value="Search">
</form>
</body>
</html> 