<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1 class="visually-hidden">Sidebars examples</h1>

		<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
			style="width: 15%; min-width: 200px; overflow: hidden; height: 100%;">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<span class="fs-4">Student Menu</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item"><a href="StudentMenuController?stu_no=${student.stu_no}"
					class="nav-link text-white"> <i class="bi bi-house"></i> Home
				</a></li>
				<li class="nav-item"><a href="CollegeApplicationStudentController?stu_no=${student.stu_no}"
					class="nav-link text-white"> <i class="bi bi-box-arrow-right"></i>
						Hostel Application
				</a></li>
				<li class="nav-item"><a href="AddComplaintStudentController?stu_no=${student.stu_no}"
					class="nav-link active" aria-current="page"> <i
						class="bi bi-exclamation-square"></i> Complaint
				</a></li>
				<li class="nav-item"><a href="manage_profile_student.html"
					class="nav-link text-white"> <i class="bi bi-person-circle"></i>
						Manage Profile
				</a></li>
			</ul>
			<hr>
			<div style="margin: 5px 20px 5px 20px;">
				<a style="vertical-align: baseline;"><img
					src="https://github.com/mdo.png" alt="" width="32" height="32"
					class="rounded-circle me-2"><strong>User</strong></a>
			</div>
			<button onclick="document.location='index.html'" type="button"
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
						<h4 class="card-title">COMPLAINT</h4>
						<ul class="nav nav-pills navtab-bg nav-justified">
							<li class="nav-item"><a href="AddComplaintStudentController?stu_no=${student.stu_no}"
								data-toggle="tab" aria-expanded="true" class="nav-link active"
								style="border-radius: 15px;">MAKE COMPLAINT</a></li>
							<li class="nav-item"><a href="ComplaintStatusStudentController?stu_no=${student.stu_no}"
								data-toggle="tab" aria-expanded="false" class="nav-link"
								style="border-radius: 15px;">STATUS</a></li>
						</ul>
						<!--start div table   -->
						<form action="AddComplaintStudentController?stu_no=${student.stu_no}" method="post">
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
												<p class="mb-0">COMPLAINT TYPE</p>
											</td>
											<td><select name="comp_type"
												style="padding: 0 5px; border-radius: 5px;">
													<option value="electrical">ELECTRICAL</option>
													<option value="plumbing">PLUMBING</option>
													<option value="mechanical">MECHANICAL</option>
													<option value="telecomunication">TELECOMUNICATION</option>
													<option value="civil_landscape">CIVIL LANDSCAPE</option>
													<option value="infrastructure">INFRASTRUCTURE</option>
											</select></td>
										</tr>
										<tr>
											<td>
												<p class="mb-0">COMPLAINT DATE</p>
											</td>
											<td>
												<input id="currentDate" type="date" name="comp_date" readonly />
											</td>
										</tr>
										<tr>
											<td>
												<p class="mb-0">COMPLAINT DESCRIPTION</p>
											</td>
											<td><input type="text" name="comp_desc"
												style="padding: 0 5px; border-radius: 5px;" size="60"
												placeholder="Description about problem and place if any.">
											</td>
										</tr>
									</tbody>
								</table>
								<div
									style="display: flex; justify-content: center; align-items: center;">
									<button type="submit" class="btn btn-primary"
										style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;">APPLY</button>
									<button type="reset" class="btn btn-secondary"
										style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;">RESET</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</main>
	<script>
		//Date purpose
		var date = new Date();
		var currentDate = date.toISOString().slice(0, 10);
		var currentTime = date.getHours() + ':' + date.getMinutes();
		document.getElementById('currentDate').value = currentDate;
	</script>

</body>
</html>
