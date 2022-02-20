<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ sessionScope['user'] eq null }">
	<c:redirect url="/login.jsp" />
</c:if>

<h3>Welcome ${ sessionScope['user'].firstName}
	${sessionScope['user'].lastName } to JobPortal.</h3>
<a href="profile">Edit Profile Now </a>
| 
<form method="POST" action="profile">
	<input type="hidden" name="action" value="DELETE">
	<button type="submit">Delete My Account</button>
</form>
|
<a href="logout"> Logout</a>
<hr />