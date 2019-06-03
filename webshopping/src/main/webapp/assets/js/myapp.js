$(function() {
	// solving active menu highlighting
	switch (menu) {

	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'Contact Us':
		$('#contact').addClass('active');
		break;

	case 'All Products':
		$('#listProducts').addClass('active');
		break;
		
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	default:
		if (menu == "Home")
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}
	// to tackle csrf token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if(token.length > 0 && header.length >0){
		
		//set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options){
			
			xhr.setRequestHeader(header,token);
			
		});
	}

	// code for jQuery dataTable

	var $table = $('#productListTable');

	// execute the below code only where we have this table
	if ($table.length) {
		// console.log('Inside the table!');
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';

		} else {
			jsonUrl = window.contextRoot + '/json/data/category/' + window.categoryId + '/products';
		}

		$table.DataTable({

			lengthMenu : [ [ 3, 5, 10 ],
					[ '3 records', '5 records', '10 records', 'ALL' ] ],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
					{
						data : 'code',
						mRender: function(data,type,row){
							return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class = "dataTableImg"/>'
						}
					},
					{
						data : 'name',
					},
					{
						data : 'brand',
					},
					{
						data : 'unitPrice',
						mRender : function(data, type, row) {
							return '&euro; ' + data
						}
					},
					{
						data : 'quantity',
						mRender(data,type,row){
							
							if(data < 1){
								return'<span style="color:red">Out of Stock!</span>';	
							}
							return data;
						}
					},
					{
						data: 'id',
						bSortable: false,
						mRender: function(data, type, row) {
							var str = '';
							str += '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-primary"><span class="fa fa-eye"></span></a> &#160;';
							
							if(row.quantity < 1){
								
								str += '<button type="button" class="btn btn-success" disabled><a href="javascript:void(0)"><span class="fa fa-shopping-cart"></span></a></button>';
								
							}
							else{
								str += '<a href="' + window.contextRoot + '/cart/add/' + data + '/product" class="btn btn-success"><span class = "fa fa-shopping-cart"></span></a>';
								
							}
							return str;
							
						}
					}

			]
		});
	}

	//dismissing the alert after 3 seconds
	var $alert = $('.alert');
	
	if($alert.length){
		
		setTimeout(function(){
			$alert.fadeOut('slow');
		}, 3000)
	}
	

	/*-----------------------*
	*    Admin Data Table    *
	*         Code           *
	*------------------------*/
	
	var $adminProductsTable = $('#adminProductsTable');

	// execute the below code only where we have this table
	if ($adminProductsTable.length) {
		// console.log('Inside the table!');
		var jsonUrl = window.contextRoot+'/json/data/admin/all/products';

		$adminProductsTable.DataTable({

			lengthMenu : [ [ 10, 30, 50, -1],
					[ '10 records', '30 records', '50 records', 'ALL' ] ],
			pageLength : 30,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
					{
						data : 'id',					
					},
					{
						data : 'code',
						mRender: function(data,type,row){
							return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="adminDataTableImg"/>'
						}
					},
					{
						data : 'name',
					},
					{
						data : 'brand',
					},
					
					{
						data : 'quantity',
						mRender(data,type,row){
							
							if(data < 1){
								return'<span style="color:red">Out of Stock!</span>';	
							}
							return data;
						}
					},
					{
						data : 'unitPrice',
						mRender : function(data, type, row) {
							return '&euro; ' + data
						}
					},
					{
						data: 'active',
						bSortTable: false,
						mRender: function(data,type,row){
							var str='';
							
								str+='<label class="switch">';
								if(data){
									str+='<input type="checkbox" checked="checked" value="'+row.id+'"/>';
								}
								else{
									str+='<input type="checkbox" value="'+row.id+'"/>';
								}
								str+='<div class="slider"></div></label>';
								return str;
					
						}
						
					},
					{
						data: 'id',
						bSortTable: false,
						mRender: function(data,type,row){
							var str='';
							str+= '<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-warning">';
							str+= '<span class="fa fa-pencil"></span></a>';
							return str;
						}
					}

			],
			//Toggle switch alert
			initComplete: function(){
				var api= this.api();
				api.$('.switch input[type="checkbox"]').on('change', function(){
					var checkbox = $(this);
					var checked = checkbox.prop('checked');
					var dMsg = (checked)? 'You want to activate the product?':
										  'You want to deactivate the product?';
					var value = checkbox.prop('value');
					
					bootbox.confirm({
						size: 'medium',
						title: 'Product Activation & Deactivation',
						message: dMsg,
						callback: function(confirmed){
							if(confirmed){
								console.log(value);
								
								var activationUrl= window.contextRoot+'/manage/product/'+value+'/activation';
								$.post(activationUrl,function(data){
									
									bootbox.alert({
										size: 'medium',
										title: 'Information',
										message: data										
									});	
								});						
							}
							else{
								checkbox.prop('checked', !checked);
							}
							
						}
					});				
				});
				
			}
		});
	}
	
	//----------------------------
	//  Validation code for category
	
	var $categoryForm = $('#categoryForm');
	if($categoryForm.length){
		$categoryForm.validate({
			
			rules : {
				name : {
					
					required : true,
					minlength : 2
				},
				
				description : {
					required: true
					}
				},
				
				messages : {
					name : {
						required: 'Please add the category name!',
						minlength: 'The category name should not be less than 2 characters long.'
					},
					description : {
						required: 'Please add a description for this category!',
						
					}
				},
			errorElement: 'em',
			errorPlacement: function(error, element){
				// add the class of help block
				error.addClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);
			}
			
		});
		
	}
	
	//--------------------------
//  Validation code for login
	
	var $loginForm = $('#loginForm');
	if($loginForm.length){
		$loginForm.validate({
			
			rules : {
				username : {
					
					required : true,
					email : true
				},
				
				password : {
					required: true
					}
				},
				
				messages : {
					username : {
						required: 'Please enter the username!',
						email: 'Please enter valid email address.'
					},
					password : {
						required: 'Please enter the password!',
						
					}
				},
			errorElement: 'em',
			errorPlacement: function(error, element){
				// add the class of help block
				error.addClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);
			}
			
		});
		
	}

});