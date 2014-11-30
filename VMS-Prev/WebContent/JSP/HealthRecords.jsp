<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Health Records</title>

 <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="functions.js"></script>
 <script>
 function setRowCount(){
	 var table = document.getElementById("vaccinationdetails");
	 var lastRow = table.rows.length;
	 document.getElementById('rowcount').value=lastRow;
	 alert(document.getElementById('rowcount').value);
 }
 function Add(){

	    var table = document.getElementById("vaccinationdetails");
	    var lastRow = table.rows.length;

	    var iteration = lastRow;
	    var row = table.insertRow(lastRow);
	    // left cell
	    var cellLeft = row.insertCell(0);
	    var textNode = document.createTextNode(iteration);
	    cellLeft.appendChild(textNode);
	    
	    // middle cell
	    var cellMiddle = row.insertCell(1);
	    var e1 = document.createElement('select');
	    e1.type='select';
	    e1.class='select';
	    e1.id= 'vaccination' + iteration;
	    e1.name= 'vaccination' + iteration;
	    alert(e1.name);
	    var option = document.createElement("option");
	    option.text = "Rabies";
	    var option1 = document.createElement("option");
	    option1.text = "seven in one";
	    e1.add(option);
	    e1.add(option1);
	    cellMiddle.appendChild(e1);
	    
	    // right cell
	    var cellRight = row.insertCell(2);
	    var e2 = document.createElement('input');
	    e2.type = 'text';
	    e2.name = 'datepicker'+ iteration;
	    e2.id =  'datepicker' + iteration;
	    alert(e2.name);
	    e2.class='basic-grey';
	    cellRight.appendChild(e2);
	    
	    
	  // last cell
	    var lastcell = row.insertCell(3);
	    var e3=document.createElement('input');
	    e3.type='button' ;
	    e3.name='Cancel';
	    e3.id='cancel'+iteration;
	    e3.setAttribute('class','button');
	    e3.setAttribute('value', 'Cancel');
	    e3.onclick = function () {deleteCurrentRow(this)};
	    lastcell.appendChild(e3);
	   }
 
 function deleteCurrentRow(t)
 {
     var row = t.parentNode.parentNode;
     document.getElementById("vaccinationdetails").deleteRow(row.rowIndex);
 }
 </script>
</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CSS/DarkMatter.css" />

<body>
<form class="dark-matter" action="${pageContext.request.contextPath}/HealthRecords">
<input type="hidden" name="aptid" id="aptid" value="<%=request.getAttribute("aptid")%>">
<input type="hidden" name="rowcount" id="rowcount">

<h2>Health Record Details:</h2>
Height: &nbsp;&nbsp;<input type="text" name="height">
<br>
Weight: &nbsp;<input type="text" name="weight">
<h2>Vaccination Details:</h2>

<input type="button" name="addRow" value="Add a Vaccine" class="button" onclick="Add();">
<br>
<br>
<table id="vaccinationdetails" class="mytable">
	<tbody>
	   <tr>
			<td> Number </td>
			<td> Name </td>
			<td> Date </td>
			<td> Action </td>
		</tr>
	</tbody>
</table>
<input type="submit" value="Submit" class="button" onclick="setRowCount();">
</form>

</body>
</html>