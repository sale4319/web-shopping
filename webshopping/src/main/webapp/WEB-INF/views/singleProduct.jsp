<div class="container">

	<!-- Bredcrumb -->
	<div class="row">

		<div class="col-12">

			<ol class=breadcrumb>

				<li class="breadcrumb-item"><a href="${contextRoor}/home">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${contextRoor}/show/all/products">Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>


			</ol>



		</div>

	</div>

	<div class="row">
		<!-- Display the product image -->
		<div class="col-12 col-sm-4">

			<div class="thumbnail">

				<img src="${images}/${product.code}.jpg" class="img img-responsive" />

			</div>

		</div>

		<!-- Display the product description -->
		<div class="col-12 col-sm-8">

			<h3>${product.name}</h3>
			<hr />
			
			<p>${product.description}</p>
			<hr />
			
			<h4>Price: <strong> &euro; ${product.unitPrice}</strong></h4>
			<hr />
			
			<h6>Qty. Available: ${product.quantity}</h6>

			<a href="${contextRoot}/cart/add/${product.id}/product" class="btn btn-success"><span class= "fa fa-shopping-cart"></span> Add to Cart</a>
			<a href="${contextRoot}/show/all/products" class="btn btn-warning"> Back</a>

		</div>

	</div>
	
</div>