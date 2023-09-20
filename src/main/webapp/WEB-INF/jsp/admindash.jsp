<%@ page import="com.greenbliss.entities.Customer" %>
<%@ page import="com.greenbliss.entities.Admin" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<%--<%--%>
<%--    Customer customer = (Customer) session.getAttribute("current-user")--%>
<%--%>--%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>GreenBliss - Admin Dashboard</title>
</head>
<body style="margin-bottom:100px;">

<%@ include file="components/adminloggedinnav.jsp" %>
<div class="jumbotron text-center">
    <h1 class="display-4">Welcome back, Admin</h1>
    <p>Easily manage your store from here.</p>
</div>
<div class="container-fluid">
    <div class="row">
	
        <div class="col-sm-3 pt-3" >
            <div class="card" style="background-color:white;">
                <div class="card-body">
                    <h4 class="card-title">Manage Products</h4>
                    <p class="card-text">Manage all the products here</p>
                    <a href="manageproducts" class="card-link btn btn-primary">Manage</a>
                </div>
            </div>
        </div>
		
        <div class="col-sm-3 pt-3" >
            <div class="card" style="background-color:white;">
                <div class="card-body">
                    <h4 class="card-title">Add Products</h4>
                    <p class="card-text">Add new products here.</p>
                    <a href="addproducts" class="card-link btn btn-primary">Add</a>
                </div>
            </div>
        </div>
		
		 <div class="col-sm-3 pt-3" >
            <div class="card" style="background-color:white;">
                <div class="card-body">
                    <h4 class="card-title">Orders</h4>
                    <p class="card-text">Manage all the orders here</p>
                    <a href="adminorders" class="card-link btn btn-primary">Manage</a>
                </div>
            </div>
        </div>
		
		 <div class="col-sm-3 pt-3" >
            <div class="card" style="background-color:white;">
                <div class="card-body">
                    <h4 class="card-title">Feedbacks</h4>
                    <p class="card-text">Manage all the feedbacks here</p>
                    <a href="managefeedbacks" class="card-link btn btn-primary">Manage</a>
                </div>
            </div>
        </div>

    </div>
	
	<div class="row">
	
		 <div class="col-sm-3 pt-3" >
            <div class="card" style="background-color:white;">
                <div class="card-body">
                    <h4 class="card-title">Tickets</h4>
                    <p class="card-text">Manage all the tickets here</p>
                    <a href="managetickets" class="card-link btn btn-primary">Manage</a>
                </div>
            </div>
        </div>
		
		<div class="col-sm-3 pt-3" >
            <div class="card" style="background-color:white;">
                <div class="card-body">
                    <h4 class="card-title">Analyze sales</h4>
                    <p class="card-text">Analyze all the sales here</p>
                    <a href="analysis" class="card-link btn btn-primary">View</a>
                </div>
            </div>
        </div>
	
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>