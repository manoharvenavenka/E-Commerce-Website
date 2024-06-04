   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>

      
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-75">
            <form action="/EcommersProject/CustomerValidationServlet" method="post">
<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("true")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Login Success ..!
		</div>
		<%
		} else if (res.equals("false")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Invalid username or password..!
		</div>
		<%
		}
		}
		%>
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
              <div class="card bg-dark text-white" style="border-radius: 1rem;">
                <div class="card-body p-5 text-center">
                    
                    <div class="mb-md-5 mt-md-4 pb-5">
                        
                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                    <p class="text-white-50 mb-5">Please enter your login and password!</p>
      
                    <div class="form-outline form-white mb-4">
                        <input type="email" name="emailId" class="form-control form-control-lg" required/>
                        <label class="form-label" >Email</label>
                    </div>
                    
                    <div class="form-outline form-white mb-4">
                        <input type="password" name="password" class="form-control form-control-lg" required/>
                        <label class="form-label" >Password</label>
                    </div>
      
                    <button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button><br>
                      <button  class="btn btn-outline-light btn-lg px-5 mt-2"  onclick="history.back()">Go Back</button>
                </div>
      
                  <div>
                    <p class="mb-0">Don't have an account? <a href="/EcommersProject/Customer/CreateAccount.jsp" class="text-white-50 fw-bold">Sign Up</a>
                    </p>
                  </div>
      
                </div>
            </div>
        </div>
    </div>
</form>
</div>
</section>
<jsp:include page="../foot.jsp"></jsp:include>


</body>
</html>