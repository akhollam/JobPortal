<%@ page language="java" contentType="text/html" isELIgnored="false" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Profile</title>
</head>
<body>

	<%@include file="header.jsp" %>
	
	<c:if test="${ param['updated'] != null }">
		<h5 style="color: green" >Profile updated successfully. </h5>
	</c:if>
	
	Profile Information (<a href="profile.jsp?edit">edit</a> | <a href="changePassword.jsp"> Change Password</a>) <br />
	<br />	
	
	<p>Here - ${requestScope.test1 }</p>
	
	<c:choose>
		<c:when test="${ param['edit'] != null }">
			<form action="register" method="POST" autocomplete="off">
				<strong>First Name : </strong><input required="required" type="text" name="firstName" value="${ sessionScope['user'].firstName }" > <br/>
				<strong>Middle Name : </strong><input type="text" name="middleName" value="${ sessionScope['user'].middleName }"> <br/>
				<strong>Last Name : </strong><input required="required" type="text" name="lastName" value="${ sessionScope['user'].lastName }"><br/>
				<strong>Username : </strong><input required="required"type="text" name="username" value="${ sessionScope['user'].username }"><br/>
				
				<strong>Gender : </strong>
				<select>
					<c:if test="${ sessionScope['user'].gender eq 'Male'}">selected</c:if>
					<option value="" >Select</option>
					<option value="Male" <c:if test="${ sessionScope['user'].gender eq 'Male'}">selected="selected"</c:if> >Male</option>
					<option value="Female" <c:if test="${ sessionScope['user'].gender eq 'Female'}">selected="selected"</c:if>>Female</option>
				</select>
				<br/>
				
				<button type="submit">Update Profile</button>
			</form>
		</c:when>
		<c:otherwise>
			<strong>First Name : </strong> ${ fn:toUpperCase(sessionScope['user'].firstName) } <br/>
			<strong>Middle Name : </strong> ${ sessionScope['user'].middleName } <br/>
			<strong>Last Name : </strong>${ sessionScope['user'].lastName } <br/>
			<strong>Gender : </strong> ${ sessionScope['user'].gender } <br/>
			<strong>Username : </strong> ${ sessionScope['user'].username } <br/>
			<strong>Contact Number : </strong> ${ sessionScope['user'].contactNumber } <br/>
		</c:otherwise>
	</c:choose>
	
</body>
</html>