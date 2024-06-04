<%@page import="com.example.model.EmployeeMod"%>
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
		<table class="table table-striped  table-bordered"
			>

			<thead>

				<tr>
					
					<th>Employee ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Gender</th>
					<th>Mobile </th>
					<th>Email Id</th>
					<th>Designation</th>
					<th>Password</th>
					
					<th>Employee Pic</th>
					
					<th>opp</th>
					<th>opp</th>


				</tr>
			</thead>
			<tbody>
			<%
	EmployeeMod employeelist = new EmployeeMod();
	List<EmployeeMod> employee = employeelist.getAllEmployeeDetails();
	%>
	<%
	
	for (EmployeeMod employeeObj : employee) {
		
	%>
				
				<tr>
					
					<td><%=employeeObj.getEmployeeId()%></td>
					<td><%=employeeObj.getFirstName()%></td>
					<td><%=employeeObj.getLastName()%></td>
					<td><%=employeeObj.getGender()%></td>
					<td><%=employeeObj.getMobile()%></td>
					<td><%=employeeObj.getEmail()%></td>
					<td><%=employeeObj.getDesignation()%></td>
					<td><%=employeeObj.getPassword() %></td>
					
					<td>
					
					<a
						href='/EcommersProject/Admin/EditEmployee.jsp?tableName=employees&setColName=employeePic&whereColName=employeeId&conditionValue=
					<%=employeeObj.getEmployeeId()%>&colName=employeePic'>
					
					<img src='../uploads/<%=employeeObj.getEmployeePic() %>'
							style='width: 100px; height: 100px' /></a></td>
					<!-- EditImage.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=1003&colName=productimage1-->
					
					

		<td><a href='/EcommersProject/Admin/EditDataEmployee.jsp?employeeId=<%=employeeObj.getEmployeeId()%>'>
					<button type="button" class="btn btn-success float-end ">Edit</button></a></td>
					<td><a href='/EcommersProject/DeleteEmployeeServlet?employeeId=<%=employeeObj.getEmployeeId()%>'>
					<button type="button" class="btn btn-danger float-end ">Delete</button></a></td>
					
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