<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%//prevent Caching of JSP Pages
 response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
//get session and check if session null, go to login page
if(session.getAttribute("currentSessionUser")==null)
	response.sendRedirect("index.html");
 %>
<%
int id = (Integer) session.getAttribute("currentSessionUser");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Staff Menu</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

<!-- add icon link -->
<link rel="icon" href="assets/images/h_logo.svg" type="image/x-icon">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

<!-- Custom styles for this template -->
<link href="assets/css/sidebars.css" rel="stylesheet">
<link href="assets/css/menu_student.css" rel="stylesheet">
</head>

<body style="height: 100%;">
	<main>
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
			style="width: 15%; min-width: 200px; overflow: hidden; height: 100%;">
			<a href="StaffMenuController" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<span class="fs-4">Staff Menu</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
			
				<li class="nav-item">
				<a href="StaffMenuController" class="nav-link text-white" aria-current="page"> 
				<i class="bi bi-house"></i>Home</a></li>
				
				<li class="nav-item">
				<a href="ListAllStudentController" class="nav-link active"> 
				<i class="bi bi-people-fill"></i>List Student</a></li>
				
				<li class="nav-item">
				<a href="ListAllCollegeController" class="nav-link text-white"> 
				<i class="bi bi-justify"></i>List College</a></li>
				
				<li class="nav-item">
				<a href="ListAllCollegeApplicationController" class="nav-link text-white"> 
				<i class="bi bi-justify"></i>List College Application</a></li>
				
				<li class="nav-item">
				<a href="ListAllComplaintApplicationController" class="nav-link text-white"> 
				<i class="bi bi-exclamation-square"></i>List Complaint</a></li>
				
				<li class="nav-item">
				<a href="GenerateReportController" class="nav-link text-white"> 
				<i class="bi bi-journal-check"></i>Generate Report</a></li>
				
			</ul>
			<hr>
			<div style="margin: 5px 20px 5px 20px;">
				<a style="vertical-align: baseline;">
				<img src="assets/images/user.png" alt="" width="32" height="32" class="rounded-circle me-2">
				<strong><%=id%></strong>
				</a>
			</div>
			<button onclick="document.location='LogoutController'" type="button"
				class="btn btn-danger" style="margin: 10px;">
				<i class="bi bi-power"
					style="vertical-align: baseline; margin-right: 10px;"></i> Logout
			</button>

		</div>


		<!--  Content -->
		<div class="backg">
			<div class="card">
				<div class="bg-soft-primary">
					<div class="card-body">
						<h4 class="card-title">ADD STUDENT</h4>
						<ul class="nav nav-pills navtab-bg nav-justified">
							<li class="nav-item"><a href="ListAllStudentController"
								data-toggle="tab" aria-expanded="true" class="nav-link"
								style="border-radius: 15px;">LIST OF STUDENTS</a></li>
							<li class="nav-item"><a href="AddStudentController"
								data-toggle="tab" aria-expanded="false" class="nav-link active"
								style="border-radius: 15px;">ADD</a></li>
						</ul>

						<!--start div table   -->
						<form action="AddStudentController" method="post">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="stu_ic">IC Number</label> 
									<input class="form-control" type="text" id="stu_ic" name="stu_ic" placeholder="XXXXXXXXXX" required></div>
								<div class="col-md-6 mb-3">
									<label for="stu_no">Student Number</label> 
									<input class="form-control" type="text" id="stu_no" name="stu_no" placeholder="XXXXXXXXXXXX" required>
								</div>
							</div>

							<div class="mb-3">
								<label for="stu_name">Full Name</label>
								<div class="input-group">
									<div class="input-group-prepend"></div>
									<input class="form-control" type="text" id="stu_name" name="stu_name" placeholder="Muhammad Bin Ali" required>
								</div>
							</div>

							<div class="mb-3">
								<label for="stu_email">Email <span class="text-muted">(Optional)</span></label>
								<input class="form-control" type="email" id="stu_email" name="stu_email" value="null" placeholder="name@example.com">
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="stu_state">State</label> 
									<select class="form-control" id="stu_state" name="stu_state" required>
										<option value="Johor">Johor</option>
										<option value="Kedah">Kedah</option>
										<option value="Kelantan">Kelantan</option>
										<option value="Malacca">Malacca</option>
										<option value="Negeri Sembilan">Negeri Sembilan</option>
										<option value="Pahang">Pahang</option>
										<option value="Penang">Penang</option>
										<option value="Perak">Perak</option>
										<option value="Perlis">Perlis</option>
										<option value=Selangor>Selangor</option>
										<option value="Terengganu">Terengganu</option>
										<option value="Sabah">Sabah</option>
										<option value="Sarawak">Sarawak</option>
										<option value="Kuala Lumpur">Kuala Lumpur</option>
										<option value="Labuan">Labuan</option>
										<option value="Putrajaya">Putrajaya</option>
									</select>
								</div>
								
								<div class="col-md-6 mb-3">
									<label for="stu_gender">Gender</label> 
									<select class="form-control" id="stu_gender" name="stu_gender" required>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>

							</div>
							
							<hr class="mb-4">
							
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="stu_part">Part</label> 
									<input class="form-control" type="text" id="stu_part" name="stu_part" placeholder="4" required>
								</div>
								
								<div class="col-md-6 mb-3">
									<label for="stu_program">Programme</label> 
									<input class="form-control" type="text" id="stu_program" name="stu_program" placeholder="CS253" required>
								</div>
							</div>
							<div
								style="display: flex; justify-content: center; align-items: center;">
								<button type="submit" class="btn btn-primary"
									style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;">SUBMIT</button>
								<button type="reset" class="btn btn-secondary"
									style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;">RESET</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</main>
</body>
</html>
