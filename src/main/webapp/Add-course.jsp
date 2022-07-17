<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<title>AvocaDO</title>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base href="/">
	<link rel="stylesheet" type="text/css" href="Avocado/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="Avocado/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="Avocado/css/style.css">
	<link rel="stylesheet" type="text/css" href="Avocado/css/responsive.css">
	<link rel="stylesheet" type="text/css" class="js-color-style" href="Avocado/css/culori/color-1.css">
	<link rel="stylesheet" type="text/css" class="js-glass-style" href="Avocado/css/glass.css" disabled>
</head>
<body>

 
<!-- Main wrapper start -->
<div class="main-wrapper">

	<!-- Header start -->
	<header class="header">
		<div class="container">
			<div class="header-main d-flex justify-content-between align-items-center">
				<div class="header-logo">
					<a href="Avocado/index.jsp"><i class="fas fa-regular fa-dumbbell" style="color: var(--main-color);"></i> Avoca<span>DO</span></a>
				</div>
				<button type="button" class="header-hamburger-btn js-header-menu-toggler">
					<span></span>
				</button>
				<div class="header-backdrop js-header-backdrop"></div>
				<nav class="header-menu js-header-menu">
					<button type="button" class="header-close-btn js-header-menu-toggler">
						<i class="fas fa-times"></i>
					</button>
					<ul class="menu">
						<li class="menu-item"><a href="Avocado/index.jsp">Home</a></li>
						<li class="menu-item menu-item-has-children">
							<a href="Avocado/course/list" class="js-toggle-sub-menu">Workouts</a>
						</li>
						<li class="menu-item"><a href="Avocado/Contact.html">Contact</a></li>
						<% if(session.getAttribute("role") != null){%>
							<li class="menu-item"><a href="Avocado/profile">Profile</a></li>
						<%}else{ %>
							<li class="menu-item"><a href="Avocado/LogIn.jsp">Log In</a></li>
						<%} %>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header end --> 

	<!-- Banner section start -->
	<section class="banner-section d-flex align-items-center position-relative">
		<!-- Bubble animation start -->

		<div class="bubble-animation">
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
			<div class="bubble-animation-item"></div>
		</div>

		<!-- Bubble animation end -->
		
		
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
				<div class="card" style="border-radius: .5rem;">
					<div class="card-body p-4 mt-5">
					<div class="text-center">
						<h1 class="form-title" style="color: black !important">Hello, Admin!</h1>
						<h2 class="mb-5" style="color: black !important">Add a course</h2>
					</div>
					
					<form action="<%=request.getContextPath()%>/course/insert">
					<div class="form-group mb-0">

						<div class="form-outline mb-3">
							<input style="color: black !important" type="text" name="course_name" class="form-control form-control-lg" placeholder="Course Name">
						</div>
								
						<div class="form-outline mb-3">
							<input style="color: black !important" type="text" name="course_description" class="form-control form-control-lg" placeholder="Description">
						</div>
						
						<div>
						   	<!--<label for="exampleFormControlTextarea1"></label> -->
    						<textarea style="color: black !important" class="form-control mb-5" name="content" id="content" rows="3" placeholder="Content"></textarea>
    					</div>
						
						<div class="d-flex justify-content-between mb-3">
							<div class="d-flex flex-column" >
								<label for="course-video" class="mb-2" style="color: black !important">Course video</label>
    							<input type="file" class="form-control-file mb-4" name="course_link" id="course_link">
    						</div>
						
							<div class="d-flex flex-column" >
								<label for="course-photo" class="mb-2" style="color: black !important">Course cover</label>
    							<input type="file" class="form-control-file mb-4" name="course_pic" id="course_pic">
    						</div>
    					</div>
				
						<div class="pt-1 mb-3">
							<button class="btn btn-dark btn-lg btn-block btn-form" type="submit" name="Submit" style="font-size: 18px;">Add</button>
						</div>
						
					 </div>
					 </form>
					 
					</div>			
				</div>
				</div>
			</div>
		</div>
		

	</section>
	<!-- Banner section end -->

	

	<!-- Footer start -->

	<footer class="footer">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 text-center">
					<h2 class="footer-heading"><a href="Avocado/folders/index1.jsp" class="logo">Avoca<span>DO</span></a></h2>
					<ul class="menu list-unstyled list-inline social text-center">
						<li class="menu-item list-inline-item"><a href="#">About</a></li>
						<li class="menu-item list-inline-item"><a href="Avocado/Contact.html">Contact</a></li>
						<li class="menu-item list-inline-item"><a href="#">Policy</a></li>
					</ul>
					<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-4">
					<ul class="social list-unstyled list-inline social text-center">
						<li class="social-item list-inline-item"><a href="#"><i class="fab fa-facebook social-icon"></i></a></li>
						<li class="social-item list-inline-item"><a href="#"><i class="fab fa-twitter social-icon"></i></a></li>
						<li class="social-item list-inline-item"><a href="#"><i class="fab fa-instagram social-icon"></i></a></li>
					</ul>>
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



</div>
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