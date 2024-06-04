<%@page import="com.example.model.InvoicesMod"%>
<%@page import="com.example.model.ProdMod"%>
<%@page import="com.example.model.CustomerOrderMod"%>
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


function confirm_delete(orderId) {
    let ans = confirm("Do you Want To Dispatch The Order");
       if (ans) {
           window.location = "/EcommersProject/UpdateOrderStatusServlet?orderId="+orderId+"&orderStatus=Dispach";
}
 }3

</script>

</head>
<body>
	<jsp:include page="../Adminheading.jsp"></jsp:include>
	<jsp:include page="../adminnav.jsp"></jsp:include>


<div class="container-fluid">
		<div class="row ">

			
			<%
			//for vewing in the tble code 
			InvoicesMod  invoice = new InvoicesMod();

			List<InvoicesMod> invoiceList = invoice.getAllInvoices();
		
			%>

			


				<div class="col-sm-12">
					<h1 class="text text-center bg-warning text-white">Invoice Status </h1>
					<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-dark'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Invoice Number </th>
								<th scope="col">Order Id</th>
								<th scope="col">Invoice Amount</th>
								<th scope="col">Invoice Date</th>
								<th scope="col">Invoice Type</th>
								<th scope="col">Card Number</th>
								<th scope="col">Card Type</th>
								
								<th scope="col">Payment Status</th>
							</tr>
						</thead>
						<tbody class='table  table-info'>
							<%
							int slno = 0;
					
							for (InvoicesMod invoiceOb : invoiceList) {

							
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=invoiceOb.getInvoiceNumber()%></td>
								<td class="text-center"><%=invoiceOb.getOrderId()%></td>
								<td class="text-center"><%=invoiceOb.getInvoiceAmount()%></td>
								<td class="text-center"><%=invoiceOb.getInvoiceDate()%></td>
								
								
								<td class="text-end"><%=invoiceOb.getInvoiceType()%></td>
								<td class="text-end"><%=invoiceOb.getCardNumber()%></td>
								
								
								<td class="text-end"><%=invoiceOb.getCardType()%></td>
								<td class="text-end"><%=invoiceOb.getPaymentStatus()%></td>
								
		
									 
								
								
								
								
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