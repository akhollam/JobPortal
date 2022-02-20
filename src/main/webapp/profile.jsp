<%@ page language="java" contentType="text/html" isELIgnored="false"
	session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Profile</title>
</head>
<body>

	<%@include file="header.jsp"%>

	<c:if test="${ param['updated'] != null }">
		<h5 style="color: green">Profile updated successfully.</h5>
	</c:if>

	Profile Information (
	<a href="profile?edit">edit</a> |
	<a href="changePassword.jsp"> Change Password</a>)
	<br />
	<br />

	<c:choose>
		<c:when test="${ param['edit'] != null }">
			<form action="profile" method="POST" autocomplete="off">
				<input type="hidden" name="id" value="${sessionScope['user'].id }">
				<input type="hidden" name="action" value="UPDATE">
				<strong>First Name : </strong><input required="required" type="text"
					name="firstName" value="${ sessionScope['user'].firstName }">
				<br /> <strong>Middle Name : </strong><input type="text"
					name="middleName" value="${ sessionScope['user'].middleName }">
				<br /> <strong>Last Name : </strong><input required="required"
					type="text" name="lastName"
					value="${ sessionScope['user'].lastName }"><br /> <strong>Username
					: </strong><input required="required" type="text" name="username"
					value="${ sessionScope['user'].username }"><br /> <strong>Gender
					: </strong> 
					
				<select name="gender" >
					<c:if test="${ sessionScope['user'].gender eq 'Male'}">selected</c:if>
					<option value="">Select</option>
					<option value="Male"
						<c:if test="${ sessionScope['user'].gender eq 'Male'}">selected="selected"</c:if>>Male</option>
					<option value="Female"
						<c:if test="${ sessionScope['user'].gender eq 'Female'}">selected="selected"</c:if>>Female</option>
				</select> <br /> 
				
				<strong>Skills : </strong> <br />
				<c:forEach var="skill" items="${ requestScope.skills }">
					<c:forEach var="userSkill" items="${ requestScope.skills }">
						<c:choose>
							<c:when test="${ skill eq  userSkill}">
								<input type="checkbox" name="mySkills" value="${ skill }" checked="checked" > ${skill } <br />
							</c:when>
						</c:choose>
					</c:forEach>
				</c:forEach>
				
				<button type="submit">Update Profile</button>
				
			</form>
		</c:when>
		<c:otherwise>
			<strong>First Name : </strong> ${ fn:toUpperCase(sessionScope['user'].firstName) } <br />
			<strong>Middle Name : </strong> ${ sessionScope['user'].middleName } <br />
			<strong>Last Name : </strong>${ sessionScope['user'].lastName } <br />
			<strong>Gender : </strong> ${ sessionScope['user'].gender } <br />
			<strong>Username : </strong> ${ sessionScope['user'].username } <br />
			<strong>Contact Number : </strong> ${ sessionScope['user'].contactNumber } <br />
			<strong>Skills : </strong> ${ sessionScope['user'].skills }
			<br />
		</c:otherwise>
	</c:choose>

</body>
</html>