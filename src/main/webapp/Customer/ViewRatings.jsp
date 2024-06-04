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
<script>
$(document).ready(function() {
	$('success_id').slideUp(3000);
	$('#table_id').DataTable();
});


function confirm_delete(ratingId) {
    let ans = confirm("Do you Want To Delete The Rating");
       if (ans) {
           window.location = "/EcommersProject/DeleteRatingServlet?ratingId="+ratingId;
}
 }

</script>

</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>


<div class="container-fluid">
		<div class="row ">

			
			<%
			//for vewing in the tble code 
			RatingMod rating = new RatingMod();

			List<RatingMod> ratinglist = rating.getAllRatings((int) session.getAttribute("customerId"));
		
			%>

			


				<div class="col-sm-12">
					<h1 class="text text-center bg-info text-white">Ratings </h1>
					<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-dark'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Rating Id</th>
								<th scope="col">Product Code</th>
								<th scope="col">Rating</th>
								<th scope="col">Comments</th>
								<th scope="col">Customer Id</th>
								<th scope="col">Operation</th>
								<th scope="col">Operation</th>
								
								
							</tr>
						</thead>
						<tbody class='table  table-warning'>
							<%
							int slno = 0;
							
						
							for (RatingMod rateOb : ratinglist) {

							
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=rateOb.getRatingId()%></td>
								<td class="text-center"><%=rateOb.getProductCode()%></td>
								<td class="text-center"><%=rateOb.getRating()%></td>
								<td class="text-center"><%=rateOb.getComments()%></td>
								<td class="text-center"><%=rateOb.getCustomerId()%></td>
								
								
								
								
								<td>
													
									
							  <input  type="button"  class="btn btn-sm btn-info bg-info"
										onclick="confirm_delete(<%=rateOb.getRatingId()%>)"
									 value="Delete"/>
									 
									
						
									 
								</td>
								
								<td >
												
						
					
								
									<a href='/EcommersProject/Customer/EditRating.jsp?ratingId=<%=rateOb.getRatingId()%>'>
							<i class="fa-solid fa-pen-to-square" style="font-size:2.5rem" ></i></a>
									 
									
						
									 
								</td>
								
							</tr>
<%
							}
								%>
						</tbody>
					</table>
					</div>
				</div>
		</div>
		</div>
		<jsp:include page="../foot.jsp"></jsp:include>
		
</body>
</html>