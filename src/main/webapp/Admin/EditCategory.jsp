<%@page import="com.example.model.CatMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../head.jsp"></jsp:include>
    <style>
        /* Additional styles for responsiveness */
        .container {
            padding: 0 15px; /* Add padding to the container for better responsiveness */
        }
        input[type="text"] {
            width: 100%; /* Ensure text inputs take up the full width of the container */
            padding: 8px; /* Add padding to text inputs */
            margin-bottom: 15px; /* Add margin to create space between inputs */
            box-sizing: border-box; /* Include padding and border in the element's total width and height */
        }
        #ad {
            width: 100%; /* Ensure the update button takes up the full width of the container */
            padding: 10px; /* Add padding to the button */
            box-sizing: border-box; /* Include padding and border in the button's total width and height */
        }
    </style>
</head>
<body>
    <jsp:include page="../Adminheading.jsp"></jsp:include>
    <jsp:include page="../adminnav.jsp"></jsp:include>
    <div class="container mt-3">
        <form action='/EcommersProject/UpdateCategoryservlet' method='post'>
            <h2>Edit Category</h2>

            <%
            CatMod cat = new CatMod();
            cat.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            
            CatMod catRow = cat.getCategorybyId();
            %>
            <h3>Category Id</h3>
            <input type="text" name="categoryId" value=<%=catRow.getCategoryId() %> readonly>
            <h3>Category Name:</h3>
            <input type="text" name="categoryName"
                placeholder="Enter CategoryName" value=<%=catRow.getCategoryName() %> required>

            <input type="submit" name="submit"  class="btn btn-primary" value="Update" id="ad">
        </form>
    </div>
    <jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>
