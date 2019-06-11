<div class="container">

	<c:if test="${not empty message}">
	
		<div class="alert alert-info">
			<h3 class="text-center"> ${message}</h3>						
		</div>
	</c:if>
	
	<c:choose>

		<c:when test="${not empty cartLines}">
			<div class="card shopping-cart">
				<div class="card-header bg-dark text-light"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Shipping cart 
				<a href="" class="btn btn-outline-info btn-sm pull-right">Continiue shopping</a>
					<div class="clearfix"></div>
				</div>

				<c:forEach items="${cartLines}" var="cartLine">
					<div class="card-body">
						<!-- PRODUCT -->
						<div class="row">
							<div class="col-12 col-sm-12 col-md-2 text-center">
								<img class="img-responsive dataTableImg"
									src="${images}/${cartLine.product.code}.jpg"
									alt="${cartline.product.name}" width="120" height="80">
							</div>
							<div
								class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
								<h4 class="product-name">
									<strong>${cartLine.product.name}</strong>
									<c:if test="${cartLine.available == false}">
										<strong class="unavailable">(Not Available!)</strong>
									</c:if>
								</h4>
								<h4>
									<small>Brand - ${cartLine.product.brand}</small>
									<br/> 
									<small>Description - ${cartLine.product.description}</small>
								</h4>
							</div>
							<div
								class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
								<div class="col-3 col-sm-3 col-md-6 text-md-right"
									style="padding-top: 5px">
									
									<h6>
										<strong>&euro; ${cartLine.buyingPrice} <span class="text-muted">x</span></strong>
									</h6>
								</div>
								
								<div class="col-4 col-sm-4 col-md-4">

									<input type="number" id="count_${cartLine.id}" min="1" max="3" class="form-control text-center" value="${cartLine.productCount}">									
									
								</div>									
								<div class="col-2 float-righ">
									<button type="button" name="refreshCart" value="${cartLine.id}" class="btn btn-outline-primary btn-xs"><i class="fa fa-refresh" aria-hidden="true"></i></button>
									<a href="${contextRoot}/cart/${cartLine.id}/delete" class="btn btn-outline-danger btn-xs"><i class="fa fa-trash"></i></a>
									</div>
									
								

							</div>
								

						</div>
						
						<hr>
						<div class="float-right">
									Subtotal: <b>&euro; ${cartLine.total}</b>
								</div>
						<!-- END PRODUCT -->
					</div>
 								

				</c:forEach>


				<div class="card-footer">

					<div class="pull-right" style="margin: 10px">
						<a href="" class="btn btn-success pull-right">Checkout</a>
						<div class="pull-right" style="margin: 5px">
							Total price: <b>&euro; ${userModel.cart.grandTotal}</b>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">
					<h1>Your cart is empty!</h1>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>