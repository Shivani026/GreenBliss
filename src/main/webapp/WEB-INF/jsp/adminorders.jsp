<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.greenbliss.dao.OrderDao" %>
<%@ page import="com.greenbliss.entities.Orders" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONObject" %><%--
    Document   : signup
    Created on : Jun 6, 2023, 1:04:39 PM
    Author     : Shiwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Login</title>
    <%@include file="components/common_css_js.jsp" %>
    <%
        HttpSession httpSession;
    %>
</head>
<body>
<%@include file="components/adminloggedinnav.jsp"%>
<%
    OrderDao orderDao =new OrderDao();
    List<Orders> ordersList = OrderDao.getAllOrders();


%>
<section class="vh-100 bg-light"  >

    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-left align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;height:auto;width:1100px;padding: 20px;">

                    <div class="card shadow-0 border rounded-3 " style="margin-bottom: 10px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-xl-6">
                                    <h4>Manage Orders</h4>
                                </div>
                            </div>
                        </div>
                    </div>


                <div>
                    <%
                        for(Orders order:ordersList)
                        { %>

                <div class="card shadow-0 border rounded-3" style="margin-bottom: 10px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                    <h5>Order Id : <%=order.getOid()%></h5>
                                    <%
                                        String products = order.getOprods();
                                        JSONArray jsonArray = new JSONArray(products);

                                        List<Product> productList = new ArrayList<>();

                                        // Iterate over the JSON array and extract the product details
                                        for (int i = 0; i < jsonArray.length(); i++) {
                                            JSONObject productObj = jsonArray.getJSONObject(i);
                                            int productId = productObj.getInt("productId");
                                            String productName = productObj.getString("productName");
                                            int productPrice = productObj.getInt("productPrice");
                                            String productImg = productObj.getString("productImg");
                                            int productUnits = productObj.getInt("productUnits");

                                            // Create a Product object
                                            Product product = new Product();
                                            product.setPid(productId);
                                            product.setPname(productName);
                                            product.setPprice(productPrice);
                                            product.setPunits(productUnits);


                                            // Add the product to the list
                                            productList.add(product);
                                        }
                                    %>
                                    <% for (Product p: productList) {%>
                                    <h6><%=p.getPname()%> : -- <%=p.getPunits()%> Units</h6>
                                    <%
                                        }
                                    %>
                                        <a href="#!">
                                            <div class="hover-overlay">
                                                <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                            </div>
                                        </a>
                                 </div>
                             </div>
                            <div class="col-md-6 col-lg-6 col-xl-6">

                                <h5>User Email : <%=order.getOmail()%></h5>
                                <label class="form-label-lg" style="color: red;">Status : <%=order.getOstatus()%></label>
                                <p class="mb-5 mb-md-0 " style="width: 450px;font-size: 16px;color: gray;text-align: justify;text-justify: inter-word; ">
                                    Address : <%=order.getOadd()%>
                                </p>

                            </div>
                            <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                <div class="d-flex flex-row align-items-center mb-1">
                                    <h5 class="mb-1 me-1" >Amount : &#8377; <%=order.getOtotalamt()%></h5>
                                </div>
                                <div class="d-flex flex-row align-items-center mb-1">
                                    <h7 class="mb-1 me-1" >Date : <%=order.getOdate()%></h7>
                                </div>
                                <form action="/completeorderprocess" method="POST" >
                                    <div class="d-flex flex-column mt-4">
                                        <input  name="id" value="<%=order.getOid()%>", type="hidden">
                                        <button class="btn btn-warning btn-sm" type="submit">Complete Order</button>
                                    </div>
                                </form>
                                <form action="/acceptorderprocess" method="POST" >
                                    <div class="d-flex flex-column mt-4">
                                        <input name="id" value="<%=order.getOid()%>", type="hidden">
                                        <button class="btn btn-warning btn-sm" type="submit">Accept Order</button>
                                    </div>
                                </form>
                </div>
                        </div>
                    </div>
                </div>
                <%  }
                    %>
                </div>

                 </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
