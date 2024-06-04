<%@page import="com.example.model.ProdMod"%>
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
	<form action="/EcommersProject/UpdateProductServlet" method="post" >
		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Product Updated..!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Product not Updated..!
		</div>
		<%
		}
		}
		%>
	<br />
	
	
       	<%
			String productCode = request.getParameter("productCode");
			ProdMod product= new ProdMod();
			product.setProductCode(Integer.parseInt(productCode));
			
			product = product.getProductsbyId();
			
			%>
		
		<div class="container mt-3 card " style='background-color:#ECEBF6' >
			<h1 class="text-danger ">Update Product</h1>
			
			
			<div class="row">
				<div class="col-sm-6">
					<label class="text-dark">Product Code</label> 
					<input type="number" class="form-control" name="productCode" value="<%=product.getProductCode()%>" readonly>
				</div>
				
				<%
				CatMod category = new CatMod();
				List<String> categorylist=category.getAllcategoriesBByNameandi();
				System.out.println(categorylist);
				
				%>
				
				
			
					
				<div class="col-sm-6">
					<label>Category Name</label>
					 <select name="categoryName" class="form-control"  >
						<option value="<%=product.getCategoryName() %>"><%=product.getCategoryName() %></option>  
					
					<%
							for(String categoryName: categorylist){
								String option=
										"<option value='"+categoryName+"'>"+categoryName+"</option>";
								out.println(option);
							}
						%>
					</select>
						
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<label>Product Name</label> 
					<input type="text"
						 class="form-control" name="productName" value="<%=product.getProductName()%>">
				</div>
				<div class="col-sm-6">
				<label>Description</label> 
				<textarea rows="2" cols="50"  name="description" class="form-control"  value="<%=product.getDescription() %>"></textarea>
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>Discount</label> 
					<input type="number"
						 class="form-control" name="discount" value="<%=product.getDiscount() %>">
				</div>
				
				<div class="col-sm-6">
				<label>Cost</label> 
					<input type="number"
						 class="form-control" name="cost" value="<%=product.getCost()%>">
				</div>
				</div>
				
				
				
				<div class="row mt-3">
				<div class="col-sm-6">
			
				<input type="submit" name="submit"  class="form-control btn btn-md btn-info" 
				 style="width:150px" value="Update Product">
				</div>
				</div>
				<br>
		</div>
		</form>
		<jsp:include page="../foot.jsp"></jsp:include>
		
</body>
</html>

