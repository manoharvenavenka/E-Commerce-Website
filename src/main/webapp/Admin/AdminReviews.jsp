<%@page import="java.util.List"%>
<%@page import="com.example.model.RatingMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ratings</title>
    <jsp:include page="../head.jsp"></jsp:include>
    <script>
        $(document).ready(function() {
            $('success_id').slideUp(3000);
            $('#table_id').DataTable();
        });

        function confirm_delete(orderId) {
            let ans = confirm("Do you Want To Dispatch The Order");
            if (ans) {
                window.location = "/EcommersProject/UpdateOrderStatusServlet?orderId="+orderId+"&orderStatus=Dispatch";
            }
        }
    </script>
    <style>
        /* Additional styles for responsiveness */
        .table-responsive {
            overflow-x: auto; /* Enable horizontal scrolling on small devices */
        }
        .table thead th {
            white-space: nowrap; /* Prevent table header text from wrapping */
        }
        .table tbody td {
            white-space: nowrap; /* Prevent table body text from wrapping */
        }
    </style>
</head>
<body>
    <jsp:include page="../Adminheading.jsp"></jsp:include>
    <jsp:include page="../adminnav.jsp"></jsp:include>
<%
			//for vewing in the tble code 
			RatingMod  rati = new RatingMod();

			List<RatingMod> ratinglist = rati.getRatings();
		
			%>
    <div class="container mt-3">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="text-center bg-info text-white">Ratings</h1>
                <div class="table-responsive">
                    <table class="table mt-5 table-bordered table-hover" id="table_id">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">SLNO</th>
                                <th scope="col">Rating Id</th>
                                <th scope="col">Product Code</th>
                                <th scope="col">Rating</th>
                                <th scope="col">Comments</th>
                                <th scope="col">Customer Id</th>
                                <th scope="col">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            int slno = 0;
                            for (RatingMod ratingob : ratinglist) {
                                slno++;
                            %>
                            <tr>
                                <td class="text-center"><%=slno%></td>
                                <td class="text-center"><%=ratingob.getRatingId()%></td>
                                <td class="text-center"><%=ratingob.getProductCode()%></td>
                                <td class="text-center"><%=ratingob.getRating()%></td>
                                <td class="text-center"><%=ratingob.getComments()%></td>
                                <td class="text-center"><%=ratingob.getCustomerId()%></td>
                                <td class="text-center"><%=ratingob.getDate()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>
