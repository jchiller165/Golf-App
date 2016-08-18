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

<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<body>

	<nav class="navbar navbar-dark bg-primary">
		<a class="navbar-brand" href="#" style="color: white;">Justin's
			App</a>
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

		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<h2 class="form-signin-heading">Create your account</h2>

			<spring:bind path="fName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="fName" class="form-control"
						placeholder="First Name" autofocus="true"></form:input>
					<form:errors path="fName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="lName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="lName" class="form-control"
						placeholder="Last Name" autofocus="true"></form:input>
					<form:errors path="lName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="username">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="username" class="form-control"
						placeholder="Username" autofocus="true"></form:input>
					<form:errors path="username"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="password" path="password" class="form-control"
						placeholder="Password"></form:input>
					<form:errors path="password"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="passwordConfirm">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="password" path="passwordConfirm"
						class="form-control" placeholder="Confirm your password"></form:input>
					<form:errors path="passwordConfirm"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="email" path="email" class="form-control"
						placeholder="Enter Valid Email"></form:input>
					<form:errors path="email"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
