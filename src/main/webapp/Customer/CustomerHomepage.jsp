<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.CartModel"%>
<%@page import="com.example.model.WishlistMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.ProdMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<style>
#cardo {
	width: 21rem;
	height: 35rem;
}

#cardo:hover {
	width: 22rem;
	height: 36rem;
	box-shadow: 5px 10px 10px 10px;
}
</style>

</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>
	<jsp:include page="../cur.jsp"></jsp:include>







	<div class="container-fluid  ">
		<div class="row ">


			<label class='text text-center text-danger mt-5'>
				<h2>Latest Deal's</h2>
			</label>
			<%
			ProdMod product = new ProdMod();
			List<ProdMod> productList = new ArrayList<ProdMod>(); //empty product list

			String search = request.getParameter("search");
			if (search == null) { //without search

				productList = product.getAllProducts(null);
				////	productList = product.getAllProducts(null);
				System.out.print(productList);
			} else { //with search
				System.out.println("search: " + search);
				productList = product.getAllProducts(search);

			}
			%>


			<%
			for (ProdMod productObj : productList) {
			%>

			<div class="col-sm-3 ">
				<div class="card mt-5" id='cardo'>
					<div class="card-header ">
						<img src='../uploads/<%=productObj.getProductImage1()%>'
							class="img-thumbnail mx-auto d-block" alt="notfound"
							style="width: 260px; height: 180px">
					</div>
					<div class="card-body ">
						<p class="text-muted mb-0 text-center"><%=productObj.getProductName()%></p>
						<hr>
						<h3>Description:</h3>
						<p class="text-muted mb-0"><%=productObj.getDescription()%></p>
						<h3>Cost:</h3>
						<p class="text-muted mb-0"><%=productObj.getCost()%></p>
						<h3>Discount:</h3>
						<p class=" mb-0 bg-danger text-white text-center "
							style='width: 53px; border-radius: 6px'><%=productObj.getDiscount()%>%
						</p>

					</div>
					<div class="card-footer" size='50rem'>
						<td><a
							href='/EcommersProject/Customer/ViewReviews.jsp?productCode=<%=productObj.getProductCode()%>'>
								<button type="button" class="btn btn-dark  ">
									<i class="fa-regular fa-eye"></i>
								</button>
						</a></td>
						<%
						WishlistMod wish = new WishlistMod();
						Boolean found = wish.isProductIsInWishList((int) session.getAttribute("customerId"), productObj.getProductCode());

						if (found == false) {
						%>

						<a
							href='/EcommersProject/AddToWishListServlet?productCode=<%=productObj.getProductCode()%>'>
							<button type="button" class="btn btn-danger  "
								style='margin-left: 10rem'>
								<i class="fa-regular fa-heart"></i>
							</button>
						</a>

						<%
						} else {
						%>
						<button type="button" class="btn btn-secondary" disabled
							style='margin-left: 10rem'>
							<i class="fa-regular fa-heart"></i>
						</button>

						<%
						}
						%>

						<%
						CartModel cartob = new CartModel();
						Boolean found1 = cartob.isProductIsAddedToCart((int) session.getAttribute("customerId"), productObj.getProductCode());

						if (found1 == false) {
						%>
						<a
							href='/EcommersProject/AddToCartServlet?n=1&productCode=<%=productObj.getProductCode()%>'><button
								type="button" class="btn btn-primary float-end ">
								<i class="fa-solid fa-cart-arrow-down"></i>
							</button></a>


						<%
						} else {
						%>
						<button type="button" class="btn btn-secoundary float-end "
							disabled>
							<i class="fa-solid fa-cart-arrow-down"></i>
						</button>

						<%
						}
						%>

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