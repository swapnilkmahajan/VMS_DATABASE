<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function setiframeURL(url){
    document.getElementById('petiframe').src = url;
}
</script>
</head>
<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" /></head>

<body>
<form class="dark-matter">
<h1> New Pet Details</h1>
<input type="hidden" name="petownerid">
*Breed: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="breed">
<br>
*Color: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="breed">
<br>
DOB: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="dob">
<br>
*Gender:&nbsp;&nbsp; <input type="text" name="gender">
<br>
<hr>
<h3>Pet Type: </h3>
<input type="radio" value="Cat" class="radio" name="pet" onchange="setiframeURL('CatDetails.jsp')">Cat
<input type="radio" value="Dog" class="radio" name="pet" onchange="setiframeURL('DogDetails.jsp')">Dog
<br>
<br>
<iframe height=200px width=500px src="" id="petiframe"></iframe>
<br><br>
<input type="button" value="Submit" class="button">
</form>
</body>
</html>