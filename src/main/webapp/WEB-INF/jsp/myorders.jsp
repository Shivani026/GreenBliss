<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="com.greenbliss.entities.Payment" %>
<%@ page import="com.greenbliss.dao.PaymentDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.greenbliss.dao.OrderDao" %>
<%@ page import="com.greenbliss.entities.Orders" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.greenbliss.entities.Customer" %><%--
    Document   : signup
    Created on : Jun 6, 2023, 1:04:39 PM
    Author     : Shiwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - My Orders</title>
    <%@include file="components/common_css_js.jsp" %>
    <%
        Customer customer = (Customer) session.getAttribute("currentuser");
    %>
</head>
<body>
<%@include file="components/loggedinnav.jsp"%>
<%
    OrderDao orderDao =new OrderDao();
    List<Orders> ordersList = OrderDao.getByCid(customer.getCid());
    
    PaymentDao paymentDao = new PaymentDao();

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
                                    <h4>Your Orders</h4>
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
                                                <h6><%=p.getPname()%> : -- <span style="color:green" ><%=p.getPunits()%> Units</span></h6>
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
                                            <p class="mb-5 mb-md-0 " style="width: 450px;font-size: 16px;color: blue;text-align: justify;text-justify: inter-word; ">
                                            <%
                                            Payment payment = paymentDao.getPayment(order.getOid());
                                            if(order.getOstatus().contains("Received"))
                                            {
                                            %>                                            
                                                Transaction ID : <%=payment.getPayid()%>                                            
                                            <%
                                            }
                                            else
                                            {
                                            %>
                                            Transaction ID : Not yet generated
                                            <%
                                            }
                                            %>
                                            </p>
                                            <p class="mb-5 mb-md-0 " style="width: 450px;font-size: 16px;color: gray;text-align: justify;text-justify: inter-word; ">
                                                Address : <%=order.getOadd()%>
                                            </p>
                                            

                                        </div>
                                        <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                            <div class="d-flex flex-row align-items-center mb-1">
                                                <h4 class="mb-1 me-1" >Amount : &#8377; <%=order.getOtotalamt()%></h4>
                                            </div>
                                            <div class="d-flex flex-row align-items-center mb-1">
                                                <h6 class="mb-1 me-1" >Date : <%=order.getOdate()%></h6>
                                            </div>

                                            <form action="/repaymentform" method="POST" >
                                                <div class="d-flex flex-column mt-4">
                                                    <input name="oid" value="<%=order.getOid()%>", type="hidden">
                                                    <button class="btn btn-warning btn-sm" type="submit">Make Payment</button>
                                                </div>
                                            </form>
                                            <form action="/deleteorderprocess" method="POST" >
                                                <div class="d-flex flex-column mt-4">
                                                    <input name="oid" value="<%=order.getOid()%>", type="hidden">
                                                    <button class="btn btn-warning btn-sm" type="submit">Delete Order</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>  <%  }
                    %>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<script>
// cart 
                        function add_to_cart(pid, pname, pprice, pimg,punits)
                        {

                            let cart = localStorage.getItem("cart");
                            if(cart==null)
                            {
                                let products=[];
                                let product={productId:pid, productName:pname, productPrice:pprice, productImg:pimg,productUnits:punits}
                                products.push(product);
                                localStorage.setItem("cart",JSON.stringify(products));
                                console.log("Product is added for first time")
                            }
                            else
                            {
                                let pcart = JSON.parse(cart);
                                let oldProduct = pcart.find((item)=>item.productId==pid)
                                if(oldProduct)
                                {
                                    oldProduct.productUnits = oldProduct.productUnits+1
                                    pcart.map((item)=>{
                                        if(item.productId==oldProduct.productId)
                                        {
                                            item.productUnits=oldProduct.productUnits;
                                        }
                                    })
                                    localStorage.setItem("cart", JSON.stringify(pcart));
                                    console.log("Product quantity is increased")
                                }
                                else
                                {
                                    let product={productId:pid, productName:pname, productPrice:pprice, productImg:pimg,productUnits:punits}
                                    pcart.push(product);
                                    localStorage.setItem("cart", JSON.stringify(pcart));
                                    console.log("Product is added")

                                }
                            }

                            updateCart();
                        }


                        function updateCart()
                        {
                            let cartString = localStorage.getItem("cart");
                            let cart = JSON.parse(cartString);
                            if(cart==null || cart.length==0)
                            {
                                console.log("Cart is empty...")
                                $(".cart-items").html("( 0 )");
                                $(".cart-body").html("<h3>Cart does not have any items...</h3>");
                                $(".checkout-btn").attr('disabled', true);

                            }
                            else
                            {

                                console.log(cart.length)
                                document.getElementsByClassName("cart-items")[0].innerHTML="("+cart.length+")"

                                let table =
                                    "<table class='table'>"+
                                    "<thead class='thread-light'>"
                                    +"<tr>"+
                                    "<th>Item Name</th>"+
                                    "<th>Product Photo</th>"+
                                    "<th>Price</th>"+
                                    "<th>Quantity</th>"+
                                    "<th>Total Price</th>"+
                                    "<th>Action</th>"+
                                    "</tr>"+
                                    "</thead>";

                                let totalPrice =0;


                                JSON.parse(localStorage.getItem('cart')).map(item=>{
                                    table+="<tr>"+
                                        "<td>"+item.productName+"</td>"+
                                        "<td><img style='width: 100px;height: 100px;' src='data:image/jpeg;base64,"+item.productImg+"'></td>"+
                                        "<td>&#8377;"+item.productPrice+"</td>"+
                                        "<td>"+item.productUnits+"</td>"+
                                        "<td>&#8377;"+item.productPrice * item.productUnits+"</td>"+
                                        "<td>"+"<button class='btn btn-danger btn-sm' onclick='deleteItemFromCart("+item.productId+")'>Remove</button>"+"</td>"+
                                        "</tr>";
                                    totalPrice += item.productPrice * item.productUnits;

                                });

                                table = table + "<tr><td colspan='6' class='text-right font-weight-bold m5'> Total Price : &#8377;"+ totalPrice +"</td></tr>" +"</table"
                                $(".cart-body").html(table);
                                $(".checkout-btn").attr('disabled', false);
                            }
                        }

                        function deleteItemFromCart(pid)
                        {
                            let cart = JSON.parse(localStorage.getItem('cart'));
                            let newcart = cart.filter((item)=> item.productId != pid);

                            localStorage.setItem('cart',JSON.stringify(newcart));
                            updateCart();
                        }


                        function goToCheckout()
                        {
                            alert("testing");
                        }


                        $(document).ready(function ()
                        {
                            updateCart();
                        })
</script>
 <%@include file="components/common_modals.jsp"%>
</body>
</html>
