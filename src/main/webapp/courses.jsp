<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ page import="java.util.List"%>
    <%@ page import="net.javaguides.course.bean.CourseBean"%>
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
	
	<!-- Breadcrumb start -->
	
	<div class="breadcrumb-nav">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb mb-0">
				  <li class="breadcrumb-item"><a href="Avocado/index.jsp">Home</a></li>
				  <li class="breadcrumb-item active" aria-current="page">Courses</li>
				</ol>
			  </nav>
		</div>
	</div>
	
	<!-- Breadcrumb end -->

	<!-- Courses section start -->

	<section class="courses-section section-padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 mb-5">
					<div class="section-title text-center mb-4">
						<h2 class="title">Our Courses</h2>
						<p class="sub-title">Find the right course for you</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					  <div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="yoga" role="tabpanel" aria-labelledby="yoga-tab">
							<div class="row justify-content-center mt-6">
								<!-- Courses item start -->
								<% 
									List < CourseBean > listCourse = (List)request.getAttribute("listCourse");
									request.setAttribute("listCourse", listCourse);
									%>
								<c:forEach items = "${listCourse}" var="cours">
									<div class="col-md-6 col-lg-3">
										<div class="courses-item">
											<a href="Avocado/course/details?id=${cours.getId()}" class="link">
												<div class="courses-item-inner">
													<div class="img-box">
														<img src="Avocado/imagini/${cours.getCourse_pic()}" alt="course img">
													</div>
													<h3 class="title text-center"><c:out value="${cours.getCourse_name()}"/></h3>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
								<!-- Courses item end -->
							</div>
						</div>
					  </div>
				</div>
			</div>
		</div>
	</section>

	<!-- Courses section end -->

    <!-- Footer start -->

	<footer class="footer">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 text-center">
					<h2 class="footer-heading"><a href="#" class="logo">Avoca<span>DO</span></a></h2>
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