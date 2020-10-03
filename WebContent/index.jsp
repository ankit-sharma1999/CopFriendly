<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cop Friendly</title>
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu" rel="stylesheet">

<!-- CSS Stylesheets -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href = "css/homeStyles.css" rel = "stylesheet">

<!-- Font Awesome -->
<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

<!-- Bootstrap Scripts -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">
	function loadRegister(){
		window.location.href = "register.html";
	}
</script>

</head>
<body>
	

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
              <a class="nav-link" href="#Sergeant">Sergeant</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#central">Central Team</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#medical">Medical</a>
            </li>
          </ul>

        </div>
      </nav>


      <!-- Title -->

      <div class="row">

        <div class="col-lg-6">
          <h1 class="big-heading">Register and manage Violations and Emergency effortlessly.</h1>
          <button type="button" class="btn btn-outline-light btn-lg download-button" onclick = "loadRegister()"><i class="fas fa-user-plus"></i>  Register</button>
          
        </div>

        <div class="col-lg-6">
          <img class="title-pol-image" src="Images/titleImg.jpg" alt="title-image">
          <img class="title-doc-image" src="Images/titleDoc.png" alt="title-image">
          <img class="title-team-image" src="Images/titleTeam.jpg" alt="title-image">
          
        </div>

      </div>

    </div>

  </section>

  <section class="white-section" id="Sergeant">
  
  	<h2 class="cop section-heading">Cops can manage Traffic effortlessly</h2>
    <p>Simple to register violations and call specific teams for Emergency.</p>
  	

    <div class="container-fluid">

      <div class="row">
        <div class="feature-box col-lg-4">
          <i class="icon fa fa-book fa-4x" aria-hidden="true"></i>
          <h3 class="feature-title">Register Violation.</h3>
          <p>Register details of violations and violators.</p>
        </div>

        <div class="feature-box col-lg-4">
		  <i class="icon fa fa-ambulance fa-4x" aria-hidden="true"></i>
          <h3 class="feature-title">Register Emergency</h3>
          <p>Register for Emergency in case of Accidents.</p>
        </div>

        <div class="feature-box col-lg-4">
		  <i class="icon far fa-money-bill-alt fa-4x"></i>
          <h3 class="feature-title">Accept fine.</h3>
          <p>Accept fine payments via digital Bank .</p>
        </div>
      </div>
	  <form action="Login.jsp" method = "post">
  		<button type = "submit" class="btn btn-dark btn-lg" name = "loginType" value = "Sergeant">Login as Sergeant</button>
  	  </form>

    </div>
  </section>
  
   <section class="colored-section" id="central">
   	
   	 <h2 class="cop section-heading">Traffic Central Team</h2>
   	 <p class="feature-para">See violations and total fine very easily and send help in case of SOS.</p>
	 <div class="central-content container-fluid">
			
       <div class="skills">
	      <div class="skill-row">
	        <img class="skill-1" src="https://media.giphy.com/media/VEzBzSyEOKtXGuPIQw/giphy.gif" alt="Dashboard-image">
	        <h3>Dashboard for Violations and Fine</h3>
	        <p style = "color: #fff">See all details of violators and total fine collected in a click.</p>
	      </div>
	      
	      <div class="skill-row">
	        <img class="skill-2" src= "Images/sosnew.jpg" alt="SOS-image">
	        <h3>S.O.S.</h3>
	        <p style = "color: #fff">Send help teams to the specific location in case of SOS.</p>
	      </div>
       </div>
     </div>

	 <form class = "central-form"action="Login.jsp">
  		<button type = "submit" class="btn btn-outline-light btn-lg" name = "loginType" value = "Central Traffic Team">Login as Central team</button>
  	  </form>
  	  
  	  <br>
  	  	     
   </section>
   
   <section class="white-section" id="medical">
  
  	<h2 class="cop section-heading">Medical Rapid Force Team</h2>
    <p>See for Medical Emergency Requirements and send Ambulance and teams to the location quickly.</p>
  	

    <div class="container-fluid">

      <div class="row">
        <div class="feature-box col-lg-6">
          <img class="medical-img" src= "Images/medicaforce.jpg" alt="Medical-team-image">
        </div>

        <div class="feature-box col-lg-6">
		  <h2>Send Ambulance and medical team for Medical Emergency Requirement.</h2>
		  <br>
		 
		  <form action="Login.jsp" method = "post" style = "margin-top: 2rem;">
  			<button type = "submit" class="btn btn-dark btn-lg" name = "loginType" value = "Medical Team">Login as Medical Team</button>
  	  	  </form>
        </div>
      </div>
	  

    </div>
  </section>
  
</body>
</html>