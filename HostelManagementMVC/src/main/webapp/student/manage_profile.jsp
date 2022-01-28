<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
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
			<a href="/"
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
					class="nav-link text-white"> <i
						class="bi bi-exclamation-square"></i> Complaint
				</a></li>
				<li class="nav-item"><a href="ManageProfileStudentController?stu_no=${student.stu_no}"
					class="nav-link active" aria-current="page"> <i
						class="bi bi-person-circle"></i> Manage Profile
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
						<h4 class="card-title">MANAGE STUDENT PROFILE</h4>
						<!--start div table   -->
						<form action="ManageProfileStudentController?action=update_profile&stu_no=${student.stu_no}" method="post">
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
												<p class="mb-0">GENDER</p>
											</td>
											<td>
												<h5 class="mb-0">${student.stu_gender}</h5>
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
												<p class="mb-0">STATE</p>
											</td>
											<td>
												<h5 class="mb-0">${student.stu_state}</h5>
											</td>
										</tr>
										<tr>
											<td>
												<p class="mb-0">PART</p>
											</td>
											<td>
												<input type="number" name="stu_part" value="${student.stu_part}" style="padding: 0 5px; border-radius: 5px;" size="30"/>
											</td>
										</tr>
										<tr>
											<td>
												<p class="mb-0">EMAIL</p>
											</td>
											<td>
												<input type="email" name="stu_email" value="${student.stu_email}" style="padding: 0 5px; border-radius: 5px;" size="30"/>
											</td>
										</tr>
										<tr>
											<td>
												<p class="mb-0">PHONE NO</p>
											</td>
											<td>
												<input type="text" name="stu_phoneno" value="${student.stu_phoneno}" style="padding: 0 5px; border-radius: 5px;" size="30"/>
											</td>
										</tr>
										<tr>
											<td>
												<p class="mb-0">BLOOD TYPE</p>
											</td>
											<td>
												<input type="text" name="stu_blood" value="${student.stu_blood}" style="padding: 0 5px; border-radius: 5px;" size="30"/>
											</td>
										</tr>
										
									</tbody>
									
								</table>
								<div
								style="display: flex; justify-content: center; align-items: center;">
								<button type="submit" class="btn btn-primary" style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;">SAVE</button>
							</div>
							</div>
						</form>
						<h4 class="card-title">CHANGE PASSWORD</h4>
						<form action="ManageProfileStudentController?action=change_pass&stu_no=${student.stu_no}" method="post">
							<table class="table table-centered table-nowrap">
								<tbody>
									<tr>
										<td>
											<p class="mb-0">CURRENT PASSWORD</p>
										</td>
										<td><input type="password" id="current_pass"
											name="current_pass"
											style="padding: 0 5px; border-radius: 5px;" size="30">
										</td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">ENTER NEW PASSWORD</p>
										</td>
										<td><input type="password" id="new_pass" name="new_pass"
											style="padding: 0 5px; border-radius: 5px;" size="30"
											onkeyup='check();'></td>
									</tr>
									<tr>
										<td>
											<p class="mb-0">RE-ENTER NEW PASSWORD</p>
										</td>
										<td><input type="password" id="confirm_pass"
											name="confirm_pass"
											style="padding: 0 5px; border-radius: 5px;" size="30"
											onkeyup='check();'><br />
										<br /> <input type="checkbox" onclick="showPass()">
											Show Password</td>
									</tr>
								</tbody>
							</table>
							<div
								style="display: flex; justify-content: center; align-items: center;">
								<button id="sub" type="submit" class="btn btn-primary"
									style="margin: 10px; padding: 5px 50px 5px 50px; border-radius: 10px;"
									disabled>SUBMIT</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</main>


	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="sidebars.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
      function showPass() {
    	  var x = document.getElementById("current_pass");
    	  var y = document.getElementById("new_pass");
    	  var z = document.getElementById("confirm_pass");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } 
    	  else {
    	    x.type = "password";
    	  }

    	  if (y.type === "password") {
    	    y.type = "text";
    	  } 
    	  else {
    	    y.type = "password";
    	  }

    	  if (z.type === "password") {
    	    z.type = "text";
    	  } 
    	  else {
    	    z.type = "password";
    	  }
    	}
      
      var check = function() {
    	  if (document.getElementById('new_pass').value == document.getElementById('confirm_pass').value) {
    	    document.getElementById("sub").disabled = false;
    	  } 
    	  else {
    	    document.getElementById("sub").disabled = true;
    	  }
    	}
      
      </script>
</body>
</html>
