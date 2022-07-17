<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ page import="net.javaguides.course.bean.CourseBean"%>
    <%@ page import="javax.servlet.http.HttpServletRequest"%>
    <%@ page import="javax.servlet.http.HttpSession"%>
     <%@ page import="java.util.List"%>
    <%@ page import="net.javaguides.review.bean.Review"%>
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
				  <li class="breadcrumb-item active" aria-current="page">Course Details</li>
				</ol>
			  </nav>
		</div>
	</div>
	
	<!-- Breadcrumb end -->

	<!-- Course details section start -->

<% CourseBean course = (CourseBean) request.getAttribute("course"); %>
	<section class="course-details section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<!-- Course header start -->

					<div class="course-header box">
						<h2 class="text-capitalize"><c:out value="${course.getCourse_name()}"/></h2>
						<ul>
							<li>Data - <span>05/07/2021</span></li>
						</ul>
					</div>

					<!-- Course header end -->

					<!-- Course tabs start -->

					<nav class="course-tabs">
						<div class="nav nav-tabs border-0" id="nav-tab" role="tablist">
						  <button class="nav-link active" id="course-curriculum-tab" data-bs-toggle="tab" data-bs-target="#course-curriculum" type="button" role="tab" aria-controls="course-curriculum" aria-selected="true">Description</button>
						  <button class="nav-link" id="course-description-tab" data-bs-toggle="tab" data-bs-target="#course-description" type="button" role="tab" aria-controls="course-description" aria-selected="false">Content</button>
						  <button class="nav-link" id="course-instructor-tab" data-bs-toggle="tab" data-bs-target="#course-instructor" type="button" role="tab" aria-controls="course-instructor" aria-selected="false">Review</button>
						</div>
					  </nav>

					<!-- Course tabs end -->

					<!-- Tab panes start -->
					<div class="tab-content" id="nav-tabContent">

						<!-- Course curriculum start -->
						<div class="tab-pane fade show active" id="course-curriculum" role="tabpanel" aria-labelledby="course-curriculum-tab">
							<div class="course-curriculum box">
								<h3 class="text-capitalize mb-4">Description</h3>
								<!-- Accordion start -->
								<div class="accordion" id="accordion">
										<c:out value="${course.getCourse_description()}"/>
								</div>
								<!-- Accordion end -->
							</div>
						</div>
						<!-- Course curriculum end -->

						<!-- Course description start -->
						<div class="tab-pane fade" id="course-description" role="tabpanel" aria-labelledby="course-description-tab">
							<div class="course-description box">
								<h3 class="text-capitalize mb-4">Content</h3>
							<div class="accordion" id="accordion">
										<c:out value="${course.getContent()}"/>
							</div>
							</div>
						</div>
						<!-- Course description end -->

						<!-- Course instructor start -->
						<div class="tab-pane fade" id="course-instructor" role="tabpanel" aria-labelledby="course-instructor-tab">
							<div class="course-instructor box">
								<h3 class="mb-3 text-capitalize">Review</h3>
								<div class="accordion" id="accordion">
										<% 
									List < Review > listReview = (List)request.getAttribute("review");
									request.setAttribute("listReview", listReview);
									%>
									<c:forEach items = "${listReview}" var="review">	
									
										<p class="h3"><c:out value="${review.getUser_name()}"/>:</p>
										<span class="block pl-5">
											<p class="ml-5 pb-3" style="margin-left:30px !important"><c:out value="${review.getReview_text()}"/></p>
										</span>
											
									</c:forEach>
								<hr/>
							<form action="<%= request.getContextPath() %>/review/insert" method="post">
							
							<div class="form-group mb-0">

								<% session = request.getSession();
								int id = (int)session.getAttribute("id");%>
								<input type="hidden" id="userId" name="userId" value="${id}">
								<input type="hidden" id="courseId" name="courseId" value="${course.getId()}">
								<div class="form-outline mb-3">
									<textarea name="review_text" class="form-control form-control-lg" placeholder="Review"></textarea>
								</div>
				
								<div class="pt-1 mb-3">
									<button class="btn btn-dark btn-lg btn-block btn-form" type="submit" name="Submit" style="font-size: 18px;">Submit</button>
								</div>
							</div>
						</form>
								</div>
							</div>
						</div>
						<!-- Course instructor end -->

					  </div>
					<!-- Tab panes end -->

				</div>
				<div class="col-lg-4">
					<!-- Course sidebar start -->

					<div class="course-sidebar box">
						<video width="288" controls>
						  <source src="Avocado/video/1test.mp4" type="video/mp4">
						</video>
						</div>
					</div>


					<!-- Course sidebar end -->
				</div>
			</div>
		</div>
	</section>

	<!-- Course details section end -->

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

<!-- Course preview modal start -->

<div class="modal fade video-modal js-course-preview-modal" id="video-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
	  <div class="modal-content">
		<div class="modal-body p-0">
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				<i class="fas fa-times"></i>
			</button>
			<div class="ratio ratio-16x9">
				<video controls class="js-course-preview-video">
					<source src="" type="video/mp4"> 
				</video>
			</div>
		</div>
	  </div>
	</div>
  </div>

<!-- Course preview modal start -->

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