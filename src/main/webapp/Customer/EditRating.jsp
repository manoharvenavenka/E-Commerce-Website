<%@page import="com.example.model.ProdMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.RatingMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../head.jsp"></jsp:include>
<style>
#kok {
	border: 1px solid black;
	background-image: url(../images/bc3.jpg);
	background-size: cover;
	color: wheat;
}

#kok h3 {
	color: aliceblue;
}
</style>

</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>
<br>
			<%
			String res = request.getParameter("res");
			if (res != null) {
				if (res.equals("1")) {
			%>

			<div class="alert alert-success alert-dismissible" id='success_id'>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<strong>RATING</strong> Not Updated!!!
			</div>
			<%
			} else if (res.equals("0")) {
			%>
			<div class="alert alert-danger alert-dismissible" id='success_id'>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<strong>RATING!</strong> Updated!!!
			</div>
			<%
			}
			}
			%>

			<br> <br>

	<div class="container-fluid" align='center'>
		<div class="row">


   
			<%
			String ratingId = request.getParameter("ratingId");
			
			System.out.println("ratingId="+ratingId);
			//for vewing in the tble code 
			RatingMod rating = new RatingMod();
            
			rating =rating.getRatingbyId(Integer.parseInt(ratingId));
			%>
           <%
		
			ProdMod product = new ProdMod();
			product= product.getProductsbyCode(rating.getProductCode());
		
		
			
			%>
			<form action="/EcommersProject/UpdateRatingServlet" method="post">

				<div class="col-md-3 "></div>
				<div class="col-md-6 mt-5" id="kok">
					<h1 class="text-center mt-5">
						<i class="fa-solid fa-face-smile"></i>Update Rating<i
							class="fa-solid fa-face-smile"></i>
					</h1>
					<label for="ratingId" class="mt-5">
						<h6>RatingId</h6>
					</label> <input type="text" name="ratingId"   value='<%=rating.getRatingId() %>'> <br>
					<img src='../uploads/<%=product.getProductImage1()%>' class='mt-5' /><br>
					<label for="rating" class="mt-5">
						<h6>Product Name</h6>
					</label> <input type="text" name="productName"
						value='<%=product.getProductName()%>'><br> <label
						for="productCode" class="mt-5">
						<h6>ProductCode</h6>
					</label> <span><%=product.getProductCode()%></span> <input type='hidden'
						name="productCode" value="<%=product.getProductCode()%>">
					<h2 class="mt-3">
						<i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i
							class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i
							class="fa-solid fa-star"></i>
					</h2>
					<pre>
						<h3 class="">1 2 3 4 5</h3>
					</pre>
					
					<label for="rating" class="mt-3">
						<h6>Rating</h6>
					</label> <input type="number" name="rating" min='1' max='5'  value='<%=rating.getRating() %>'> <br>
					<label for="comment" class="mt-5">Comments</label>
					<textarea name="comments" cols="60" rows="" class="mt-5 "  
						  ><%=rating.getComments() %></textarea>
					<br> <br>
					
					<button class="btn btn-primary mb-5" value="Update Rating">Update
						Rating</button>
					<br>
				</div>
				<div class="col-md-3"></div>
			</form>

		</div>
	</div>



<jsp:include page="../foot.jsp"></jsp:include>

</body>
</html>