<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Student Login</title>
<!-- add icon link -->
<link rel="icon" href="../assets/images/h_logo.svg" type="image/x-icon">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="../assets/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<img src="../assets/images/hostel.png" style="position: absolute; top: 0px; left: 0px; height: 100%; width: 1920px; object-fit: cover; overflow-y: hidden;" alt="background">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<main class="form-signin">
					<form action="../LoginStudentController" method="post">
						<img class="mb-4" src="../assets/images/hostel_logo.svg" alt="" width="300" height="100">
						<ul class="nav nav-pills navtab-bg nav-justified">
							<li class="nav-item"><a href="../student/signin_student.jsp" data-toggle="tab" aria-expanded="true" class="nav-link active">Student</a></li>
							<li class="nav-item"><a href="../staff/signin_staff.jsp" data-toggle="tab" aria-expanded="false" class="nav-link">Staff</a></li>
						</ul><br><br>
						<h1 class="h3 mb-3 fw-normal">Student Login</h1>
						<!-- Input for student no and password -->
						<div class="mb-3">
							<input class="form-control" type="text" placeholder="Student No" name="stu_no" required>
						</div>
						<div class="mb-3">
							<input class="form-control" type="password" placeholder="Password" name="stu_pass" required>
						</div>
						<button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button><br><br>
						<div class="checkbox mb-3">
							<a target="_blank" href="#" class="text-muted"><i class="bi-lock"></i> Forget Password?</a>
						</div>
						<button onclick="document.location='../index.html'" type="button" class="btn btn-success "><i class="bi bi-arrow-left"></i>Home</button>
						<p class="mt-5 mb-3 text-muted">&copy; 2021–2022</p>
					</form>
				</main>
			</div>
		</div>
	</div>
</body>
</html>