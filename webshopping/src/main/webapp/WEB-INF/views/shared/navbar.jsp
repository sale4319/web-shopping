<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Navigation -->

<nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top ">
	<div class="container">
		<a href="${contextRoot}/home" class="navbar-brand"><img src="${contextRoot}/resources/images/ws.png" width="205" height="35"></a>
		
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto">

				<li id="about" class="nav-item">
				<a class="nav-link" href="${contextRoot}/about">About</a></li>
 				
				<li id="contact" class="nav-item">
				<a class="nav-link" href="${contextRoot}/contact">Contact</a></li>
				 
				<li id="listProducts" class="nav-item">
				<a class="nav-link" href="${contextRoot}/show/all/products">View Products</a></li>
				
				<security:authorize access="hasAuthority('ADMIN')">
				<li id="manageProducts" class="nav-item">
				<a class="nav-link" href="${contextRoot}/manage/products">Manage Products</a></li>
				</security:authorize>
			
			</ul>
			<ul class="navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">
				<li id=register class="nav-item">
				<a class="nav-link" href="${contextRoot}/register">Sign Up</a></li>				
				<li id="login" class="nav-item">
				<a class="nav-link" href="${contextRoot}/login">Login</a></li>				
				</security:authorize>	  
				
				<security:authorize access="isAuthenticated()">
				 <li class="nav-item dropdown">
				   <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)" id="dropdownMenu1" role="button" aria-haspopup="true" aria-expanded="false">${userModel.fullName}</a>
				    <div class="dropdown-menu">
				    <security:authorize access="hasAuthority('USER')">
				      <a class="dropdown-item" href="${contextRoot}/cart/show"><i class="fa fa-shopping-cart"></i><span class="badge">${userModel.cart.cartLines}</span>- &euro; ${userModel.cart.grandTotal}</a>
				    <div class="dropdown-divider"></div>
				    </security:authorize>
			    	  <a class="dropdown-item" href="${contextRoot}/perform-logout">Logout</a>
			        </div>
				 </li>
 				</security:authorize>
			</ul>
		</div>
	</div>
</nav>
<script>
	
	window.userRole = '${userModel.role}';

</script>