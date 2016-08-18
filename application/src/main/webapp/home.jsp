<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<nav class="navbar navbar-dark bg-primary">
		<a class="navbar-brand" href="#" style="color: white;">Justin's
			App</a>
		<ul class="nav navbar-nav" style="float: right;">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" style="color: white;">${fName } ${lName }<b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="welcome" class="nav-link">Home</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav-link">About</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav-link">Settings</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href=""
				onclick="document.forms['logoutForm'].submit()"
				style="color: white;">Logout</a></li>
		</ul>
	</nav>
	<div class="container" style="text-align: left;">

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</c:if>
	</div>

	<div class="container">
		<center>
			<h1>Welcome: ${fName }!</h1>
			<h1>Welcome: ${userType }!</h1>
			<h1>Welcome: ${skillLevel }!</h1>
		</center>
	</div>

	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
