<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix='spring' uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Online Shopping Website Using Spring MVC and Hibernate">
<meta name="author" content="Aleksandar">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>Web Shopping - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}';
</script>



<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<!-- Fontawesome CSS -->
<link href="${css}/font-awesome.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top ">
	<div class="container">
		<a href="${contextRoot}/home" class="navbar-brand"><img src="${contextRoot}/resources/images/ws.png" width="205" height="35"></a>
		
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto">					
			</ul>			
		</div>
	</div>
</nav>


		<!-- Page Content -->
		<div class="content">
			<div class="container">
			
			<!-- This will be displayed if the credentials are wrong -->
			<c:if test="${not empty message}">
				<div class="row">

					<div class="col-md-6 offset-3">
						
						<div class="alert alert-danger">${message}</div>
					
					</div>
				</div>
			
			</c:if>
			
			<!-- This will be displayed if user has logged out -->
			<c:if test="${not empty logout}">
				<div class="row">

					<div class="col-md-6 offset-3">
						
						<div class="alert alert-success">${logout}</div>
					
					</div>
				</div>
			
			</c:if>
			
			<div class="row">

		<div class="col-md-6 offset-3">
		<div class="card">
			
				<div class="card-header text-white bg-primary">
					<h4>Login</h4>
				</div>
				<div class="card-body">
					<!-- FORM ELEMENTS -->
					<form 
							action="${contextRoot}/login" 
							method="POST"
							class="form-horizontal"
							id="loginForm">
						
						<div class="form-group row">
							<label for="username" class="col-md-4 col-form-label"><strong>Email: </strong></label>
							<div class="col-md-8">
								<input type="text" name="username" id="username" class="form-control" />					
							</div>
						</div>		
						
						<div class="form-group row">
							<label for="password" class="col-md-4 col-form-label"><strong>Password: </strong></label>
							<div class="col-md-8">
								<input type="password" name="password" id="password" class="form-control" />					
							</div>
						</div>													
    					 
    				<div class="form-group">
						<div class="col-md-8 offset-4">
							<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/> 
							<input type="submit" value="Login" class="btn btn-primary"/>
						</div>
					</div>
					</form>
				</div>
			</div>
		
		</div>
	</div>

		</div>
		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.min.js"></script>
		
		<!-- jQuery Validate -->
		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>		

		<!-- Self coded javascrpit -->
		<script src="${js}/myapp.js"></script>
	</div>
</body>

</html>