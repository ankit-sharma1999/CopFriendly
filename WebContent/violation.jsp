<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Violation</title>
<link href = "css/ViolationStyles.css" rel = "stylesheet">
<script type="text/javascript">
	function getLocation() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition);
	  } else { 
		  console.log("Geolocation is not supported by this browser.");
	  }
	}

	function showPosition(position) {
	  document.getElementById("loc").value = "Latitude: " + position.coords.latitude + 
	  " Longitude: " + position.coords.longitude;
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
		<form id= "contact" name="myForm" action ="Violation" method = "post">
			<h2>Violation Details</h2>
			<h3>Enter Viotalor's Details</h3>
			<fieldset>
				<input placeholder = "Violator's Name" type = "text" name= "violatorsName" pattern="[a-zA-Z\s]+" autocomplete= "off" required>
			</fieldset>
			
			<fieldset>
				<input placeholder = "Phone Number" type = "text" name= "mobNo" pattern="^[6-9]\d{9}$" autocomplete= "off">
			</fieldset>
			
			<h3>Violation Type</h3>
			<fieldset>
				<select id = "custom-select" name = "violationType">
					<option value="Without Licence">Driving without DL</option>
					<option value="Speed Limit">Speed Limit</option>
					<option value="Rash Driving">Rash Driving</option>
					<option value="Drunk Driving">Drunk Driving</option>
					<option value="Overload">Overloading</option>
					<option value="Uninsurance Vehicle">Driving Uninsured Vehicle</option>
					<option value="Without helmet">Driving without Helmet</option>
					<option value="Using Phone">Using Phone while Driving</option>
					<option value="Avoiding Ambulance">Avoiding an Ambulance</option>
				</select>
			</fieldset>
			
			<fieldset>
				<input placeholder = "Driving Liscence" type = "text" name = "drivingLicence" pattern = "^([A-Z]{2})([0-9]{2})((19|20)[0-9]{2})([0-9]{7})$" autocomplete= "off">
			</fieldset>
			<h3>Enter Vehicle's Details</h3>
			<fieldset>
				<select id = "custom-select" name = "vehicleType">
					<option value="car">Car</option>
					<option value="bike">Bike</option>
					<option value="lorry">Lorry</option>
				</select>
			</fieldset>
			<fieldset>
				<input placeholder = "Vehicle Number" type = "text" name= "vehicleNo" pattern = "^[A-Z]{2}\s[0-9]{2}\s[A-Z]{2}\s[0-9]{4}$" autocomplete= "off" required>
			</fieldset>
			<fieldset>
				<input type = "datetime-local" name = "dateAndTime" required>
			</fieldset>
			<fieldset>
				<input placeholder = "Location" type = "text" id = "loc" name = "location" autocomplete= "off" required>
			</fieldset>
			<p>Repeated Offender?</p>
			<fieldset>
				<select id = "custom-select" name = "repeatedOffender">
					<option value="1">YES</option>
					<option value="0">NO</option>
				</select>
			</fieldset>
			<fieldset>
				<input placeholder = "Fine Amount" type = "number" name= "fine" required>
			</fieldset>
			
			<fieldset>
		      <button name="submit" type="submit" id="contact-submit" >Raise Ticket</button>
		    </fieldset>
			
		</form>
	</div>

</body>
</html>