<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "service.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CopFriendly</title>
<link href = "css/registerStyles.css" rel = "stylesheet">
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
		User u = null;
		if(session.getAttribute("User")!=null)
		{
			if(!session.getAttribute("User").equals("Sergeant"))
			{
				response.sendRedirect("index.jsp");
				
			}
			else{
				if(session.getAttribute("userDetails")!=null)
				{
					u = (User)session.getAttribute("userDetails");
				}
			}
			
		}
		else{
			response.sendRedirect("index.jsp");
		}
	%> 

	<div class = "container">
		<form id= "contact" name="myForm" action ="sos" method = "post">
			
			<h2>Your Details</h2>
			
			<fieldset>
				<input placeholder = "Name" type = "text" name= "fullName" pattern="[a-z\sA-Z]+" value = "<%= u.getName() %>" autocomplete= "off" required>
			</fieldset>
			
			<fieldset>
				<input placeholder = "Phone Number" type = "number" name= "mobNo" pattern="[6-9][0-9]{9}" value = "<%= u.getMobNo() %>" autocomplete= "off" required>
			</fieldset>
			
			<h3>Your Location</h3>
			
			<fieldset>
				<input placeholder = "Location" type = "text" id= "loc" name= "location" value = "Location not found" autocomplete= "off" required>
			</fieldset>
			
			<fieldset>
		      <button name="submit" type="submit" id="contact-submit">Submit Details</button>
		    </fieldset>
			
		</form>
	</div>

</body>
</html>