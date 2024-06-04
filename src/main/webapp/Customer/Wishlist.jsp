<%@page import="com.example.model.WishlistMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.ProdMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>
	<div class="container-fluid ">
		<div class="row">
	

	<%
	WishlistMod wlist = new WishlistMod();
	List<ProdMod> wishList = wlist.getAllwishlistbycustomerId((int)session.getAttribute("customerId"));
	%>
	<%
	
	for (ProdMod productObj : wishList) {
		
	%>

			<div class="col-sm-3">
				<div class="card">
					<div class="card-header ">
						<img src='../uploads/<%=productObj.getProductImage1()%>'
							
						style="width:260px;height:180px"	class="img-thumbnail mx-auto d-block" alt="notfound">
					</div>
					<div class="card-body ">
						<p class="text-muted mb-0"><%=productObj.getProductName()%></p>
					
						<h3>Description:</h3>
						<p class="text-muted mb-0"><%=productObj.getDescription() %></p>
						<h3>Cost:</h3>
						<p class="text-muted mb-0"><%=productObj.getCost()%></p>
						<h3>Discount</h3>
						<p class="text-muted mb-0"><%=productObj.getDiscount() %></p>
						
					</div>
					<div class="card-footer">
					
				<a href='/EcommersProject/DeleteWishlistSrvlet?productCode=<%=productObj.getProductCode()%>&customerId=<%=(int)session.getAttribute("customerId") %>'>	<button type="button" class="btn btn-info float-left"><i class="fa-solid fa-xmark"></i></button></a>
					
					
					<a href='/EcommersProject/AddToCartServlet?n=2&productCode=<%=productObj.getProductCode()%>'><button type="button" class="btn btn-primary float-end ">Add
							to Cart</button></a>
						
					</div>
				</div>
			</div>
			<%
	}
	%>
		</div>
	</div>



	
<jsp:include page="../foot.jsp"></jsp:include>

</body>
</html>