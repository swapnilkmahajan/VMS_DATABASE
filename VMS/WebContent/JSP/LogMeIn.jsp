
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
    if(document.logmein.username.value=="")
    {
      alert("User Name should not be left blank");
      document.logmein.username.focus();
      return false;
    }
    else if(document.logmein.password.value=="")
    {
      alert("Password should not be left blank");
      document.logmein.password.focus();
      return false;
    }
}

</script>
</head>
<link rel="stylesheet" href="../CSS/style.css" media="screen" type="text/css" /></head>
<body>
 <div class="login-card">
	  <form action="" name="logmein" onSubmit="return validateForm()"> 
	  <center> 
	  <h3>Login </h3>
	  <img src="../Images/vet_doc_3.jpg" height="100" width="150" >
	  </center>
	  <br>
	  <input type="text" name="username"/>
	  <input type="password"  name="password" />
	  <input type="submit" class="login login-submit" value="login"/>
	  </form>
</div>
</body>
</html>