<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />
<script>
function populatePetID(id)
{
	alert("pet id="+id);
	document.getElementById('petid').value=id;
	
	}
</script>
<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/ChoosePet">
<input type="text" name="petid" id="petid">
<input type="hidden" name="petownerid" value="<%=request.getAttribute("ownerid")%>">
<h1> Choose Pet to set an appointment:</h1>
<br><br><br>
<table class="table tableshow">
                    <thead>
                        <tr>
                        	<th> Choose </th>
                            <th>Pet Name</th>
							<th>Pet Type</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pets}" var="pets">
                    <tr>
                    	<td> <input type="radio" value="${pets.getId()}" name="petid"  onclick="populatePetID('${pets.getId()}')">
                        <td>${pets.getName()}</td>
    					<td>${pets.getType()}</td>
                    </tr>
                    </c:forEach>

                    </tbody>

 </table>
<input type="submit" name="submit" value="Submit">
</form>
</body>
</html>