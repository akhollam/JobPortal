<%@ page language="java" contentType="text/html" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Registration</title>
</head>
<body>

	<c:set var="myVar" value="Hello" scope="request" ></c:set>

	<h3>Register on JobPortal for Free</h3>
	<hr />
	
	<c:if test="${param.registered != null}">
		<h5 style="color: green">You have been registered successfully.</h5>
	</c:if>
	
	<c:if test="${param.deleted != null}">
		<h5 style="color: green">Good Bye ! Your account has been deleted successfully.</h5>
	</c:if>
	
	<c:if test="${param.error eq 'passmismatched'}">
		<h5 style="color: red">Error : Password and confirm password did not match.  </h5>
	</c:if>
	
	<form action="register" method="POST" autocomplete="off">

		First Name :
		<input autofocus="autofocus" required="required" type="text"
			name="firstName">
		<br />

		Middle Name :
		<input type="text" name="middleName">
		<br />
		Last Name :
		<input required="required" type="text" name="lastName">
		<br />

		Gender :
		<select name="gender">
			<option value="" >Select</option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
		</select>
		<br />

		Email :
		<input required="required" type="text" name="email">
		<br />
		Contact Number :
		<input required="required" type="text" name="contactNumber">
		<br />

		Username :
		<input required="required" type="text" name="username">
		<br />
		Password :
		<input required="required" type="password" name="password">
		<br />
		Confirm Password :
		<input required="required" type="password" name="confirmPassword">
		<br />

		Address : 
		<textarea rows="4" cols="100" name="address"></textarea><br />
		
		<input type="checkbox" value="termsAndCondition" >
			By clicking Register, you agree to the Terms and Conditions & Privacy Policy 
		<br />
	
		<button type="submit">Register Now</button>
		<button type="reset">Clear</button>
		|
		<a href="login.jsp"> Login</a>
	</form>
</body>
</html>