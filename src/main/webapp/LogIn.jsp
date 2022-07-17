<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>AvocaDO</title>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base href="/">
	<link rel="stylesheet" href="Avocado/css/font-awesome.css">
	<link rel="stylesheet" href="Avocado/css/bootstrap.min.css">
	<link rel="stylesheet" href="Avocado/css/style.css">
	<link rel="stylesheet" href="Avocado/css/responsive.css">
	<link rel="stylesheet" class="js-color-style" href="Avocado/css/culori/color-1.css">
	<link rel="stylesheet" class="js-glass-style" href="Avocado/css/glass.css" disabled>
</head>
<body>

<!-- Main wrapper start -->
 <div class="main-wrapper">
	 <!-- Header start -->
	<header class="header">
		<div class="container">
			<div class="header-main d-flex justify-content-between align-items-center">
				<div class="header-logo" >
					<a href="Avocado/index.jsp"><i class="fas fa-regular fa-dumbbell" style="color: var(--main-color);"></i> Avoca<span>DO</span></a>
				</div>
			</div>
		</div>
	</header>
	<!-- Header end -->


	<!-- Login section start -->

	<section class="vh-100" >
		<div class="container py-5 h-100">
		  <div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-11">
			  <div class="card" style="border-radius: 1rem;">
				<div class="row g-0">
				  <div class="col-md-6 col-lg-5 d-none d-md-block">
					<img src="Avocado/imagini/Log-in.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" >
				  </div>
				  <div class="col-md-6 col-lg-7 d-flex align-items-center">
					<div class="card-body p-4 p-lg-5 text-black">
					<form action = "<%=request.getContextPath()%>/login" method="post">
						<div class="d-flex align-items-center mb-3 pb-1">
						  <i class="fas fa-regular fa-dumbbell fa-2x me-3" style="color: var(--main-color);"></i>
						  <span class="h1 fw-bold mb-0">Avoca<span style="color: var(--red-light);">DO</span></span>
						</div>
	  
						<h5 class="form-title fw-normal mb-3 pb-3" >Sign into your account</h5>
					
						<div class="form-group">
							<div class="form-outline mb-4">
								<input type="email" name="email" class="form-control form-control-lg" placeholder="Email">
							  </div>
			
							  <div class="form-outline mb-4">
								  <input type="password" name="password" class="form-control form-control-lg" placeholder="Password">
							  </div>
			
							  <div class="pt-1 mb-4">
								<button class="btn btn-dark btn-lg btn-block btn-form" type="submit" name="Submit">Login</button>
							  </div>
			
								<% if(request.getAttribute("errMessage") != null){%>
									<p class="text-muted" style="color:red !important"><%=request.getAttribute("errMessage")%></p>
								<%} %>
							  
							  <p class="mb-4 mt-2 pb-lg-2" style="font-size: 16px;">Don't have an account? <a href="Avocado/SignUp.jsp">Register here</a></p>
						</div>
					</form>
					</div>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </section>

	<!-- Login section end -->
	
	<!-- Footer start -->
	
		<footer class="footer">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12 text-center">
						<h2 class="footer-heading"><a href="#" class="logo">Avoca<span style="color: var(--red-light);">DO</span></a></h2>
						<ul class="menu list-unstyled list-inline social text-center">
							<li class="menu-item list-inline-item"><a href="#">About</a></li>
							<li class="menu-item list-inline-item"><a href="#">Contact</a></li>
							<li class="menu-item list-inline-item"><a href="#">Policy</a></li>
						</ul>
						<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-4">
						<ul class="social list-unstyled list-inline social text-center">
							<li class="social-item list-inline-item"><a href="#"><i class="fab fa-facebook social-icon"></i></a></li>
							<li class="social-item list-inline-item"><a href="#"><i class="fab fa-twitter social-icon"></i></a></li>
							<li class="social-item list-inline-item"><a href="#"><i class="fab fa-instagram social-icon"></i></a></li>
						</ul>
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-12 text-center">
						<p class="copyright">
					  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This website is made with <i class="fa-solid fa-heart" ></i> by Fruitify
						</p>
					</div>
				</div>
			</div>
		</footer>
	
		<!-- Footer end -->

    

</div> -->
<!-- Main wrapper end -->

 <!-- Style switcher start -->
 
 <div class="style-switcher js-style-switcher">
	<div class="style-switcher-toggler js-style-switcher-toggler">
	   <i class="fas fa-cog"></i>
	</div>
	<h3>Style Switcher</h3>
	<div class="style-switcher-item">
	   <div class="form-check form-switch">
		   <input class="form-check-input js-dark-mode" type="checkbox" role="switch" id="dark-mode">
		   <label class="form-check-label" for="dark-mode">Dark Mode</label>
	   </div>
	</div>
	<div class="style-switcher-item">
	   <div class="form-check form-switch">
		   <input class="form-check-input js-glass-effect" type="checkbox" role="switch" id="glass-effect">
		   <label class="form-check-label" for="glass-effect">Glass Effect</label>
	   </div>
	</div>
</div>

<!-- Style switcher end -->


<script src="Avocado/javascript/bootstrap.bundle.min.js"></script>
<script src="Avocado/javascript/main.js"></script>     
</body>
</html>