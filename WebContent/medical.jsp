<%@ page import = "service.EmergencyDetails" %>
<%@ page import = "service.Emergency" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CopFriendly</title>
<!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu" rel="stylesheet">

  <!-- CSS Stylesheets -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="css/medical.css">
  <style>
  	.map {
  		display: none; 
  		height:200px; 
  		margin-bottom:10px;
  	}
  </style> 

  <!-- Font Awesome -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

  <!-- Bootstrap Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
	function getLocation(lat,lon,clicked_id){
		console.log(lat,lon,clicked_id);
		var latlong = new google.maps.LatLng(lat, lon);
		var id = null;
		if(clicked_id === "button1")
			id = "mapArea1"; 
		if(clicked_id === "button2")
			id = "mapArea2";
		if(clicked_id === "button3")
			id = "mapArea3";

		document.getElementById(id).style.display= "block";
		
	    var myOptions = {
	        center: latlong,
	        zoom: 16,
	        mapTypeControl: true,
	        navigationControlOptions: {
	            style:google.maps.NavigationControlStyle.SMALL
	        }
	    }
	    
	    var map = new google.maps.Map(document.getElementById(id), myOptions);
	    var marker = new google.maps.Marker({ position:latlong, map:map, title:"You are here!" });
	}

	function showError(error) {
	    if(error.code == 1) {
	        result.innerHTML = "You've decided not to share your position, but it's OK. We won't ask you again.";
	    } else if(error.code == 2) {
	        result.innerHTML = "The network is down or the positioning service can't be reached.";
	    } else if(error.code == 3) {
	        result.innerHTML = "The attempt timed out before it could get the location data.";
	    } else {
	        result.innerHTML = "Geolocation failed due to unknown error.";
	    }
	}
</script>

</head>
<body>

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
	
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache");
	%>
	
	<section class="colored-section" id="title">

    <div class="container-fluid">

      <!-- Nav Bar -->

      <nav class="navbar navbar-expand-lg navbar-dark">

        <a class="navbar-brand" href="">CopFriendly</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">

          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="#emergency">Emergency</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#AandT">Ambulance and Staff</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Logout">Log Out</a>
            </li>
          </ul>

        </div>
      </nav>
	 </div>
	</section>
	
	<section class="white-section" id="emergency-box">
	
	<%
		EmergencyDetails data = new EmergencyDetails();
		ArrayList<Emergency> e = data.getEmergencyDetails();
	%>

    <h2 class="section-heading">Instantly provide Emergency Service</h2>
    <p>Send Ambulance and Team to the highest priority Emergency Location easily.</p>

    <div class="row">
    
    <%if(e.size()!=0)
    {String res[] = (e.get(0).location).split(" ");
     String lat = res[0];
     String lon = res[1];%>

      <div class="emergency-column col-lg-4 col-md-6">
        <div class="card">
          <div class="card-header">
            <h3>
            <%= e.get(0).location %>
            </h3>
            <button id = "button1" class = "btn btn-md btn-dark" onclick = "getLocation('<%=lat%>','<%=lon%>',this.id)" >Show in Map</button>
          </div>
          <div class="card-body">
          	<div id = "mapArea1" class = "map" style = "margin: 0;"></div>
            <p>
            <%= e.get(0).noPeople %>
            people affected.</p>
            <p>
            <%= e.get(0).accidentType %>
            </p>
            <% int val = e.get(0).sl; %>
            <form action = "SendMedicalHelp" method = "post">
            	<button class="btn btn-lg btn-block btn-dark" type="submit" name= "getHelp" value = <%= e.get(0).sl %>>Send Help</button>
            </form>
            
          </div>
        </div>
      </div>
	<%} %>
	
	<%if(e.size()>1)
    { String res[] = (e.get(0).location).split(" ");
     String lat = res[0];
     String lon = res[1];%>
	
      <div class="emergency-column col-lg-4 col-md-6" id = "emergency">
        <div class="card">
          <div class="card-header">
            <h3>
			<%= e.get(1).location %>
			</h3>
			<button id = "button2" class = "btn btn-md btn-dark" onclick = "getLocation('<%=lat%>','<%=lon%>',this.id)">Show in Map</button>
          </div>
          <div class="card-body">
          	<div id = "mapArea2" class = "map"></div>
            <p><%= e.get(1).noPeople %>
             people affected.</p>
            <p>
            <%= e.get(1).accidentType %>
            </p>
  
            <form action = "SendMedicalHelp" method = "post">
            	<button class="btn btn-lg btn-block btn-dark" type="submit" name= "getHelp" value = <%= e.get(1).sl %>>Send Help</button>
            </form>
          </div>
        </div>
      </div>

	<%} %>
	
	<%if(e.size()>2)
    {String res[] = (e.get(0).location).split(" ");
    String lat = res[0];
    String lon = res[1]; %>

      <div class="emergency-column col-lg-4" id = "sos">
        <div class="card">
          <div class="card-header">
            <h3>
            <%= e.get(2).location %>
            </h3>
            <button id = "button3" class = "btn btn-md btn-dark" onclick = "getLocation('<%=lat%>','<%=lon%>',this.id)">Show in Map</button>
          </div>
          <div class="card-body">
          	<div id = "mapArea3" class = "map"></div>
            <p><%= e.get(2).noPeople %>
             people affected</p>
            <p>
			<%= e.get(2).accidentType %>
			</p>
            <% int val = e.get(0).sl; %>
            <form action = "SendMedicalHelp" method = "post">
            	<button class="btn btn-lg btn-block btn-dark" type="submit" name= "getHelp" value = <%= e.get(2).sl %>>Send Help</button>
            </form>

          </div>
        </div>
      </div>
      
    <%} %>

    </div>
    
    <form action="EmergencyDetails.jsp" method = "post">
    	<button class="btn btn-lg btn-dark">Show More  <i class="fas fa-arrow-alt-circle-right"></i></button>
    </form>

  </section>
  
  <section class="colored-section" id="AandT">

	    <div id="dashboard-carousel" class="carousel slide" data-interval = "3000">
	      <div class="carousel-inner">
	        <div class="carousel-item active container-fluid">
	          <h2 class="dashboard-text">Total Ambulance available</h2>
	          <img class="dashboard-image" src="Images/Ambulance.jpg" alt="violation-image">
	          
	          <h1>
	          	<%= Emergency.amb %>
	          </h1>
	        </div>
	        <div class="carousel-item container-fluid">
	          <h3 class="dashboard-text">Total Staff available</h3>
	          <img class="dashboard-image" src="Images/carouselfine.jpg" alt="fine-image">
	        	          
		      <h1>
	          	<%= Emergency.emp %>
	          </h1>
	        </div>
	      </div>
	      <a class="carousel-control-prev" href="#dashboard-carousel" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	      </a>
	      <a class="carousel-control-next" href="#dashboard-carousel" role="button" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	      </a>
	    </div>

  </section>
  
</body>
</html>