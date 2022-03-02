<%@ page language="java" contentType="text/html" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<script src="js/bootstrap.js"></script>
<title>Registration</title>
</head>
<body>


	<div class="container">
		<div class="row mt-4">

			<div class="col"></div>
			<div class="col">

				<h3 class="display-6 text-white">Register on JobPortal for Free</h3>
				<hr />
				<form class="regForm" action="register" method="POST"
					autocomplete="off">

					<c:if test="${param.registered != null}">
						<div class="alert alert-success alert-dismissible fade show">
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> You have been registered successfully.
						</div>
					</c:if>

					<c:if test="${param.deleted != null}">
						<div class="alert alert-warning alert-dismissible fade show">
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							Good Bye ! Your account has been deleted successfully.
						</div>
					</c:if>

					<c:if test="${param.error eq 'passmismatched'}">
						<div class="alert alert-danger alert-dismissible fade show">
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Error!</strong> Error : Password and confirm password did
							not match.
						</div>
					</c:if>

					<div class="row">
						<div class="col">
							<label for="firstName" class="form-label">First Name :</label> <input
								autofocus="autofocus" required="required" type="text"
								class="form-control" id="firstName"
								placeholder="Enter First name" name="firstName">
						</div>
						<div class="col">
							<label for="middleName" class="form-label">Middle Name :</label>
							<input autofocus="autofocus" required="required" type="text"
								class="form-control" id="middleName"
								placeholder="Enter middle name" name="middleName">
						</div>
						<div class="col">
							<label for="lastName" class="form-label">Last Name :</label> <input
								autofocus="autofocus" required="required" type="text"
								class="form-control" id="lastName" placeholder="Enter last name"
								name="lastName">
						</div>
					</div>

					<div class="row">
						<div class="col-6">
							<label for="gender" class="form-label">Gender</label> <select
								name="gender" class="form-select"
								aria-label="Default select example">
								<option value="">Select</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>
						<div class="col"></div>
					</div>

					<div class="row">
						<div class="col">
							<label for="email" class="form-label">Email :</label> <input
								required="required" class="form-control"
								placeholder="Enter email" required="required" type="email"
								id="email" name="email">
						</div>
						<div class="col">
							<label for="contactNumber" class="form-label">Contact
								Number :</label> <input class="form-control" id="contactNumber"
								placeholder="Enter contact Number" type="text"
								id="contactNumber" name="contactNumber">
						</div>
					</div>

					<div class="row">
						<div class="col">
							<label for="username" class="form-label">Username :</label> <input
								class="form-control" placeholder="Enter Username" id="username"
								required="required" type="text" name="username">
						</div>
					</div>

					<div class="row">
						<div class="col">
							<label for="password" class="form-label">Password :</label> <input
								class="form-control" placeholder="Enter Password" id="password"
								required="required" type="password" name="password">
						</div>
					</div>

					<div class="row">
						<div class="col">
							<label for="confirmPassword" class="form-label">Confirm
								Password :</label> <input placeholder="Confirm Password"
								class="form-control" id="confirmPassword" required="required"
								type="password" name="confirmPassword">
						</div>
					</div>

					<div class="row  mt-2">
						<div class="col">
							<input class="form-check-input" type="checkbox" value="true"
								name="termsAndCondition" id="termsAndCondition"> <label
								class="form-check-label" for="termsAndCondition">
								Clicking Register, you agree to the Terms and Conditions &
								Privacy Policy </label>
						</div>
					</div>

					<hr />

					<button class="btn btn-success" type="submit">Register Now</button>
					<button class="btn btn-secondary" type="reset">Clear</button>
					| Already Registered? <a class="link-info" href="login.jsp">
						Login here</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>