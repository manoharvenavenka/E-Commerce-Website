<%@page import="java.util.List"%>
<%@page import="com.example.model.RatingMod"%>
<%@page import="com.example.model.ProdMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<style>
   #dok {
            border: 1px solid black;

        }
</style>
</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>
	
	
	
	
<body>
    <div class="container mt-5">
        <hr>
        <%
			String productCode = request.getParameter("productCode");
System.out.println("productCode="+productCode);
			ProdMod product = new ProdMod();
			product= product.getProductsbyCode(Integer.parseInt(productCode));
		
		
			
			%>
        <h1 class="text-center">Product Details</h1>

        <hr>
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-3" >
            

                            <img src="../uploads/<%=product.getProductImage1()%>" alt="" style="width:15rem;"><br><br>

                            <img src="../uploads/<%=product.getProductImage2()%>" alt="" style="width:15rem;">
                        </div>
                        <div class="col-sm-4" id="dok">
                            <h4 class="text-muted">Product Code:</h4> 
                            <span><%=productCode %></span>
                           <h4 class="text-muted">Product Name:</h4> 
                           <span><%=product.getProductName() %></span>
                           <h4 class="text-muted">Cost:</h4> 
                           <span><%=product.getCost() %></span>
                           <h4 class="text-muted">Discription:</h4> 
                           <span><%=product.getDescription()%></span>
                           <h4 class="text-muted">Discount:</h4> 
                           <span><%=product.getDiscount() %></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-1">

            </div>

        </div>

    </div>
    <hr>
    <hr>
    <div class="container">
        <h1 class="text-center">Ratings&Review</h1>
        <hr>
        
        <div class="row">
            <div class="col-sm-2">
<%



//for vewing in the tble code 
RatingMod rating = new RatingMod();

List<RatingMod> ratinglist = rating.getRatingsByProductCode(Integer.parseInt(productCode));
%>
            </div>
            <div class="col-sm-4">
            <%
            for(RatingMod rat :ratinglist){
            
            %>
                <h4 class="text-muted">Date:</h4> <span><%=rat.getDate() %></span>
                
                <h4 class="text-muted">Rating:</h4> 
                <span><%=rat.getRating() %></span>
                <h4 class="text-muted">Comments:</h4>
                <span><%=rat.getComments() %></span>
                    
                    <hr>
                    <%
            }
                    %>
            </div>

        </div>
    </div>
    <jsp:include page="../foot.jsp"></jsp:include>
    
</body>
</body>
</html>