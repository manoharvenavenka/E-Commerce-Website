<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../head.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            font-family: 'Poppins', sans-serif;
        }
        #hero {
            width: 100%;
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.3), transparent), url("./images/ecom.webp") no-repeat center center;
            background-size: cover;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
       #hero h1, #hero p, #hero h3 {
            color: white;
            text-shadow: 0px 3px 4px rgba(4, 3, 5, 0.25); /* Adjust the rgba value for a lighter black */
            opacity: 0;
            transform: translateY(23px);
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        #hero h1.show, #hero p.show, #hero h3.show {
            opacity: 1;
            transform: translateY(0);
        }
        .dropdown-menu .dropdown-item {
            color: black;
        }
        .navbar-toggler {
            background-color: white;
        }
        .navbar-toggler-icon {
            color: black;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-dark p-3 fixed-top" id="mainNav">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="../images/ecomlogo.png" style="margin-left: 4rem;border-radius: 50px" alt="E-Commerce Logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link mx-2 active text-white" aria-current="page" href="/EcommersProject/index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link mx-2 text-white" href="/EcommersProject/About.jsp">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link mx-2 dropdown-toggle text-white" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">Logins</a>
                        <ul class="dropdown-menu bg-white" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item text-dark" href="./Admin/AdminLogin.jsp">Admin</a></li>
                            <li><a class="dropdown-item text-dark" href="/EcommersProject/Customer/CustomerLogin.jsp">Customer</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="hero" style="background: url('../images/ecom.webp') no-repeat; background-size: cover; background-position: top center">
       <div class="container mt-5">
       <div class="row mt-5">
       
       <div class="col-sm-3">
       </div>
        <div class='card col-sm-6'>
            <div class='card-body'>
                <form method='post' action='/EcommersProject/LoginValidation' class="needs-validation" novalidate>
                    <h2 class="mb-4">Admin Login</h2>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                        <div class="invalid-feedback">Please enter your username.</div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <div class="invalid-feedback">Please enter your password.</div>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role:</label>
                        <select class="form-select" id="role" name="role">
                            <option value="ADMIN">Admin</option>
                            <option value="MANAGER">Manager</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
        </div>
    </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const heroTextElements = document.querySelectorAll('#hero h1, #hero p, #hero h3');
            setTimeout(() => {
                heroTextElements.forEach(el => {
                    el.classList.add('show');
                });
            }, 500);
        });
    </script>
</body>
</html>
