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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

<!-- Custom styles for this template -->
<link href="assets/css/sidebars.css" rel="stylesheet">
<link href="assets/css/menu_student.css" rel="stylesheet">

</head>
<body style="height: 100%;">

	<main>

		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
			style="width: 15%; min-width: 200px; overflow: hidden; height: 100%;">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<span class="fs-4">Staff Menu</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item"><a
					href="StaffMenuController?stu_no=${staff.stf_no}"
					class="nav-link text-white" aria-current="page"> <i
						class="bi bi-house"></i> Home
				</a></li>
				<li class="nav-item"><a href="ListAllStudentController"
					class="nav-link active"> <i class="bi bi-people-fill"></i> List
						Student
				</a></li>
				<li class="nav-item"><a href="update_college_detail.html"
					class="nav-link text-white"> <i class="bi bi-justify"></i> List
						College
				</a></li>
				<li class="nav-item"><a href="update_student_app.html"
					class="nav-link text-white"> <i class="bi bi-justify"></i> List
						College Application
				</a></li>
				<li class="nav-item"><a href="update_student_comp.html"
					class="nav-link text-white"> <i
						class="bi bi-exclamation-square"></i> List Complaint
				</a></li>
				<li class="nav-item"><a href="update_student_comp.html"
					class="nav-link text-white"> <i class="bi bi-journal-check"></i>
						Generate Report
				</a></li>
			</ul>
			<hr>
			<div style="margin: 5px 20px 5px 20px;">
				<a style="vertical-align: baseline;"><img
					src="assets/images/user.png" alt="" width="32" height="32"
					class="rounded-circle me-2"><strong><%=id%></strong></a>
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
						<h4 class="card-title">LIST STUDENT</h4>
						<ul class="nav nav-pills navtab-bg nav-justified">
							<li class="nav-item"><a href="ListAllStudentController"
								data-toggle="tab" aria-expanded="true" class="nav-link active"
								style="border-radius: 15px;">LIST OF STUDENTS</a></li>
							<li class="nav-item"><a href="AddStudentController"
								data-toggle="tab" aria-expanded="false" class="nav-link"
								style="border-radius: 15px;">ADD STUDENT</a></li>
						</ul>
						<!--start div table   -->
						<form action="#" method="post">
							<div class="table-responsive mt-4">
								<table class="table table-centered table-nowrap">
									<tbody>
										<tr>
											<td style="width: 30%">
												<h5 class="mb-0">NAME</h5>
											</td>
											<td style="width: 15%">
												<h5 class="mb-0">STUDENT ID</h5>
											</td>
											<td style="width: 10%">
												<h5 class="mb-0">IC NUMBER</h5>
											</td>
											<td style="width: 5%">
												<h5 class="mb-0">PROGRAMME</h5>
											</td>
											<td style="width: 5%">
												<h5 class="mb-0">PART</h5>
											</td>
											<td style="width: 35%" align="center">
												<h5 class="mb-0">ACTION</h5>
											</td>
										</tr>

										<c:forEach items="${student}" var="student" varStatus="std">
											<tr>
												<td>
													<p class="mb-0">${student.stu_name}</p>
												</td>
												<td>
													<p class="mb-0">${student.stu_no}</p>
												</td>
												<td>
													<p class="mb-0">${student.stu_ic}</p>
												</td>
												<td>
													<p class="mb-0">${student.stu_program}</p>
												</td>
												<td>
													<p class="mb-0">${student.stu_part}</p>
												</td>
												<td>
													<button type="button" class="btn btn-primary"
														style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;"
														onclick="document.location='UpdateStudentController?stu_no=${student.stu_no}'">UPDATE</button>
														<input type="hidden" id="stu_no-${std.index}" value="<c:out value="${student.stu_no}"/>">
													<button type="submit" class="btn btn-danger" onclick="confirmDelete('${std.index}')"
														style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;">REMOVE</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script>
		function confirmDelete(index) {
			var stu_no = $("#stu_no-" + index).val();
			var r = confirm("Are you sure want to delete student " + stu_no + "? \nDelete student will effect college application and complaint.");
			if (r == true) {
				location.href = 'DeleteStudentController?stu_no='+ stu_no;
				alert("Student deleted!");
			} else {
				return false;
			}
		}
	</script>
</body>
</html>
