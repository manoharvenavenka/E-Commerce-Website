<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../custheader.jsp"></jsp:include>
	


	<%
	session.invalidate();
	%>

	<center>
		<h1 style="color: green;">You have been successfully logged out</h1>

		<button type="button" class="btn btn-outline-danger float-left"
			onclick="window.location.href='../index.jsp'">Back to Index
			page</button>
	</center>
</body>
</html>