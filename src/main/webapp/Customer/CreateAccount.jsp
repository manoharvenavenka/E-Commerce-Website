<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../hedding.jsp"></jsp:include>
 <section class="vh-100 bg-image"
  style="background-image: url('');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100 mt-5">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form action="/EcommersProject/AddCustomerServlet" method="post" enctype='multipart/form-data'>
<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Acoount created Enjoy ..!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Account not Created..!
		</div>
		<%
		}
		}
		%>
                <div class="form-outline mb-4">
                    <input type="number" name="customerId"  class="form-control form-control-lg"/>
                    <label class="form-label" >Customer Id</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="text" name="firstName" class="form-control form-control-lg"/>
                    <label class="form-label" >First Name</label>
                  </div>



                <div class="form-outline mb-4">
                  <input type="text" name="lastName" class="form-control form-control-lg" />
                  <label class="form-label" >Last Name</label>
                </div>

                <div class="form-outline mb-4">
                    <input type="text" name="mobileNumber" class="form-control form-control-lg" />
                    <label class="form-label" >Mobile Number</label>
                  </div>

                <div class="form-outline mb-4">
                  <input type="email" name="emailId" class="form-control form-control-lg" />
                  <label class="form-label" >Your Email Id</label>
                </div>

              <div class="form-outline mb-4">
  <input type="password" id="password"  name='password' oninput="checkPasswordStrength(this.value)"
  class="form-control form-control-lg" >
  <label class="form-label" for="password">Password:</label>
  <div id="password-strength"></div>
    </div>
  <div class="form-outline mb-4">
  <input type="password" id="cpassword" oninput="validatePasswords(this.value)" class="form-control form-control-lg" >
  <label class="form-label" for="password">Confirm-Password:</label>
  <div id="cpwdLabel"></div>
  </div>
  <script>
    function checkPasswordStrength(password) {
      // Define your password strength criteria and calculations here
      // This is a simple example, you can modify it based on your requirements

      var strength = 0;

      // Check the length of the password
      if (password.length >= 8) {
        strength += 1;
      }

      // Check if the password contains both uppercase and lowercase characters
      if (/[a-z]/.test(password) && /[A-Z]/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one number
      if (/\d/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one special character
      if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
        strength += 1;
      }

      // Display the password strength
      var strengthText = "";
      switch (strength) {
        case 0:
        case 1:
          strengthText = "Weak";
          break;
        case 2:
          strengthText = "Moderate";
          break;
        case 3:
        case 4:
          strengthText = "Strong";
          break;
      }

      document.getElementById("password-strength").innerHTML = "Password Strength: " + strengthText;
	  if(strengthText=="Weak"){
		document.getElementById("password-strength").style.color = 'red';
    }else if(strengthText=="Moderate"){
		document.getElementById("password-strength").style.color = 'blue';
    }else if(strengthText=="Strong"){
		document.getElementById("password-strength").style.color = 'green';
    }
	}
	
	
	
	function validatePasswords(cpassword){
		var cpwd = document.getElementById("password").value;
		if(cpassword == cpwd){
		document.getElementById("cpwdLabel").innerHTML = "Passwords match";
		document.getElementById("cpwdLabel").style.color = "green";
		}else{
		document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
		document.getElementById("cpwdLabel").style.color = "red";
		}
	
	}
              
</script>
                <div class="form-outline mb-4">
                    <input type="file" name="profilePic" class="form-control form-control-lg" />
                    <label class="form-label" for="form3Example4cg">Profile pic</label>
                  </div>

                <div class="form-outline mb-4">
                  <input type="date" name="registerDate" class="form-control form-control-lg" />
                  <label class="form-label" >Register Date</label>
                </div>

               

                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/EcommersProject/Customer/CustomerLogin.jsp"
                    class="fw-bold text-body"><u>Login here</u></a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<jsp:include page="../foot.jsp"></jsp:include>


</body>
</html>