<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../head.jsp"></jsp:include>

</head>
 <style>
        #kok {
            border: 1px solid black;
            background-image: url(../images/namaste.jpg);
            background-size: cover;
	color: wheat;
        }
        
    </style>
</head>

<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>
    <div class="container-fluid" align="center">
        <div class="row">
            
<form action="/EcommersProject/AddFeedBackServlet" method="post" >
                <div class="col-md-3 ">
                    <%
                    
                    %>
            </div>
            <div class="col-md-6 mt-5" id="kok">
                <h1 class="text-center mt-5"><i class="fa-regular fa-comments"></i>FeedBack<i class="fa-regular fa-comments"></i></h1>
                   
                <label for="customerEnquiry" class="mt-5">
                    <h3>Customer Enquiry :</h3>
                </label><select name="customerEnquiry" id="">
                    <option value="">--Select Role--</option>
                    <option name="aboutwebsite" id="">About WebSite</option>
                    <option name="productfeedback" id="">Product FeedBack</option>
                    <option name="productexper" id="">Product Experience</option>
                </select><br>
               
                <br>
                <label for="feedback" class="mt-5">FeedBack<i class="fa-regular fa-comments"></i></label>
                <textarea name="feedback"  cols="45" rows="" class="mt-5 " placeholder="FeedBack"></textarea>
                <br>
                <br>
             <button class="btn btn-success mb-5" value="Add Rating">Submit FeedBack</button>
                <br>
            </div>
            <div class="col-md-3">

            </div>
        </form>
  
        </div>
    </div>

<jsp:include page="../foot.jsp"></jsp:include>

</body>

</html>