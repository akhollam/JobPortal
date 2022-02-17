<%@ page import="java.util.Date"%>
<%@ page language="java" isErrorPage="true" info="Index JSP Page"
	autoFlush="true" contentType="text/html;" session="true" pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
</head>
<body>

	<%!
		public void testMethod(){
			Date date = new Date();
		}
	%>

	<%
	
		String name = request.getParameter("name");
	
		out.println(request.getServerName() + " <br/> " );
		out.println(request.getServerPort()+ " <br/> " );
		out.println(request.getContentType()+ " <br/> " );
		out.println(request.getContentLength()+ " <br/> " );
		
		out.print(response.getStatus());
		
		config.getInitParameter("name");
		application.getInitParameter("name");
		
		out.print(session.isNew());
		pageContext.setAttribute("name", "Abhijeet", PageContext.SESSION_SCOPE);
		
		
	%>
	
	My server name is - <%= request.getServerName() %>

</body>
</html>