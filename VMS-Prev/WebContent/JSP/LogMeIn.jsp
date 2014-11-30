<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
<script>
function validateForm()
{
    if(document.getElementById('username').value=="")
    {
      alert("User Name should not be left blank");
      return false;
    }
    if(document.getElementById('password').value=="")
    {
      alert("Password should not be left blank");
      return false;
    }
}
</script>

</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css" />

<body>
	  <form class="login-card" action="${pageContext.request.contextPath}/Login" method="post" name="logmein" onsubmit="return validateForm();">
	  <center>
	  <h3> Login </h3>
	  <img src="${pageContext.request.contextPath}/Images/vet_doc_3.jpg" height="100" width="150" >
	  </center>
	  <br>
	  <input type="text" name="username" id="username"/>
	  <input type="text" name="password" id="password"/>
	  <input type="submit" class="login login-submit" value="Login"/>
	  </form>
</body>
</html>