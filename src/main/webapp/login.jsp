<%@ page language="java" contentType="text/html;" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
</head>
<body>
	<h3>Login</h3>
	
	<hr />
	
	<c:if test="${param.loginfailed != null}">
		<h5 style="color: red" >Invalid username or password. Please try again.</h5>
	</c:if>
	
	<c:if test="${param.loggedout != null }">
		<h5 style="color: green" >You have been loggedout successfully.</h5>
	</c:if>
	
	<form action="login" method="POST" autocomplete="off">

		Username : <input autofocus="autofocus" required="required" type="text" name="username"> <br/>
		Password : <input required="required" type="password" name="password"><br/>
		
		Recruiter <input type="radio" value="Recruiter" name="loginType">  
		Job Seeker <input type="radio" value="JobSeeker" name="loginType"><br/><br/>

		<button type="submit">Login</button>
		<button type="reset">Clear</button> OR <a href="register.jsp" > Register for Free </a>
	</form>
	
</body>
</html>