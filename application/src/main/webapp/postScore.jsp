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

<title>Post Your Score</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<nav class="navbar navbar-dark bg-primary navbar-inverse">
		<a class="navbar-brand" href="home" style="color: white;">My Golf Pro</a>
		<ul class="nav navbar-nav" style="float: right;">
			<li><a href="instruction" class="nav-link" style="color: white;">Instruction</a></li>
			<li><a href="videos" class="nav-link" style="color: white;">Videos</a></li>
			<li><a href="postScore" class="nav-link" style="color: white;">Post Score</a></li>
			<li><a href="newsFeed" class="nav-link" style="color: white;">News Feed</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" style="color: white;">${fName } ${lName }<b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="home" class="nav-link">Home</a></li>
					<li class="divider"></li>
					<li><a href="home" class="nav-link">About</a></li>
					<li class="divider"></li>
					<li><a href="home" class="nav-link">Settings</a></li>
					<li class="divider"></li>
					<li class="nav-item"><a class="nav-link" href=""
						onclick="document.forms['logoutForm'].submit()">Logout</a></li>
				</ul></li>
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
		
	</div>

	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
