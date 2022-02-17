<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ sessionScope['user'] eq null }">
	<c:redirect url="/login.jsp" />
</c:if>

<h3>Welcome ${ sessionScope['user'].firstName} ${sessionScope['user'].lastName } to JobPortal.</h3>
<a href="profile" >Edit Profile Now </a> | <a href="logout"> Logout</a>
<hr />