<%@page import="service.EmergencyDetails"%>
<%@page import="java.util.*"%>
<%@page import="service.Emergency"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CopFriendly</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript">
function getLocation()
{
	var location = document.getElementById("loc").value;
	var items = location.split(',');
	var lat = items[0];
	var lon = items[1];
	var loc = lat+"+"+lon;
	var URL = "http://maps.google.com/maps?z=12&t=m&q=loc:"+loc; 
	window.location.href = URL;
	
}

</script>
</head>
<body style = "text-align: center">
	
	<%
		if(session.getAttribute("User")!=null)
		{
			if(!session.getAttribute("User").equals("Medical"))
			{
				response.sendRedirect("index.jsp");
			}
		}
		else{
			response.sendRedirect("index.jsp");
		}
	%>

	<%
		EmergencyDetails data = new EmergencyDetails();
		ArrayList<Emergency> e = data.getEmergencyDetails();
	%>
	
	<div class="table-responsive">
	  <table class="table table-striped">
	   	<thead class = "thead-dark table-head">
		    <tr>
		      <th scope="col">Priority</th>
		      <th scope="col">Location</th>
		      <th scope="col">See Map</th>
		      <th scope="col">People Affected</th>
		      <th scope="col">Accident Type</th>
		      <th scope="col">Send Help</th>
		    
		    </tr>
		  </thead>
		  <tbody class="t-body">
		  <% for(Emergency i: e)
		  {  String val[] = (i.location).split(" "); 
		  	 String res = val[0]+","+val[1]; %>
			  <tr>
		      <td><%= i.priority%></td>
		      <td><%= i.location %></td>
		      <td><button class="btn btn-md btn-block btn-dark" type = "button" id = "loc" value = <%= res %> onclick = "getLocation()">See on Map</button></td>
		      <td><%= i.noPeople%></td>
		      <td><%= i.accidentType%></td>
		      <td>
		      <form action = "SendHelp" method = "post">
            	<button class="btn btn-md btn-block btn-dark" type="submit" name= "getHelp" value = <%= i.sl %>>Send Help</button>
              </form>
		      </td>
		    </tr>
		 <%} %> 
		    
		
		  </tbody>

	  </table>
	</div>

</body>
</html>