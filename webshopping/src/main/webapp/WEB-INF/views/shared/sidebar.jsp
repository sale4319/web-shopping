<p class="lead"><img src="https://i.imgur.com/ybFbLF8.png" width="205" height="60" class="d-inline-block align-top" alt=""></p>


<div class="list-group">

	<c:forEach items="${categories}" var="category">
	<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a> 
	</c:forEach>
	
	
</div>