<%@ page language="java" contentType="text/html;" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.js"></script>
</head>
<body>

	<div class="container">

		<div class="container">
			<div class="row mt-5">
				<div class="col-sm">

					<div class="jumbotron text-white rounded">
						<h1 class="display-5">Welcome to BrainWorks !!!</h1>
						<p class="lead">This is a simple hero unit, a simple
							jumbotron-style component for calling extra attention to featured
							content or information.</p>
						<hr class="my-4">
						<p>It uses utility classes for typography and spacing to space
							content out within the larger container.</p>
						<p class="lead">
							<a class="btn btn-primary btn-lg" href="#" role="button"> Register Now </a>
						</p>
					</div>

				</div>
				
				<div class="col-sm">
					<h1 class="display-5">Login</h1>
					<form id="loginFormId" class="loginFormClass" action="login"
						method="POST" autocomplete="off">

						<c:if test="${param.loginfailed != null}">
							<div class="alert alert-danger alert-dismissible fade show">
								<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								<strong>Error!</strong> Invalid username or password. Please try
								again.
							</div>
						</c:if>

						<c:if test="${param.loggedout != null }">
							<div class="alert alert-success alert-dismissible fade show">
								<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
								You have been logged out successfully.
							</div>
						</c:if>

						<div class="mb-3 mt-3">
							<label for="username" class="form-label">Username :</label> <input
								autofocus="autofocus" required="required" type="text"
								class="form-control" id="username" placeholder="Enter username"
								name="username">
						</div>

						<div class="mb-3 mt-3">
							<label for="password" class="form-label">Password :</label> <input
								autofocus="autofocus" required="required" type="password"
								class="form-control" id="password" placeholder="Enter Password"
								name="password">
						</div>

						<input type="radio" value="Recruiter" id="Recruiter"
							name="loginType"> <label for="Recruiter">Recruiter</label>
						<input type="radio" id="JobSeeker" value="JobSeeker"
							name="loginType"> <label for="JobSeeker">Job
							Seeker </label> <br />
						<hr>
						<button class="btn btn-success" type="submit">Login</button>
						<button type="reset" class="btn btn-secondary">Clear</button>
						OR <a href="register.jsp" class="link-info"> Register for Free </a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>