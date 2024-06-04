<%@page import="com.example.model.ProdMod"%>
<%@page import="com.example.model.RatingMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../head.jsp"></jsp:include>
<style>
            #kok {
            border: 1px solid black;
            background-image: url(../images/bro.jpg);
            background-size: cover;
           
            color: wheat;
        }
        #kok h3{
            color: aliceblue;
        }
    </style>
</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>





            
  <div class="container-fluid" align='center'>
        <div class="row">
<form action="/EcommersProject/AddRatingServlet" method="post" >
<%
			String productCode = request.getParameter("productCode");
System.out.println("productCode="+productCode);
			ProdMod product = new ProdMod();
			product= product.getProductsbyCode(Integer.parseInt(productCode));
		
		
			
			%>
                <div class="col-md-3 " >
                
                    	
            </div>
            <div class="col-md-6 mt-5" id="kok" 
						                 	 >
                <h1 class="text-center mt-5"><i class="fa-solid fa-face-smile"></i>Rating<i class="fa-solid fa-face-smile"></i></h1>
             <img src='../uploads/<%=product.getProductImage1()%>' class='mt-5'
						                 style='width: 15rem;'	 /><br>
             <label for="rating" class="mt-5"> 
                    <h6>Product Name</h6>
                </label>
                <input type="text" name="productName" value='<%=product.getProductName() %>' readonly><br>
             
              <label for="productCode" class="mt-5">
                    <h6>ProductCode</h6>
                </label>
               <span><%=product.getProductCode() %></span>
               <input type='hidden'  name="productCode" value="<%=product.getProductCode() %>">
                <h2 class="mt-3"><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-solid fa-star"></i></h2>
               <pre><h3 class="">1 2 3 4 5</h3></pre>
                <label for="rating" class="mt-3"> 
                    <h6>Rating</h6>
                </label>
                <input type="number" name="rating" min='1' max='5' >
                <br>
                <label for="comment" class="mt-5">Comments</label>
                <textarea name="comments"  cols="60" rows="" class="mt-5 " placeholder="Any Suggestions"></textarea>
                <br>
                <br>
             <button class="btn btn-success mb-5" value="Add Rating">Add Rating</button>
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