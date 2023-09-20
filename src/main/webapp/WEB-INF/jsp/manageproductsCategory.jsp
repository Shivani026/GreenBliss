<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="java.util.List" %><%--
    Document   : signup
    Created on : Jun 6, 2023, 1:04:39 PM
    Author     : Shiwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Manage products</title>
    <%@include file="components/common_css_js.jsp" %>
    <%
        HttpSession httpSession;
    %>
</head>
<body>
<%@include file="components/adminloggedinnav.jsp"%>
<%
    ProductDao productDao =new ProductDao();
    List<Product> productList = productDao.getAllProducts();


%>

<div class="container" style="margin-bottom:100px;background:#F7F7F7;padding-top:50px;">
    <div class="row">


        <div class="col-lg-3">
            <!-- Toggle button -->
            <button
                    class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span>Show filter</span>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse card d-lg-block mb-5" id="navbarSupportedContent">
                <div class="accordion" id="accordionPanelsStayOpenExample"  style="padding:20px">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">

                            Categories

                        </h2>
                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
                            <div class="accordion-body">
                                <form action="/manageproductsCategory" method="post" id="categoryForm">
                                    <input type="hidden" name="category" class="categoryinput">
                                    <ul class="list-unstyled">
                                        <li><a href="#" class="text-dark" onclick="category('plants')">Plants </a></li>
                                        <li><a href="#" class="text-dark" onclick="category('seeds')">Seeds </a></li>
                                        <li><a href="#" class="text-dark" onclick="category('accessories')">Accessories </a></li>
                                        <li><a href="#" class="text-dark" onclick="category('soils')">Soils </a></li>
                                        <li><a href="#" class="text-dark" onclick="category('comnfer')">Compost & Fertilizers </a></li>
                                        <li><a href="#" class="text-dark" onclick="category('tools')">Tools</a></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-9">
         <div class="card shadow-0 border rounded-3 " style="margin-bottom: 10px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-xl-6">
                                    <h4>Manage Products</h4>
                                </div>
                            </div>
                        </div>
                    </div>
            <%
                for(Product product:productList)
                { if(product.getPcategory().equals(session.getAttribute("prod").toString()))
                {%>

            <div class="card shadow-0 border rounded-3" style="margin-bottom: 10px;">
                <div class="card-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                            <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                <img src="data:image/jpeg;base64,<%=product.getPimg()%>" class="w-100" style="height:180px;width:150px;">
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-6">

                            <h5><%=product.getPname()%></h5>
                            <label class="form-label-lg" style="color: red;"><%=product.getPunits()%> items in stock</label>
                            <p class="mb-5 mb-md-0 " style="width: 350px;font-size: 16px;color: gray;text-align: justify;text-justify: inter-word; ">
                                <%=product.getPdetails()%>
                            </p>

                        </div>
                        <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                            <form action="/updateProductQuantity" method="post" id="prodUpdateForm">
                                <label style="font-weight: bold">Update Price : </label>
                                <div class="d-flex flex-row align-items-center mb-1">
                                    <input name="prodPrice" id="pPrice" class="pPrice form-control" value="<%=product.getPprice()%>" style="text-align: center;width: 150px"/>
                                </div>
                                <label style="font-weight: bold;top: 10px">Update Quantity : </label>
                                <div class="input-group" style="width:150px;">
                                                <span class="input-group-btn">
                                                    <button type="button" class="quantity-left-minus btn btn-danger btn-number" onclick="decrement(this)" data-type="minus" data-field="">
                                                      -
                                                    </button>
                                                </span>
                                    <input type="number" id="quantity" name="pQty" class="form-control input-number pInputQty"  style="text-align: center" value=<%=product.getPunits()%> min="1" max="1000">
                                    <span class="input-group-btn">
                                                    <button type="button" class="quantity-right-plus btn btn-success btn-number" onclick="increment(this)" data-type="plus" data-field="">
                                                        +
                                                    </button>
                                                </span>
                                </div>
                                <div class="d-flex flex-column mt-4">
                                    <input name="pid" type="hidden" value="<%=product.getPid()%>">
                                    <button class="btn btn-warning btn-sm" type="submit"">Update Product</button>
                                </div>
                            </form>
                            <form action="/deleteproductprocess/<%=product.getPid()%>" method="POST" >
                                <div class="d-flex flex-column mt-4">
                                    <button class="btn btn-warning btn-sm" type="submit">Delete product</button>
                                </div>
                            </form>

                        </div>

                    </div>


                </div>
            </div>
            <%  }}
            %>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


function category(c)
    {
        $(".categoryinput").attr('value', c);
        document.getElementById("categoryForm").submit();
    }

function increment(button){
 
        var q = $(button).closest(".card-body").find(".pInputQty").val();
        $(button).closest(".card-body").find(".pInputQty").val(parseInt(q)+1);

        }
        
function decrement(button){  
      
       var q = $(button).closest(".card-body").find(".pInputQty").val();
       if(q>0){
        $(button).closest(".card-body").find(".pInputQty").val(parseInt(q)-1);
      }
      }
</script>

</body>
</html>
