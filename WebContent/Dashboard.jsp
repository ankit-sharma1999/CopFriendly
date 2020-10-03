<%@page import="service.SOSDetails"%>
<%@page import="service.ViolationDetailsService"%>
<%@ page import= "service.Violation" %>
<%@ page import= "service.SOS" %>
<%@ page import= "java.util.*" %>
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
  <link rel="stylesheet" href="css/DashboardNewStyles.css">

  <!-- Font Awesome -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

  <!-- Bootstrap Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
	
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache");
	%>

	<% ViolationDetailsService data = new ViolationDetailsService(); %>
	<% ArrayList<Violation> v = data.getViolationDetails(); %>
	<% SOSDetails s = new SOSDetails(); %>
	<% ArrayList<SOS> al  = s.getSOSDetails(); %>
	          
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
              <a class="nav-link" href="#features">Violations and Fine</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#sos">S.O.S.</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Logout">Log Out</a>
            </li>
          </ul>

        </div>
      </nav>
      
      <!-- Slide -->

      <section class="colored-section" id="testimonials">

	    <div id="testimonial-carousel" class="carousel slide" data-interval = "3000">
	      <div class="carousel-inner">
	        <div class="carousel-item active container-fluid">
	          <h2 class="testimonial-text">Total Violations</h2>
	          <img class="testimonial-image" src="Images/carouselchart.jpg" alt="violation-image">
	          
	          <h1>
	          	<%= v.size()%>
	          </h1>
	        </div>
	        <div class="carousel-item container-fluid">
	          <h3 class="testimonial-text">Total Fine Collected</h3>
	          <img class="testimonial-image" src="Images/carouselfine.jpg" alt="fine-image">
	          <% int tFine=0; %>
	          <% for(Violation i :v)
	          { 
		          	tFine = tFine+i.fine;
		      } %>	          
		      <h1>
	          	<%= tFine %>
	          </h1>
	        </div>
	        <div class="carousel-item container-fluid">
	          <h3 class="testimonial-text">Total S.O.S.</h3>
	          <img class="testimonial-image" src="Images/sosnew.jpg" alt="sos-image">          
		      <h1>
	          	<%= al.size() %>
	          </h1>
	        </div>
	      </div>
	      <a class="carousel-control-prev" href="#testimonial-carousel" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	      </a>
	      <a class="carousel-control-next" href="#testimonial-carousel" role="button" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	      </a>
	    </div>

  </section>

    </div>
    

  </section>
  
  
  
  <section class="white-section" id="features">

    <div class="skills">
      <div class="skill-row">
        <img class="skill-1" src="https://media.giphy.com/media/VEzBzSyEOKtXGuPIQw/giphy.gif" alt="">
        <h3>Violations</h3>
        <p class="skill-1-discription">See all Violations in a click.</p>
        <form action="DashboardDetails.jsp" method = "post">
        <button class="btn btn-outline-dark btn-md download-button" >See full details</button>
        </form>
        
      </div>
      
      <div class="skill-row">
        <img class="skill-2" src= "Images/bribe.png" alt="">
        <h3>Fine Collected</h3>
        <p class="skill-2-discription">See full details of violations and fine collected.</p>
        <form action="DashboardDetails.jsp" method = "post">
        	<button class="btn btn-outline-dark btn-md download-button">See full details</button>
        </form>
        
      </div>
    </div>
  </section>
  
  
   
<section class="colored-section" id="sos">

    <div class="row">
		
		<div class="col-lg-6">
          <img class="title-image" src="Images/sendHelp.png" alt="SOS">
        </div>
		
        <div class="col-lg-6">
          <h1 class="sos-heading">Send Help Team</h1>
          <form action="SOSDetails.jsp" method = "post">
          <button class="btn btn-light btn-md download-button">Send Help Team</button>
          </form>
  		  <!-- <p>Send help team quickly to the Accident Site</p> -->
        </div>

      </div>
  </section>

</body>
</html>