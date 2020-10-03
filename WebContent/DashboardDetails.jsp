<%@page import="java.util.*"%>
<%@page import="service.Violation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="service.ViolationDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CopFriendly</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style type="text/css">
	body{
		/* background: #85a392; */
		text-align: center;
	}

	.table-head {
		font-size: 1.5rem;
	}
	
</style>
</head>
<body>

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
		ViolationDetailsService data = new ViolationDetailsService();
		ArrayList<Violation> v = data.getViolationDetails();
	%>
	
	<div class="table-responsive">
	  <table class="table table-striped">
	   	<thead class = "thead-dark table-head">
		    <tr>
		      <th scope="col">Vehicle Number</th>
		      <th scope="col">Violator's Name</th>
		      <th scope="col">Vehicle Type</th>
		      <th scope="col">Driving License</th>
		      <th scope="col">Violation Type</th>
		      <th scope="col">Fine</th>
		    </tr>
		  </thead>
		  <tbody class="t-body">
		  <% for(Violation i: v)
		  { %>
			  <tr>
		      <td><%= i.vNo%></td>
		      <td><%= i.name %></td>
		      <td><%= i.vType%></td>
		      <td><%= i.dLicence%></td>
		      <td><%= i.violationType%></td>
		      <td><%= i.fine%></td>
		    </tr>
		 <%} %> 
		    
		
		  </tbody>

	  </table>
	</div>

</body>
</html>