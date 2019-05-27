<%@include file="../shared/flows-header.jsp"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<div class="row">

		<div class="col-md-6 offset-3">
		<div class="card">
			
				<div class="card-header text-white bg-primary">
					<h4>Sign Up - Personal</h4>
				</div>
				<div class="card-body">
					<!-- FORM ELEMENTS -->
					<sf:form 
							method="POST"
							modelAttribute="user"
							class="form-horizontal"
							id="registerForm">
						
						<div class="form-group row">
							<label class="col-md-4 col-form-label"><strong>First Name: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="firstName" placeholder="First Name" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label  class="col-md-4 col-form-label"><strong>Last Name: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="lastName" placeholder="Last Name" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-md-4 col-form-label"><strong>Email: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="email" placeholder="ex@example.com" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-md-4 col-form-label"><strong>Contact Number: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="contactNumber" placeholder="XXXXXXXXXX" maxlength="10" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label  class="col-md-4 col-form-label"><strong>Password: </strong></label>
							<div class="col-md-8">
								<sf:input type="password" path="password" placeholder="Password" class="form-control" />
								
							</div>
						</div>
												
					<div class="form-group row">
						<label class="control-label col-md-4">Select Role</label>
						<div class="col-md-8">
							<label class="radio-inline">
								<sf:radiobutton path="role" value="USER" checked="checked"/> User 				
							</label>
							<label class="radio-inline">
								<sf:radiobutton path="role" value="SUPPLIER"/> Supplier
							</label>
						</div>
					</div>	
    					 
    				<div class="form-group">
						<div class="col-md-8 offset-4">
							<button type="submit" name="_eventId_billing" class="btn btn-primary">
								Next - Billing<span class="fa fa-chevron-right" ></span>
							</button>
						</div>
					</div>
					</sf:form>
				</div>
			</div>
		
		</div>
	</div>
</div>

<%@include file="../shared/flows-footer.jsp"%>