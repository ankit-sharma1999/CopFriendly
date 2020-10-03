<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Emergency</title>
<link href = "css/emergStyles.css" rel = "stylesheet">
<script>

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
	  console.log("Geolocation is not supported by this browser.");
  }
}

function showPosition(position) {
  document.getElementById("loc").value = position.coords.latitude+" "+position.coords.longitude;
}
</script>
</head>
<body onload="getLocation()">

	<%
		if(session.getAttribute("User")!=null)
		{
			if(!session.getAttribute("User").equals("Sergeant"))
			{
				response.sendRedirect("index.jsp");
			}
		}
		else{
			response.sendRedirect("index.jsp");
		}
	%>

	<div class = "container">
		<form id= "contact" name="myForm" action ="Emergency" method = "post">
			<h2>Accidents Details</h2>
			
			<fieldset>
				<input placeholder = "Location" type = "text" id = "loc" name= "location" autocomplete= "off" required>
			</fieldset>
			
			<p>Accident Type</p>
			<fieldset>
				<select id = "custom-select" name = "accidentType">
					<option value="Vehicle Rollover">Vehicle RollOver</option>
					<option value="Single car Accident">Single Car Accident</option>
					<option value="Rear-end Collision">Rear-end Collision</option>
					<option value="Side-Impact Collision">Side-impact Collision</option>
					<option value="Head-On Collision">Head-on Collision</option>
				</select>
			</fieldset>
			
			<fieldset>
				<input placeholder = "Priority(1-5)" type = "number" name= "priority" max= "5" min = "1" autocomplete= "off" required>
			</fieldset>
			
			<fieldset>
				<input placeholder = "Number of Peaople Affected" type = "number" name= "noPeople" min="1" autocomplete= "off" required>
			</fieldset>
			
			<fieldset>
		      <button name="submit" type="submit" id="contact-submit">Submit</button>
		    </fieldset>
			
		</form>
	</div>

</body>
</html>