<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
//prevent Caching of JSP Pages
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
//get session and check if session null, go to login page
if (session.getAttribute("currentSessionUser") == null)
	response.sendRedirect("index.html");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Student Menu</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

<!-- add icon link -->
<link rel="icon" href="assets/images/h_logo.svg" type="image/x-icon">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

<!-- Custom styles for this template -->
<link href="assets/css/sidebars.css" rel="stylesheet">
<link href="assets/css/menu_student.css" rel="stylesheet">

</head>
<body style="height: 100%;">

	<main>
		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
			style="width: 15%; min-width: 200px; height: 100%;">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<span class="fs-4">Student Menu</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item"><a
					href="StudentMenuController?stu_no=${student.stu_no}"
					class="nav-link text-white"> <i class="bi bi-house"></i> Home
				</a></li>
				<li class="nav-item"><a
					href="CollegeApplicationStudentController?stu_no=${student.stu_no}"
					class="nav-link active" aria-current="page"> <i
						class="bi bi-box-arrow-right"></i> Hostel Application
				</a></li>
				<li class="nav-item"><a href="AddComplaintStudentController?stu_no=${student.stu_no}"
					class="nav-link text-white"> <i
						class="bi bi-exclamation-square"></i> Complaint
				</a></li>
				<li class="nav-item"><a href="ManageProfileStudentController?stu_no=${student.stu_no}"
					class="nav-link text-white"> <i class="bi bi-person-circle"></i>
						Manage Profile
				</a></li>
			</ul>
			<hr>
			<div style="margin: 5px 20px 5px 20px;">
				<a style="vertical-align: baseline;"><img
					src="assets/images/user.png" alt="" width="32" height="32"
					class="rounded-circle me-2"><strong>${student.stu_no}</strong></a>
			</div>
			<button onclick="document.location='index.html'" type="button"
				class="btn btn-danger" style="margin: 10px;">
				<i class="bi bi-power"
					style="vertical-align: baseline; margin-right: 10px;"></i> Logout
			</button>

		</div>


		<!--  Content -->
		<div class="backg overflow-scroll">
			<div class="card">
				<div class="bg-soft-primary">
					<div class="card-body">
						<h4 class="card-title">HOSTEL APPLICATION</h4>
						<ul class="nav nav-pills navtab-bg nav-justified">
							<li class="nav-item"><a
								href="CollegeApplicationStudentController?stu_no=${student.stu_no}"
								data-toggle="tab" aria-expanded="true" class="nav-link"
								style="border-radius: 15px;">APPLY</a></li>
							<li class="nav-item"><a
								href="CollegeApplicationStatusStudentController?stu_no=${student.stu_no}"
								data-toggle="tab" aria-expanded="false" class="nav-link active"
								style="border-radius: 15px;">STATUS</a></li>
						</ul>
						<!--start div table   -->
						<div class="table-responsive mt-4">
							<table class="table table-centered table-nowrap">
								<tbody>
									<tr>
										<td style="width: 20%">
											<p class="mb-0">MATRIX NO</p>
										</td>
										<td style="width: 30%">
											<h5 class="mb-0">${student.stu_no}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">NAME</p>
										</td>
										<td>
											<h5 class="mb-0">${student.stu_name}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">IC NO</p>
										</td>
										<td>
											<h5 class="mb-0">${student.stu_ic}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">PROGRAMME</p>
										</td>
										<td>
											<h5 class="mb-0">${student.stu_program}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">PART</p>
										</td>
										<td>
											<h5 class="mb-0">${student.stu_part}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">EMAIL</p>
										</td>
										<td>
											<h5 class="mb-0">${student.stu_email}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">PHONE NO</p>
										</td>
										<td>
											<h5 class="mb-0">${student.stu_phoneno}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">APPLY DATE</p>
										</td>
										<td>
											<h5 class="mb-0">${collegeApplication.collap_date}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">SESSION</p>
										</td>
										<td>
											<h5 class="mb-0">${collegeApplication.collap_session}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">APPLICATION NO</p>
										</td>
										<td>
											<h5 class="mb-0">${collegeApplication.collap_no}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">APPLICATION STATUS</p>
										</td>
										<td>
											<h5 class="mb-0">${collegeApplication.collap_status}</h5>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<h4 class="card-title">HOSTEL INFORMATION</h4>
						<div class="table-responsive mt-4">
							<table class="table table-centered table-nowrap">
								<tbody>
									<tr>
										<td style="width: 20%">
											<p class="mb-0">COLLEGE NO</p>
										</td>
										<td style="width: 30%">
											<h5 class="mb-0">${college.coll_no}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">COLLEGE NAME</p>
										</td>
										<td>
											<h5 class="mb-0">${college.coll_name}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">COLLEGE FLOOR</p>
										</td>
										<td>
											<h5 class="mb-0">${college.coll_floor}</h5>
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">COLLEGE ROOM</p>
										</td>
										<td>
											<h5 class="mb-0">${college.coll_room}</h5>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</main>
</body>
</html>