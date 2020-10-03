<%@page import="service.SOSDetails"%>
<%@page import="java.util.*"%>
<%@page import="service.SOS"%>
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
	function mapLocation()
	{
		var location = document.getElementById("location").value;
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
			if(!session.getAttribute("User").equals("Central"))
			{
				response.sendRedirect("index.jsp");
			}
		}
		else{
			response.sendRedirect("index.jsp");
		}
	%>

	<%
		SOSDetails data = new SOSDetails();
		ArrayList<SOS> e = data.getSOSDetails();
	%>
	
	<div class="table-responsive">
	  <table class="table table-striped">
	   	<thead class = "thead-dark table-head">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Cop Name</th>
		      <th scope="col">Contact Number</th>
		      <th scope="col">Location</th>
		      <th scope="col">Map</th>
		      <th scope="col">Send Help</th>
		    
		    </tr>
		  </thead>
		  <tbody class="t-body">
		  <% for(SOS i: e)
		  { String val[] = (i.getLocation()).split(" "); 
		  	 String res = val[0]+","+val[1];%>
			  <tr>
		      <td><%= i.getId()%></td>
		      <td><%= i.getName()%></td>
		      <td><%= i.getMob()%></td>
		      <td><%= i.getLocation()%></td>
		      <td><button class="btn btn-md btn-block btn-light" id="location" onclick = "mapLocation()" value = <%= res%>>See on Map</button></td>
		      <td>
		      <form action = "SendSOSHelp" method = "post">
            	<button class="btn btn-md btn-block btn-dark" type="submit" name= "getHelp" value = <%= i.getId() %>>Send Help</button>
              </form>
		      </td>
		    </tr>
		 <% } %> 
		    
		
		  </tbody>

	  </table>
	</div>

</body>
</html>