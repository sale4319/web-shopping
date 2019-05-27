<%@include file="../shared/flows-header.jsp"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<div class="row">

		<div class="col-md-6 offset-3">
		<div class="card">
			
				<div class="card-header text-white bg-primary">
					<h4>Sign Up - Address</h4>
				</div>
				<div class="card-body">
					<!-- FORM ELEMENTS -->
					<sf:form 
							method="POST"
							modelAttribute="billing"
							class="form-horizontal"
							id="billingForm">
						
						<div class="form-group row">
							<label for="addressLineOne" class="col-md-4 col-form-label"><strong>Address Line One: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="addressLineOne" placeholder="Enter Address Line One" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label for="addressLineTwo" class="col-md-4 col-form-label"><strong>Address Line Two: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="addressLineTwo" placeholder="Enter Address Line Two" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label for="city" class="col-md-4 col-form-label"><strong>City: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="city" placeholder="Enter City Name" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label for="postalCode" class="col-md-4 col-form-label"><strong>Postal Code: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="postalCode" placeholder="XXXXXXXX" class="form-control" />
								
							</div>
						</div>
						
						<div class="form-group row">
							<label for="state" class="col-md-4 col-form-label"><strong>State: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="state" placeholder="Enter State Name" class="form-control" />
								
							</div>
						</div>
												
					<div class="form-group row">
							<label for="country" class="col-md-4 col-form-label"><strong>Country: </strong></label>
							<div class="col-md-8">
								<sf:input type="text" path="country" placeholder="Enter Country Name" class="form-control" />
								
							</div>
						</div>
    					 
    				<div class="form-group">
						<div class="col-md-8 offset-4">
							<button type="submit" name="_eventId_personal" class="btn btn-primary">
								<span class="fa fa-chevron-left" ></span>Back - Personal
							</button>
							<button type="submit" name="_eventId_confirm" class="btn btn-primary">
								Next - Confirm<span class="fa fa-chevron-right" ></span>
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