<%@page import="java.util.List"%>
<%@page import="com.example.model.CustomerMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../Adminheading.jsp"></jsp:include>
 <jsp:include page="../adminnav.jsp"></jsp:include>
 	<div class="container-fluid ">
 
	
	<h2 class='text text-center'>Customer Details</h2>
		<br> <br>
		<div class='table-responsive'>
		<table class="table table-striped table-responsive-sm table-bordered"
			>

			<thead>

				<tr>
					
					<th>Customer Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Mobile Number</th>
					<th>Email Id</th>
					
					<th>Register date</th>
					
					<th>opp</th>


				</tr>
			</thead>
			<tbody>
			<%
	CustomerMod customerlist = new CustomerMod();
	List<CustomerMod> customer = customerlist.getAllCustomersforAdmin();
	%>
	<%
	
	for (CustomerMod customerObj : customer) {
		
	%>
				
				<tr>
					
					<td><%=customerObj.getCustomerId()%></td>
					<td><%=customerObj.getFirstName()%></td>
					<td><%=customerObj.getLastName()%></td>
					<td><%=customerObj.getMobileNumber()%></td>
					<td><%=customerObj.getEmailId()%></td>
					
					<td><%=customerObj.getRegisterdate() %></td>
					<!-- EditImage.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=1003&colName=productimage1-->
					

		
					<td><a href='/EcommersProject/DeleteCustomerServlet?customerId=<%=customerObj.getCustomerId()%>'><button type="button" class="btn btn-danger float-end ">Delete
							</button></a>
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