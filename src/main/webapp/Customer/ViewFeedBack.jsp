<%@page import="com.example.model.FeedBackMod"%>
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

function confirm_delete(feedbackId) {
    let ans = confirm("Do you Want To Delete The FeedBack");
       if (ans) {
           window.location = "/EcommersProject/DeleteFeedBackServlet?feedbackId="+feedbackId;
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
			FeedBackMod feed = new FeedBackMod();

			List<FeedBackMod> feedList = feed.getAllFeedBack((int) session.getAttribute("customerId"));
			%>




			<div class="col-sm-12">
				<h1 class="text text-center  text-succes">Feed Back</h1>
									<div class='table-responsive'>
				
				<table class="table mt-5 table-bordered table-hover " id='table_id'>
					<thead class='table table-dark'>
						<tr>
							<th scope="col">SLNO</th>
							<th scope="col">FeedBack Id</th>
							<th scope="col">Date</th>
							<th scope="col">Customer Id</th>
							<th scope="col">Customer Enquiry</th>
							<th scope="col">Feed Back</th>
							<th scope="col">Operation</th>



						</tr>
					</thead>
					<tbody class='table  table-striped'>
						<%
						int slno = 0;

						for (FeedBackMod feedOb : feedList) {
						%>
						<tr>
							<td class="text-center"><%=slno++%></td>
							<td class="text-center"><%=feedOb.getFeedbackId()%></td>
							<td class="text-center"><%=feedOb.getDate()%></td>
							<td class="text-center"><%=feedOb.getCustometId()%></td>
							<td class="text-center"><%=feedOb.getCustomerEnquiry()%></td>
							<td class="text-center"><%=feedOb.getFeedback()%></td>
							<td><input type="button" class="btn btn-sm btn-info bg-info"
								onclick="confirm_delete(<%=feedOb.getFeedbackId()%>)"
								value="Delete" /></td>
								
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