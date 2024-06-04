<%@page import="com.example.model.CatMod"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"></jsp:include>
<script>
    $(document).ready(function() {
        $('success_id').slideUp(3000);
        $('#table_id').DataTable();
    });
    
    function confirm_delete(categoryId) {
        let ans = confirm("Do you want to delete this record?");
        if (ans) {
            window.location = "/EcommersProject/DeleteCategory?categoryId=" + categoryId;
        }
    }
</script>
<body>
    <jsp:include page="../Adminheading.jsp"></jsp:include>
    <jsp:include page="../adminnav.jsp"></jsp:include>
    <%
    CatMod category = new CatMod();
    List<CatMod> categoryList = category.getAllcategories();
    %>
    <div class="container mt-3">
        <br>
        <%
        String res = request.getParameter("res");
        if (res != null) {
            if (res.equals("1")) {
        %>
        <div class="alert alert-success alert-dismissible" id='success_id'>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Success!</strong> Category Updated..!!!!!
        </div>
        <%
        } else if (res.equals("0")) {
        %>
        <div class="alert alert-danger alert-dismissible" id='success_id'>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Success!</strong> *Category not Updated..!
        </div>
        <%
        }
        }
        %>

        <br> <br>
        <h2>Categories Details</h2>
        <br> <br>
        <div class="table-responsive">
            <table class="table table-striped" id="table_id">
                <thead>
                    <tr>
                        <th>SINO</th>
                        <th>Category Id</th>
                        <th>Category Name</th>
                        <th>Operations</th>
                        <th>opps</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int slno = 0;
                    for (CatMod categoryObj : categoryList) {
                        slno++;
                    %>
                    <tr>
                        <td><%=slno%></td>
                        <td><%=categoryObj.getCategoryId()%></td>
                        <td><%=categoryObj.getCategoryName()%></td>
                        <td>
                            <a href='/EcommersProject/DeleteCategory?categoryId=<%=categoryObj.getCategoryId()%>'>
                                <input type='submit' value='Delete' class='bg-danger text-white' />
                            </a> 
                            <a href='/EcommersProject/Admin/EditCategory.jsp?categoryId=<%=categoryObj.getCategoryId()%>'>
                                <input type='submit' value='Edit' class='bg-info text-white' />
                            </a>
                        </td>
                        <td>
                            <button class="btn btn-sm btn-danger" onclick="confirm_delete(<%=categoryObj.getCategoryId()%>)">Delete</button>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>
