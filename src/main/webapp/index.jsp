<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>AvocaDO</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base href="/">
	<link rel="stylesheet" type="text/css" href="Avocado/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="Avocado/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="Avocado/css/style.css">
	<!-- <link rel="stylesheet" type="text/css" href="Avocado/css/responsive.css"> -->
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
					<a href="Avocado/index.jsp"><i class="fas fa-regular fa-dumbbell" ></i> Avoca<span>DO</span></a>
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
							<a href="Avocado/course/list" class="js-toggle-sub-menu">Workouts </a>
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
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<div class="banner-text">
						<h1 class="mb-3 text-capitalize">Get the best part of yourself <span>-you fit here</span></h1>
						<p class="mb-4">The expertise you need, the variety you desire, the workout party you've been waiting for.</p>
						<a href="Avocado/SignUp.jsp" class="btn btn-theme">Join Us</a>
					</div>
				</div>
				<div class="col-md-6 order-first order-md-last mb-5 mb-md-0">
					<div class="banner-img">
						<div class="circular-img">
							<div class="circular-img-inner">
								<div class="circular-img-circle">
									<img src="Avocado/imagini/3.png" alt="banner img">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner section end -->

	<!-- Fun facts section start -->

	<section class="fun-facts-section">
		<div class="container">
			<div class="box py-2">
				<div class="row text-center">
					<div class="col-md-6 col-lg-3">
						<div class="fun-facts-item">
							<h2 class="style-1">200k</h2>
							<p>students</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="fun-facts-item">
							<h2 class="style-2">300+</h2>
							<p>courses</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="fun-facts-item">
							<h2 class="style-3">50+</h2>
							<p>countries</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="fun-facts-item">
							<h2 class="style-4">100+</h2>
							<p>skilled instructors</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Fun facts section start -->

	<!-- Courses section start -->

	<section class="courses-section section-padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="section-title text-center">
						<h2 class="title">Courses</h2>
						<p class="sub-title">Find the right course for you</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Courses item start -->
				<div class="col-md-6 col-lg-3">
					<div class="courses-item">
						<a href="Avocado/course/details?id=22" class="link">
							<div class="courses-item-inner">
								<div class="img-box">
									<img src="Avocado/imagini/yoga.png" alt="course img">
								</div>
								<h3 class="title">Yoga Training</h3>
								</div>
						</a>
					</div>
				</div>
				<!-- Courses item end -->

				<!-- Courses item start -->
				<div class="col-md-6 col-lg-3">
					<div class="courses-item">
						<a href="Avocado/course/details?id=21" class="link">
							<div class="courses-item-inner">
								<div class="img-box">
									<img src="Avocado/imagini/1.png" alt="course img">
								</div>
								<h3 class="title">Body Building</h3>
								</div>
						</a>
					</div>
				</div>
				<!-- Courses item end -->

				<!-- Courses item start -->
				<div class="col-md-6 col-lg-3">
					<div class="courses-item">
						<a href="Avocado/course/details?id=22" class="link">
							<div class="courses-item-inner">
								<div class="img-box">
									<img src="Avocado/imagini/fitness.png" alt="course img">
								</div>
								<h3 class="title">Basic Fitness</h3>
								
							</div>
						</a>
					</div>
				</div>
				<!-- Courses item end -->

				<!-- Courses item start -->
				<div class="col-md-6 col-lg-3">
					<div class="courses-item">
						<a href="Avocado/course/details?id=21" class="link">
							<div class="courses-item-inner">
								<div class="img-box">
									<img src="Avocado/imagini/muscle.png" alt="course img">
								</div>
								<h3 class="title">Basic Muscle</h3>
								
							</div>
						</a>
					</div>
				</div>
				<!-- Courses item end -->

			</div>
			<div class="row">
				<div class="col-12 text-center mt-3">
					<a href="Avocado/course/list" class="btn btn-theme">View all courses</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Courses section end -->

	<!-- Testimonials section start -->

	<section class="testimonials-section section-padding position-relative">
		<div class="decoration-circles d-none d-lg-block">
			<div class="decoration-circles-item"></div>
			<div class="decoration-circles-item"></div>
			<div class="decoration-circles-item"></div>
			<div class="decoration-circles-item"></div>
			<div class="decoration-circles-item"></div>
			<div class="decoration-circles-item"></div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 ">
					<div class="section-title text-center">
						<h2 class="title">Clients feedback</h2>
						<p class="sub-title">What our clients say</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6">
					<div class="img-box rounded-circle position-relative">
						<img src="Avocado/imagini/testimonial6.png" class="w-100 js-testimonial-img rounded-circle" alt="testimonial img">
					</div>
					<div id="carouselOne" class="carousel slide text-center" data-bs-ride="carousel">
						<div class="carousel-inner mb-4">
						  <div class="carousel-item active" data-js-testimonial-img="Avocado/imagini/testimonial6.png">
							<div class="testimonials-item">
								<p class="text-1">Love it. Everything is on point and clear. </p>
								<h3>Marissa Doyle</h3>
							</div>
						  </div>
						  <div class="carousel-item" data-js-testimonial-img="Avocado/imagini/testimonial7.png">
							<div class="testimonials-item">
								<p class="text-1">Since I found this website my life changed completely. I'm more motivated to get up from my bed and do some exercises. Life is better with AvocaDO.</p>
								<h3>Hellen Owen</h3>
							</div>
						  </div>
						  <div class="carousel-item" data-js-testimonial-img="Avocado/imagini/testimonial3.png">
							<div class="testimonials-item">
								<p class="text-1">A friend of mine told me about this site and I owe him a beer. I love that it has anything I need to build my body.</p>
								<h3>John Doe</h3>
							</div>
						  </div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselOne" data-bs-slide="prev">
						  <i class="fas fa-arrow-left"></i>
						  <span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselOne" data-bs-slide="next">
						  <i class="fas fa-arrow-right"></i>
						  <span class="visually-hidden">Next</span>
						</button>
					  </div>
				</div>
			</div>
		</div>
	</section>

	<!-- Testimonials section end -->

	<!-- Be part of the team start -->
	<section class="bpt-section section-padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10">
					<div class="box">
						<div class="row align-items-center">
							<div class="col-md-6 mb-4 m-md-0">
								<div class="circular-img">
									<div class="circular-img-inner">
										<div class="circular-img-circle">
											<img src="Avocado/imagini/bpt1.png" alt="bpt image">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="section-title m-0">
									<h2 class="title">Be part of the team!</h2>
									<p class="sub-title">Become what you always dreamt of.</p>
								</div>
								<a href="SignUp.jsp" class="btn btn-theme">Apply Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Be part of the team end -->

	<!-- Footer start -->

	<footer class="footer">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 text-center">
					<h2 class="footer-heading"><a href="Avocado/index.jsp" class="logo">Avoca<span>DO</span></a></h2>
					<ul class="menu list-unstyled list-inline social text-center">
						<li class="menu-item list-inline-item"><a href="Avocado/course-detail.jsp">About</a></li>
						<li class="menu-item list-inline-item"><a href="Contact.html">Contact</a></li>
						<li class="menu-item list-inline-item"><a href="Avocado/course-detail.jsp">Policy</a></li>
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