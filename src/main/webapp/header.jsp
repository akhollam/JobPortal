<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ sessionScope['user'] eq null }">
	<c:redirect url="/login.jsp" />
</c:if>

<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><strong>JobPortal</strong></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
				
				<a class="nav-link active"
					aria-current="page" href="welcome.jsp">Home</a>
					
					</li>
				<li class="nav-item">
				
				<a class="nav-link" href="profile">Edit
						Profile </a>
						
				</li>
				<li class="nav-item">
					<form method="POST" action="profile" style="display: inline;">
						<input type="hidden" name="action" value="DELETE"> <a
							type="submit" class="nav-link">Delete My Account</a>
					</form>
				</li>
			</ul>
			<span class="navbar-text"> Welcome Mr. ${ sessionScope['user'].firstName}
				${sessionScope['user'].lastName }  <a href="logout" >logout</a> </span>
		</div>
	</div>
</nav>

