<%@include file="../shared/flows-header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<div class="card">

				<div class="card-header text-white bg-primary">
					<h4>Personal Details</h4>
				</div>

				<div class="card-body">
					<div class="text-center">
					Personal details here
				</div>
				<div class="card-footer">
				<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
				</div>
			</div>
		</div>
	</div>

		<div class="col-sm-6">
			<div class="card">

				<div class="card-header text-white bg-primary">
					<h4>Billing Address</h4>
				</div>

				<div class="card-body">
					<div class="text-center">
					Billing address details here
				</div>
				<div class="card-footer">
				<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
				</div>
			</div>
		</div>

	</div>
	</div>
	</div>
	<div class="row">
		<div class="col-sm-4 offset-4">
			<div class="text-center">
					<br/>
				<a href="${flowExecutionUrl}&_eventId_success" class="btn btn-primary">Confirm</a>

			</div>
		</div>
	</div>
	
	


<%@include file="../shared/flows-footer.jsp"%>