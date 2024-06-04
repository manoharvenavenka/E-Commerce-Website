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
<div class="container" style="margin-top: 3rem;" id="m">
        <div class="row">

                <div class="col-sm-12">
                    <center>
            <form action='/EcommersProject/AddCat' method="post">

                        <h1 style="background-color: rgb(104, 96, 146); color: aliceblue;">Add New Category</h1>
                        <h3>Category Name:</h3>
                        <input type="text" name="categoryName" placeholder="Enter Category" required>
                        <input type="submit" name="submit" value="Add" id="ad">
                       <%
                       String res = request.getParameter("res");
                       if(res!=null){
                    	   if(res.equals("0")){
                    		   out.println("<h4 style='color:red'>*Category  Not Added</h4>");
                    		   
                    	   }else{
                    		   out.println("<h4 style='color:green'>*Category  Added</h4>");

                    	   }
                       }
                       %>
            </form>
            </center>
        </div>
    </div>
    <jsp:include page="../foot.jsp"></jsp:include>
    
</body>
</html>