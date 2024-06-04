<%@page import="java.util.List"%>
<%@page import="com.example.model.CustomerMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<style>
        .gradient-custom {
/* fallback for old browsers */
background: #f6d365;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
}
    </style>
</head>
<body>
<jsp:include page="../custheader.jsp"></jsp:include>
 <jsp:include page="../custnavbar.jsp"></jsp:include>


  <div class="container-fluid mt-9"  >
 <section class="vh-100" style="background-color: #f4f5f7;">
    <div class="container-fluid mt-3 " style='background-image: url("../images/bc3.jpg");'>
      <div class="row d-flex justify-content-center align-items-center h-100">
        <%
        CustomerMod customer = new CustomerMod();
        
        List<CustomerMod> customerList = customer.getAllCustomerDetails((int)session.getAttribute("customerId"));
        %>
        <%
        for (CustomerMod customerObj : customerList) {
          
        %>
        <div class="col col-lg-6 mb-4 mb-lg-0">
          <div class="card mb-3" style="border-radius: .5rem;">
            <div class="row g-0">
              <div class="col-md-4 gradient-custom text-center text-white"
                style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                <div style="margin-top:8rem">
                <h6>Profile Pic</h6>
                  <hr class="mt-0 mb-4">
                <img src='../uploads/<%=customerObj.getProfilePic() %>'alt="avatar"
                class="rounded-circle img-fluid " 
                  alt="Avatar" class="img-fluid my-5"  />
                  <br>
                <h5><%=customerObj.getFirstName() %> 	<%=customerObj.getLastName()%></h5>
                </div>
               <br>
               <br>
               
                <a	href='/EcommersProject/Customer/EditProfilePic.jsp?tableName=customers&setColName=profilePic&whereColName=customerId&conditionValue=
            <%=customerObj.getCustomerId() %>&colName=profilePic'>
                <button type="submit" class="btn btn-dark" >
                  
            <i class="fa-solid fa-pen-to-square"></i>
           </button></a>
              </div>
              <div class="col-md-8">
                <div class="card-body p-4">
                  <h6>Information</h6>
                  <hr class="mt-0 mb-4">
                  <div class="row pt-1">
                    <div class="col-6 mb-3">
                      <h6>CustomerId:</h6>
                      <p class="text-muted"><%=customerObj.getCustomerId()%></p>
                    </div>
                    <div class="col-6 mb-3">
                      <h6>First Name</h6>
                      <p class="text-muted"><%=customerObj.getFirstName()%></p>
                    </div>
                  </div>
                  <div class="row pt-1">
                    <div class="col-6 mb-3">
                      <h6>Last Name</h6>
                      <p class="text-muted"><%=customerObj.getLastName()%></p>
                    </div>
                    <div class="col-6 mb-3">
                      <h6>Email</h6>
                      <p class="text-muted"><%=customerObj.getEmailId() %></p>
                    </div>
                  </div>
                  <div class="row pt-1">
                    <div class="col-6 mb-3">
                      <h6>Mobile</h6>
                      <p class="text-muted"><%=customerObj.getMobileNumber() %></p>
                    </div>
                    <div class="col-6 mb-3">
                      <h6>Password</h6>
                      <p class="text-muted"><%=customerObj.getPassword()%></p>
                    </div>
                  </div>
                  <div class="row pt-1">
                    <div class="col-6 mb-3">
                      <h6>Register Date</h6>
                      <p class="text-muted"><%=customerObj.getRegisterdate()%></p>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center mb-2">
             
                     <a href='/EcommersProject/Customer/DataEditCustomer.jsp?customerId=<%=customerObj.getCustomerId() %> '> <button type="submit" class="btn btn-success">Edit</button></a>
                  </div>
                </div>
              
              </div>
            </div>
          </div>
        </div>
        <%
      }
      %>
      </div>
    </div>
  </section>
  <div class='container-fluid'>
  <div class='row '>
  <div class='col-sm-12'>
  <jsp:include page="../foot.jsp"></jsp:include>
  </div>
  </div>
  </div>
  
</body>
</html>