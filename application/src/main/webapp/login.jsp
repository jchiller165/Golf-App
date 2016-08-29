<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<title>Log in with your account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<body>
	<nav class="navbar navbar-dark bg-primary navbar-inverse">
		<a class="navbar-brand" href="#" style="color: white;">My Golf Pro</a>
		<ul class="nav navbar-nav" style="float: right;">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" style="color: white;"><b
					class="caret"></b> Welcome</a>
				<ul class="dropdown-menu">
					<li><a href="welcome" class="nav-link">Home</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav-link">About</a></li>
				</ul></li>
		</ul>
	</nav>
	<div class="container">

		<form method="POST" action="${contextPath}/login" class="form-signin">
			<h2 class="form-heading" style="text-align: center">Log in</h2>

			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span>${message}</span> <input name="username" type="text"
					class="form-control" placeholder="Username" autofocus="true" /> <input
					name="password" type="password" class="form-control"
					placeholder="Password" /> <span>${error}</span> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<button class="btn btn-lg btn-primary btn-block" type="submit">Log
					In</button>
				<h4 class="text-center">
					<a href="${contextPath}/registration">Create an account</a>
				</h4>
			</div>

		</form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
