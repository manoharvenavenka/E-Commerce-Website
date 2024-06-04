<%@page import="java.util.List"%>
<%@page import="com.example.model.FeedBackMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedbacks</title>
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
			FeedBackMod  feedb = new FeedBackMod();

			List<FeedBackMod> feedbacklist = feedb.getAllFeedBackinAdmin();
		
			%>
    <div class="container mt-3">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="text-center bg-danger text-white">Feedbacks</h1>
                <div class="table-responsive">
                    <table class="table mt-5 table-bordered table-hover" id="table_id">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">SLNO</th>
                                <th scope="col">Feed BackId </th>
                                <th scope="col">Date</th>
                                <th scope="col">Customer Id</th>
                                <th scope="col">Customer Enquiry</th>
                                <th scope="col">Feedback</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            int slno = 0;
                            for (FeedBackMod feedob : feedbacklist) {
                                slno++;
                            %>
                            <tr>
                                <td class="text-center"><%=slno%></td>
                                <td class="text-center"><%=feedob.getFeedbackId()%></td>
                                <td class="text-center"><%=feedob.getDate()%></td>
                                <td class="text-center"><%=feedob.getCustometId()%></td>
                                <td class="text-center"><%=feedob.getCustomerEnquiry()%></td>
                                <td class="text-end"><%=feedob.getFeedback()%></td>
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
