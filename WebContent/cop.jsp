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
  <link rel="stylesheet" href="css/copStyles.css">

  <!-- Font Awesome -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

  <!-- Bootstrap Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
	function loadVForm()
	{
		window.location.href = "violation.jsp";
	}
	function loadEForm()
	{
		window.location.href = "Emergency.jsp";
	}
	var x = "No location available";
	function sendDetails() {
		window.location.href = "sosForm.jsp";	  
		}
	
	function loadQr()
	{
		window.location.href = "payment.jsp";
	}
</script>
</head>
<body>

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
              <a class="nav-link" href="#sos">S.O.S.</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#fine">Accept Fine</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Logout">Log Out</a>
            </li>
          </ul>

        </div>
      </nav>
	 </div>
	</section>
	
	<section class="white-section" id="features">

    <h2 class="section-heading">Control Traffic trouble-free</h2>
    <p>Simple and easy to manage Violations and Emergency.</p>

    <div class="row">

      <div class="features-column col-lg-4 col-md-6">
        <div class="card">
          <div class="card-header">
            <h3>Register Violation</h3>
          </div>
          <div class="card-body">
            <p>Maintain record of violators and accept fine.</p>
            <button class="btn btn-lg btn-block btn-dark" onclick = "loadVForm()" type="button">Register</button>
          </div>
        </div>
      </div>

      <div class="features-column col-lg-4 col-md-6" id = "emergency">
        <div class="card">
          <div class="card-header">
            <h3>Emergency</h3>
          </div>
          <div class="card-body">
            <p>Notify Medical Team and get Ambulance Service.</p>
            <button class="btn btn-lg btn-block btn-outline-dark" onclick = "loadEForm()" type="button">Register</button>
          </div>
        </div>
      </div>

      <div class="features-column col-lg-4" id = "sos">
        <div class="card">
          <div class="card-header">
            <h3>S.O.S.</h3>
          </div>
          <div class="card-body">
            <p>Alert all Traffic fellow Police for help.</p>
            <button class="btn btn-lg btn-block btn-dark" onclick = "sendDetails()" type="button">Get Help</button>
          </div>
        </div>
      </div>

    </div>

  </section>
  
  <section class="colored-section" id = "fine">
  
  	<div class = "container-fluid payment">
  		<h2 class = "section-heading">Accept Fine digitally</h2>
  		<p style = "color: #184d47;">Now Accept Fine digitally through simply scanning QR code</p>
  		<div class = "container-fluid">
  		<img style = "width: 50%" class = "payment-image"alt="payment-image" src="Images/payment.png">
  		</div>
  	
  		<button class="btn btn-lg btn-dark" type="button" onclick = "loadQr()">Accept Fine</button>
  	</div>
	
  </section>
  	
</body>
	