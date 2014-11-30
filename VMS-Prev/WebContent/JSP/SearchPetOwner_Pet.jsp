<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Pet by Pet PetOwner</title>
</head>
<link rel="stylesheet" href="../CSS/DarkMatter.css" media="screen" type="text/css" /></head>

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/SearchPetOwner_Pet">
<h2> Enter Pet Owner Email:</h2>
<br>
<input type="text" name="owneremail">
<input type="submit" class="button">
</form>
</body>
</html>