<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">

	<div class="row">

		<c:if test="${not empty message}">

			<div class="col-12">

				<div class="alert alert-success alert-dissmisable">

					<button type="button" class="close" data-dismiss="alert">&times;</button>

					${message}

				</div>
			</div>
		</c:if>

		<div class="col-md-8 offset-2">

			<div class="card">

				<div class="card-header text-white bg-primary">
					<h4>Product Management</h4>
				</div>

				<div class="card-body">
					<!-- FORM ELEMENTS -->

					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="form-group row">

							<label for="name" class="col-md-4 col-form-label"><strong>Enter Product Name: </strong></label>

							<div class="col-md-8">

								<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control" />

								<sf:errors path="name" cssClass="help-block" element="em" />

							</div>

						</div>

						<div class="form-group row">

							<label for="brand" class="col-md-4 col-form-label"><strong>Enter Brand Name: </strong></label>

							<div class="col-md-8">

								<sf:input type="text" path="brand" name="brand" id="brand" placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />

							</div>
						</div>
						
						<div class="form-group row">

							<label for="description" class="col-md-4 col-form-label"><strong>Product Description: </strong></label>

							<div class="col-md-8">

								<sf:textarea class="form-control" path="description" id="description" rows="4"></sf:textarea>
								<sf:errors path="description" cssClass="help-block" element="em" />
							
							</div>

						</div>

						<div class="form-group row">

							<label for="unitPrice" class="col-md-4 col-form-label"><strong>Enter Unit Price: </strong></label>

							<div class="col-md-8">

								<sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit price in EUR" class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />

							</div>
						</div>

						<div class="form-group row">

							<label for="quantity" class="col-md-4 col-form-label"><strong>Quantity: </strong></label>

							<div class="col-md-8">

								<sf:input type="number" path="quantity" id="quantity" placeholder="Quantity Available" class="form-control" />

							</div>
						</div>

						<!-- FILE ELEMET FOR IMAGE -->
						<div class="form-group row">

							<label for="file" class="col-md-4 col-form-label"><strong>Select and Image: </strong></label>

							<div class="col-md-8">
							
								<sf:input type="file" path="file" id="file" class="form-control-file" aria-describedby="fileHelp"/>
								 <small id="fileHelp" class="form-text text-muted">Choose an image for your product.</small>		
							</div>

						</div>


						<div class="form-group row">
							<label for="categoryId" class="col-md-4 col-form-label"><strong>Select Category</strong></label>
							
							<div class="col-md-8">
								
								<sf:select class="form-control" path="categoryId" id="categoryId" items="${categories}" itemLabel="name" itemValue="id" />

							</div>
						</div>

						<div class="form-group">

							<div class="col-md-8 offset-4">

								<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary" />

								<!-- Hidden field area -->
								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />

							</div>

						</div>


					</sf:form>

				</div>
			</div>

		</div>

	</div>



</div>