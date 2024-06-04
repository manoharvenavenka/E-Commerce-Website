<%@page import="java.util.List"%>
<%@page import="com.example.model.CatMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
	<style>
			#po i{
				font-size: 1.5rem;
			}
			#po h1{
                 background-color: black;
				 color: white;
			}
			#po:hover{
				background-image:url("../images/jerry.jpg");
				font-col;
			}
			#po i:hover{
				color: aliceblue;
			}
			#po h1:hover
	{
background-color: white;
color: black;
	}
			</style>
			<script>
		$(document).ready(function() {
			$('success_id').slideDown(3000);
		
		</script>
</head>
<body>
	<jsp:include page="../Adminheading.jsp"></jsp:include>
	<jsp:include page="../adminnav.jsp"></jsp:include>
    <br />
	<form action="/EcommersProject/AddProductServlet" method="post" enctype="multipart/form-data">
		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Product Addedd..!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Product not Addedd..!
		</div>
		<%
		}
		}
		%>
		<div class="container mt-3   p-3 bg-light" id="po">
		
		<br>
			<h1 class="text-center"><i class="fa-solid fa-cart-plus"></i> Add Product</h1>
			<br>
			<div class="row ">
				<div class="col-sm-1">
					
				</div>
				<div class="col-sm-3">
					<label><i class="fa-solid fa-code"></i> Product Code</label> 
					<input type="number" class="form-control" name="productCode">
				</div>
				<div class="col-sm-4">
					
				</div>
				<%
				CatMod category = new CatMod();
				List<String> categorylist=category.getAllcategoriesBByNameandi();
				System.out.println(categorylist);
				
				%>
				<div class="col-sm-3">
					<label><i class="fa-solid fa-signature"></i> Category Name</label>
					 <select name="categoryName" class="form-control">
					<%
							for(String categoryName: categorylist){
								String option="<option value='"+categoryName+"'>"+categoryName+"</option>";
								out.println(option);
							}
						%>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-1">
					
				</div>
				<div class="col-sm-3">
					<label><i class="fa-brands fa-product-hunt"></i> Product Name</label> 
					<input type="text"
						 class="form-control" name="productName">
				</div>
				<div class="col-sm-4">
					
				</div>
				<div class="col-sm-3">
				<label><i class="fa-solid fa-audio-description"></i> Description</label> 
				<textarea rows="2" cols="50"  class="form-control" name='description'></textarea>
				</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1">
					
					</div>
				<div class="col-sm-3">
				<label><i class="fa-solid fa-percent"></i> Discount</label> 
					<input type="number"
						 class="form-control" name="discount">
				</div>
				<div class="col-sm-4">
					
				</div>
				<div class="col-sm-3">
					<label><i class="fa-solid fa-hand-holding-dollar"></i> Cost</label> 
					<input type="number"
						 class="form-control" name="cost">
				</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1">
					
					</div>
				<div class="col-sm-3">
				<label><i class="fa-regular fa-file-image"></i> ProductImage1</label> 
					<input type="file"
						 class="form-control" name="productImage1">
				</div>
				<div class="col-sm-4">
					
				</div>
				<div class="col-sm-3">
				<label><i class="fa-regular fa-file-image"></i> ProductImage2</label> 
					<input type="file"
						 class="form-control" name="productImage2">
				</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-1">
					
					</div>
				<div class="col-sm-3">
				<label><i class="fa-regular fa-file-image"></i> ProductImage3</label> 
					<input type="file"
						 class="form-control" name="productImage3">
				</div>
				</div>
				
				<div class="row mt-3">
				<div class="col-sm-12">
					<center>

						<input type="submit" name="submit"  class="form-control btn btn-md btn-outline-info p-3 "  style="width:150px" value="Add Product"> 
					</center>
			
				</div>
				</div>
				<br>
				

		</div>
		<jsp:include page="../foot.jsp"></jsp:include>
		
</body>
</html>