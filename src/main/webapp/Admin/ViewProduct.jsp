<%@page import="com.example.model.ProdMod"%>
<%@page import="com.example.model.CatMod"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../head.jsp"></jsp:include>
<script>
		
		
		   function confirm_delete(categoryId) {
               let ans = confirm("Do you want to delete this record?");
                  if (ans) {
                      window.location = "/EcommersProject/DeleteProductServlet?productCode=" + productCode;
   }
 }

</script>

<body>
	<jsp:include page="../Adminheading.jsp"></jsp:include>
	<jsp:include page="../adminnav.jsp"></jsp:include>

	<div class="container-fluid ">
		<br>
		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Product added..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Product not added..!
		</div>
		<%
		}
		}
		%>

		<br> <br>
		<h2 class='text text-center'>Product Details</h2>
		<br> <br>
		<div class='table-responsive'>
			<table class="table table-striped  table-bordered" id='table_id'>

				<thead>

					<tr>
						<th>SINO</th>
						<th>ProductCode</th>
						<th>Category Name</th>
						<th>productName</th>
						<th>Description</th>
						<th>Discount</th>
						<th>Cost</th>
						<th>ProductImage1</th>
						<th>ProductImage2</th>
						<th>ProductImage3</th>
						<th>opperation</th>
						<th>opp</th>


					</tr>
				</thead>
				<tbody>
					<%
					ProdMod product = new ProdMod();
					List<ProdMod> productList = product.getAllProducts(null);
					%>
					<%
					int slno = 0;
					for (ProdMod productObj : productList) {
						slno++;
					%>
					<tr>
						<td><%=slno%></td>
						<td><%=productObj.getProductCode()%></td>
						<td><%=productObj.getCategoryName()%></td>
						<td><%=productObj.getProductName()%></td>
						<td><%=productObj.getDescription()%></td>
						<td><%=productObj.getDiscount()%></td>
						<td><%=productObj.getCost()%></td>
						<!-- EditImage.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=1003&colName=productimage1-->
						<td><a
							href='/EcommersProject/Admin/EditImage.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=
					<%=productObj.getProductCode()%>&colName=productimage1'>
								<img src='../uploads/<%=productObj.getProductImage1()%>'
								style='width: 100px; height: 100px' />
						</a></td>
						<td><a
							href='/EcommersProject/Admin/EditImage.jsp?tableName=products&setColName=productImage2&whereColName=productCode&conditionValue=
					<%=productObj.getProductCode()%>&colName=productimage2'>
								<img src='../uploads/<%=productObj.getProductImage2()%>'
								style='width: 100px; height: 100px' />
						</a></td>
						<td><a
							href='/EcommersProject/Admin/EditImage.jsp?tableName=products&setColName=productImage3&whereColName=productCode&conditionValue=
					<%=productObj.getProductCode()%>&colName=productimage3'>
								<img src='../uploads/<%=productObj.getProductImage3()%>'
								style='width: 100px; height: 100px' />
						</a></td>

						<td><a
							href='/EcommersProject/DeleteProductServlet?productCode=<%=productObj.getProductCode()%>'><input
								type='submit' value='Delete' class='bg-danger text-white' /></a> <a
							href='/EcommersProject/Admin/EditProduct.jsp?productCode=<%=productObj.getProductCode()%> '><input
								type='submit' value='Edit' class='bg-info text-white' /></a></td>
						<td><button class="btn btn-sm btn-danger"
								onclick="confirm_delete(<%=productObj.getProductCode()%>)">Delete</button></td>
					</tr>
					<%
					}
					%>


				</tbody>
			</table>
		</div>
	</div>


	<jsp:include page="../foot.jsp"></jsp:include>


</body>
</html>