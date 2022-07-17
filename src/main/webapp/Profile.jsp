<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ page import="net.javaguides.user.bean.UserBean"%>
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


<% //In case, if Admin and User session is not set, redirect to Login page
if((request.getSession(false).getAttribute("role")== null))
{
%>
<jsp:forward page="LogIn.jsp"></jsp:forward>
<%} %>

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
						<a href="Avocado/course/list" class="js-toggle-sub-menu">Workouts </a>
						</li>
						<li class="menu-item"><a href="Avocado/Contact.html">Contact</a></li>
						<li class="menu-item"><a href="Avocado/LogoutServlet">Log Out</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header end --> 
	
	<!-- Profile section start -->
	<section class="profile-section vh-100" >
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
	
	<%UserBean user = (UserBean)request.getAttribute("user");%>
		
		  <div class="container py-5 h-100">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		    	<h2 class="text-center">Profile</h2>
		     	<div class="col col-xl-10" style="color: black !important">
		        	<div class="card" style="border-radius: .5rem; ">
		         		<div class="row g-0 " style="height: 550px;">
		            		<div class="col-md-4 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
		              			<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
		              			<h5>${user.getName()}</h5>
		              			<h4 class="mt-5 p-5" style="color: black !important">Welcome!</h4>
		            		</div>
		            	<div class="col-md-8">
		            <div class="card-body p-4 mt-5">
		                <h6 style="color: black !important">Information</h6>
		                <hr class="mt-0 mb-4">
		                <div class="row pt-1">
		                  <div class="col-6 mb-3">
		                    <h6 style="color: black !important">Email</h6>
		                    <p class="text-muted">${user.getEmail()}</p>
		                  </div>
		                  <div class="col-6 mb-3">
		                    <h6 style="color: black !important">Phone</h6>
		                    <p class="text-muted">${user.getNumber()}</p>
		                  </div>
		                </div>
		                <h6 style="color: black !important">More</h6>
		                <hr class="mt-0 mb-4">
		                <div class="row pt-1">
		                  <div class="col-6 mb-3">
		                    <h6 style="color: black !important">Country</h6>
		                    <p class="text-muted">${user.getCountry()}</p>
		                  </div>
		                  <div class="col-6 mb-3">
		                    <h6 style="color: black !important">Age</h6>
		                    <p class="text-muted">${user.getAge()}</p>
		                  </div>
		                </div>
		                <div class="d-flex justify-content-start mb-5">
		                  <a href="#!"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
		                  <a href="#!"><i class="fab fa-twitter fa-lg me-3"></i></a>
		                  <a href="#!"><i class="fab fa-instagram fa-lg"></i></a>
		                </div>
		         
		                
		                <!-- If user is logged in as Admin, he/she has the right to add a course, else not.-->
		                <% if (request.getSession(true).getAttribute("role") == "Admin"){ %>
		                <div class="d-flex justify-content-between">
		                <form action="Avocado/Add-course.jsp" method="get">
		                	<div class="d-flex justify-content-start pr-5">
			                		<button class="btn btn-dark btn-lg btn-block btn-form" style="width: 120px; margin-right:25px;" type="submit" name="Submit" >Add</button>
		                	</div>
		                </form>
		                <% }%>
		                <form action="<%=request.getContextPath()%>/LogoutServlet" method="get">
		                	<div class="d-flex justify-content-end pr-5">
			                		<button class="btn btn-dark btn-lg btn-block btn-form" style="width: 120px; margin-right:25px;" type="submit" name="Submit" >Logout</button>
		                	</div>
		                </form>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
</section>
		
	<!-- Footer start -->

	<footer class="footer">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 text-center">
					<h2 class="footer-heading"><a href="#" class="logo">Avoca<span>DO</span></a></h2>
					<ul class="menu list-unstyled list-inline social text-center">
						<li class="menu-item list-inline-item"><a href="#">About</a></li>
						<li class="menu-item list-inline-item"><a href="Contact.html">Contact</a></li>
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