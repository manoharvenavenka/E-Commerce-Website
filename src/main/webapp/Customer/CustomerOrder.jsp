<%@page import="com.example.model.RatingMod"%>
<%@page import="com.example.model.ProdMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.CustomerOrderMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<script>
$(document).ready(function() {
	$('success_id').slideUp(3000);
	$('#table_id').DataTable();
});


function confirm_delete(orderId) {
    let ans = confirm("Do you Want To Cancel The Order");
       if (ans) {
           window.location = "/EcommersProject/UpdateOrderStatusServlet?n=1&orderId="+orderId+"&orderStatus=Cancel";
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
			CustomerOrderMod corders = new CustomerOrderMod();
			List<CustomerOrderMod> cordersList = corders.getAllCustomerOrders((int) session.getAttribute("customerId"));
			System.out.println("CustomerOrdersList=" + cordersList.size());
			%>




			<div class="col-sm-12">
				<h1 class="text text-center bg-danger text-white">Orders</h1>
				<div class='table-responsive'>

					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-dark'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Order Date</th>
								<th scope="col">Order Id</th>
								<th scope="col">Invoice Number</th>
								<th scope="col">Product Image</th>
								<th scope="col">Product Code</th>
								<th scope="col">Product Name</th>

								<th scope="col">Cost</th>
								<th scope="col">Discount</th>
								<th scope="col">quantity</th>
								<th scope="col">Gst</th>
								<th scope="col">Bill Amount</th>
								<th scope="col">Status</th>
								<th scope="col">Operation</th>
								<th scope="col">Rating</th>

							</tr>
						</thead>
						<tbody class='table table-responsive'>
							<%
							int slno = 0;
							ProdMod product = new ProdMod();

							for (CustomerOrderMod ordersOb : cordersList) {

								System.out.println("ordersOb=" + ordersOb);
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=ordersOb.getOrderDateTime()%></td>
								<td class="text-center"><%=ordersOb.getOrderId()%></td>
								<td class="text-center"><%=ordersOb.getInvoiceNumber()%></td>
								<%
								System.out.println("ProductCode=" + ordersOb.getProductCode());
								product.setProductCode(ordersOb.getProductCode());

								product = product.getProductsbyId();
								%>

								<td class="text-end"><img
									src='../uploads/<%=product.getProductImage1()%>'
									style='width: 100px; height: 100px' /></td>
								<td class="text-end"><%=product.getProductName()%></td>
								<td class="text-end"><%=ordersOb.getProductCode()%></td>


								<td class="text-end"><%=ordersOb.getCost()%></td>
								<td class="text-end"><%=ordersOb.getDiscountAmount()%></td>
								<td class="text-end"><%=ordersOb.getQuantity()%></td>
								<td class="text-end"><%=ordersOb.getGstAmount()%></td>
								<td class="text-end"><%=ordersOb.getBillAmount()%></td>
								<td class=""><%=ordersOb.getOrderStatus()%></td>

								<td>
									<%
									//System.out.println("status= " + cordersOb.getOrderStatus().toString());
									if (ordersOb.getOrderStatus().toString().equalsIgnoreCase("pending")) {
									%> <input type="button" class="btn btn-sm btn-danger"
									onclick="confirm_delete(<%=ordersOb.getOrderId()%>)"
									value="Cancel" /> <%
 } else if (ordersOb.getOrderStatus().toString().equalsIgnoreCase("cancel"))

 {
 %>
									<button type="button" class="btn btn-danger " disabled>Cancelled</button>

									<%
									} else {
									%>
									<button type="button" class="btn btn-success" disabled
										style='font-size: 2rem'>
										<i class="fa-solid fa-truck-fast"></i>
									</button> <%
 }
 %>


								</td>

								<td>
									<%
									RatingMod ratin = new RatingMod();
									Boolean found = ratin.isRatingGiven((int) session.getAttribute("customerId"), ordersOb.getProductCode());
									if (found == false) {
									%> <a
									href='/EcommersProject/Customer/Rating.jsp?productCode=<%=ordersOb.getProductCode()%>'>
										<i class="fa-regular fa-star" style="font-size: 2.5rem"></i>
								</a> <%
 }
 %>


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