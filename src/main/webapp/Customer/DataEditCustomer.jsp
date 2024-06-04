<%@page import="com.example.model.CustomerMod"%>
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
 
 <main class="vh-100 bg-image"
  style="background-image: url('');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100 mt-5">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Edit Details..!!!!!</h2>

<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Updated  ..!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Account not Updated..!
		</div>
		<%
		}
		}
		%>
		
			
		
		
  <form action='/EcommersProject/ProfileCustomerServlet'  method='post'>
		
		<%
			CustomerMod customer = new CustomerMod();
		customer.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
			
			CustomerMod customerRow = customer.getProfileByCustomerId();
			
			%>
                <div class="form-outline mb-4">
                    <label class="form-label" >Customer Id</label>
                    <input type="number" name="customerId"  class="form-control form-control-lg"  value='<%=customerRow.getCustomerId() %>' >
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" >First Name</label>
                    <input type="text" name="firstName" class="form-control form-control-lg"  value=<%=customerRow.getFirstName() %>  >
                  </div>



                <div class="form-outline mb-4">
                  <label class="form-label" >Last Name</label>
                  <input type="text" name="lastName" class="form-control form-control-lg" value=<%=customerRow.getLastName() %> >
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" >Mobile Number</label>
                    <input type="text" name="mobileNumber" class="form-control form-control-lg" value=<%=customerRow.getMobileNumber() %> >
                  </div>

                <div class="form-outline mb-4">
                  <label class="form-label" > Email Id</label>
                  <input type="email" name="emailId" class="form-control form-control-lg" value=<%=customerRow.getEmailId() %>/>
                </div>

                <div class="form-outline mb-4">
                  <label class="form-label" >Password</label>
                  <input type="password" name="password" class="form-control form-control-lg" value=<%=customerRow.getPassword() %>/>
                </div>

               

                <div class="form-outline mb-4">
                  <label class="form-label" >Register Date</label>
                  <input type="date" name="registerDate" class="form-control form-control-lg" value='<%=customerRow.getRegisterdate() %>' >
                </div>

               

                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Update</button>
                </div>

                


            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
              </form>
</main>
<br>
<br>
<br>
<br>

<div style="margin-top: 11rem">
<jsp:include page="../foot.jsp"></jsp:include>
</div >

</body>
</html>