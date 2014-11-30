<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  function isAfter(){
	  var fromTime=document.getElementById('starttime').value;
	  var toTime=document.getElementById('endtime').value;
	  
	  var fromTokens = fromTime.split(":");
	  var toTokens = toTime.split(":");
	  if(document.getElementById('datepicker').value=="")
		  {
		  alert("Please choose an appointment date");
		  return false;
		  }
	  if (fromTokens[0] > toTokens[0] || (fromTokens[0] == toTokens[0] && fromTokens[1] >= toTokens[1]))
		  {
		  	alert("Start time should be less than End time");
		  	return false;
		  }
	}
  </script>
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" media="screen" type="text/css" /></head>
<body>
<form action="${pageContext.request.contextPath}/UpdateThisAppointment" class="dark-matter" onsubmit="return isAfter();">
<input type="hidden" name="appointmentid" value="<%=request.getAttribute("appointmentid")%>">
<h1>Update Appointment</h1>
*Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="basic-grey" type="text" id="datepicker" name="appointmentdate" value="<%=request.getAttribute("appointmentdate")%>"/> 
<br>
Start Time:
&nbsp;&nbsp;
<select name="starttime" id="starttime">
<option value="09:00:00" <%if((request.getAttribute("starttime"))=="09:00:00"){%> selected <%}%>>09:00 am </option>
<option value="09:15:00" <%if((request.getAttribute("starttime"))=="09:15:00"){%> selected <%}%>>09:15 am </option>
<option value="09:30:00" <%if((request.getAttribute("starttime"))=="09:30:00"){%> selected <%}%>>09:30 am </option>
<option value="09:45:00" <%if((request.getAttribute("starttime"))=="09:45:00"){%> selected <%}%>>09:45 am </option>

<option value="10.00:00" <%if((request.getAttribute("starttime"))=="10:00:00"){%> selected <%}%>>10:00 am </option>
<option value="10.15:00" <%if((request.getAttribute("starttime"))=="10:15:00"){%> selected <%}%>>10:15 am </option>
<option value="10.30:00" <%if((request.getAttribute("starttime"))=="10:30:00"){%> selected <%}%>>10:30 am </option>
<option value="10.45:00" <%if((request.getAttribute("starttime"))=="10:45:00"){%> selected <%}%>>10:45 am </option>

<option value="11.00:00" <%if((request.getAttribute("starttime"))=="11:00:00"){%> selected <%}%>>11:00 am </option>
<option value="11.15:00" <%if((request.getAttribute("starttime"))=="11:15:00"){%> selected <%}%>>11:15 am </option>
<option value="11.30:00" <%if((request.getAttribute("starttime"))=="11:30:00"){%> selected <%}%>>11:30 am </option>
<option value="11.45:00" <%if((request.getAttribute("starttime"))=="11:45:00"){%> selected <%}%>>11:45 am </option>

<option value="12.00:00" <%if((request.getAttribute("starttime"))=="12:00:00"){%> selected <%}%>>12:00 pm </option>
<option value="12.15:00" <%if((request.getAttribute("starttime"))=="12:15:00"){%> selected <%}%>>12:15 pm </option>
<option value="12.30:00" <%if((request.getAttribute("starttime"))=="12:30:00"){%> selected <%}%>>12:30 pm </option>
<option value="12.45:00" <%if((request.getAttribute("starttime"))=="12:45:00"){%> selected <%}%>>12:45 pm </option>

<option value="13.00:00" <%if((request.getAttribute("starttime"))=="13:00:00"){%> selected <%}%>>01:00 pm </option>
<option value="13.15:00" <%if((request.getAttribute("starttime"))=="13:15:00"){%> selected <%}%>>01:15 pm </option>
<option value="13.30:00" <%if((request.getAttribute("starttime"))=="13:30:00"){%> selected <%}%>>01:30 pm </option>
<option value="13.45:00" <%if((request.getAttribute("starttime"))=="13:45:00"){%> selected <%}%>>01:45 pm </option>

<option value="14.00:00" <%if((request.getAttribute("starttime"))=="14:00:00"){%> selected <%}%>>02:00 pm </option>
<option value="14.15:00" <%if((request.getAttribute("starttime"))=="14:15:00"){%> selected <%}%>>02:15 pm </option>
<option value="14.30:00" <%if((request.getAttribute("starttime"))=="14:30:00"){%> selected <%}%>>02:30 pm </option>
<option value="14.45:00" <%if((request.getAttribute("starttime"))=="14:45:00"){%> selected <%}%>>02:45 pm </option>

<option value="15.00:00" <%if((request.getAttribute("starttime"))=="15:00:00"){%> selected <%}%>>03:00 pm </option>
<option value="15.15:00" <%if((request.getAttribute("starttime"))=="15:15:00"){%> selected <%}%>>03:15 pm </option>
<option value="15.30:00" <%if((request.getAttribute("starttime"))=="15:30:00"){%> selected <%}%>>03:30 pm </option>
<option value="15.45:00" <%if((request.getAttribute("starttime"))=="15:45:00"){%> selected <%}%>>03:45 pm </option>

<option value="16.00:00" <%if((request.getAttribute("starttime"))=="16:00:00"){%> selected <%}%>>04:00 pm </option>
<option value="16.15:00" <%if((request.getAttribute("starttime"))=="16:15:00"){%> selected <%}%>>04:15 pm </option>
<option value="16.30:00" <%if((request.getAttribute("starttime"))=="16:30:00"){%> selected <%}%>>04:30 pm </option>
<option value="16.45:00" <%if((request.getAttribute("starttime"))=="16:45:00"){%> selected <%}%>>04:45 pm </option>

<option value="17.00:00" <%if((request.getAttribute("starttime"))=="17:00:00"){%> selected <%}%>>05:00 pm </option>
<option value="17.15:00" <%if((request.getAttribute("starttime"))=="17:15:00"){%> selected <%}%>>05:15 pm </option>
<option value="17.30:00" <%if((request.getAttribute("starttime"))=="17:30:00"){%> selected <%}%>>05:30 pm </option>
<option value="17.45:00" <%if((request.getAttribute("starttime"))=="17:45:00"){%> selected <%}%>>05:45 pm </option>

</select>

<br>
End Time:
&nbsp;&nbsp;&nbsp;
<select name="endtime" id="endtime">
<option value="09:15:00" <%if((request.getAttribute("endtime"))=="09:15:00"){%> selected <%}%>>09:15 am </option>
<option value="09:30:00" <%if((request.getAttribute("endtime"))=="09:30:00"){%> selected <%}%>>09:30 am </option>
<option value="09:45:00" <%if((request.getAttribute("endtime"))=="09:45:00"){%> selected <%}%>>09:45 am </option>

<option value="10.00:00" <%if((request.getAttribute("endtime"))=="10:00:00"){%> selected <%}%>>10:00 am </option>
<option value="10.15:00" <%if((request.getAttribute("endtime"))=="10:15:00"){%> selected <%}%>>10:15 am </option>
<option value="10.30:00" <%if((request.getAttribute("endtime"))=="10:30:00"){%> selected <%}%>>10:30 am </option>
<option value="10.45:00" <%if((request.getAttribute("endtime"))=="10:45:00"){%> selected <%}%>>10:45 am </option>

<option value="11.00:00" <%if((request.getAttribute("endtime"))=="11:00:00"){%> selected <%}%>>11:00 am </option>
<option value="11.15:00" <%if((request.getAttribute("endtime"))=="11:15:00"){%> selected <%}%>>11:15 am </option>
<option value="11.30:00" <%if((request.getAttribute("endtime"))=="11:30:00"){%> selected <%}%>>11:30 am </option>
<option value="11.45:00" <%if((request.getAttribute("endtime"))=="11:45:00"){%> selected <%}%>>11:45 am </option>

<option value="12.00:00" <%if((request.getAttribute("endtime"))=="12:00:00"){%> selected <%}%>>12:00 pm </option>
<option value="12.15:00" <%if((request.getAttribute("endtime"))=="12:15:00"){%> selected <%}%>>12:15 pm </option>
<option value="12.30:00" <%if((request.getAttribute("endtime"))=="12:30:00"){%> selected <%}%>>12:30 pm </option>
<option value="12.45:00" <%if((request.getAttribute("endtime"))=="12:45:00"){%> selected <%}%>>12:45 pm </option>

<option value="13.00:00" <%if((request.getAttribute("endtime"))=="13:00:00"){%> selected <%}%>>01:00 pm </option>
<option value="13.15:00" <%if((request.getAttribute("endtime"))=="13:15:00"){%> selected <%}%>>01:15 pm </option>
<option value="13.30:00" <%if((request.getAttribute("endtime"))=="13:30:00"){%> selected <%}%>>01:30 pm </option>
<option value="13.45:00" <%if((request.getAttribute("endtime"))=="13:45:00"){%> selected <%}%>>01:45 pm </option>

<option value="14.00:00" <%if((request.getAttribute("endtime"))=="14:00:00"){%> selected <%}%>>02:00 pm </option>
<option value="14.15:00" <%if((request.getAttribute("endtime"))=="14:15:00"){%> selected <%}%>>02:15 pm </option>
<option value="14.30:00" <%if((request.getAttribute("endtime"))=="14:30:00"){%> selected <%}%>>02:30 pm </option>
<option value="14.45:00" <%if((request.getAttribute("endtime"))=="14:45:00"){%> selected <%}%>>02:45 pm </option>

<option value="15.00:00" <%if((request.getAttribute("endtime"))=="15:00:00"){%> selected <%}%>>03:00 pm </option>
<option value="15.15:00" <%if((request.getAttribute("endtime"))=="15:15:00"){%> selected <%}%>>03:15 pm </option>
<option value="15.30:00" <%if((request.getAttribute("endtime"))=="15:30:00"){%> selected <%}%>>03:30 pm </option>
<option value="15.45:00" <%if((request.getAttribute("endtime"))=="15:45:00"){%> selected <%}%>>03:45 pm </option>

<option value="16.00:00" <%if((request.getAttribute("endtime"))=="16:00:00"){%> selected <%}%>>04:00 pm </option>
<option value="16.15:00" <%if((request.getAttribute("endtime"))=="16:15:00"){%> selected <%}%>>04:15 pm </option>
<option value="16.30:00" <%if((request.getAttribute("endtime"))=="16:30:00"){%> selected <%}%>>04:30 pm </option>
<option value="16.45:00" <%if((request.getAttribute("endtime"))=="16:45:00"){%> selected <%}%>>04:45 pm </option>

<option value="17.00:00" <%if((request.getAttribute("endtime"))=="17:00:00"){%> selected <%}%>>05:00 pm </option>
<option value="17.15:00" <%if((request.getAttribute("endtime"))=="17:15:00"){%> selected <%}%>>05:15 pm </option>
<option value="17.30:00" <%if((request.getAttribute("endtime"))=="17:30:00"){%> selected <%}%>>05:30 pm </option>
<option value="17.45:00" <%if((request.getAttribute("endtime"))=="17:45:00"){%> selected <%}%>>05:45 pm </option>

<option value="18.00:00" <%if((request.getAttribute("endtime"))=="18:00:00"){%> selected <%}%>>06:00 pm </option>

</select>

<br>
Notes:
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<textarea rows=20 name="notes">
<c:out value="${notes}" />
</textarea> 
<br>
<input type="submit" value="Update" class="button">

</form>

</body>
</html>