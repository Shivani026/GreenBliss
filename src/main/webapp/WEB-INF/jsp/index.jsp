<%@ page import="com.greenbliss.entities.Customer" %><%--
    Document   : index
    Created on : May 29, 2023, 9:15:43 AM
    Author     : Shiwani
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Bliss - Home</title>
        <%@include file="components/common_css_js.jsp" %>
        <style><%@include file="css/indexstyles.css" %></style>
        <script><%@include file="js/script.js" %></script>
    </head>
    <body>
    <%
        Customer user = (Customer) session.getAttribute("currentuser");
    %>
    <% if (user != null) { %>
    <%@ include file="components/loggedinnav.jsp" %>
    <%@include file="components/chatwindow.jsp" %>
    <% } else { %>
    <%@ include file="components/navbar.jsp" %>
    <% } %>
        
        <header>
            <div class="text-white py-5" style="background: url('img/bg1.png');height: 350px;">
            <div class="container py-5">
                <h1>
                   Plant smiles,  <br />
                   Grow love.
                </h1>
                 <p>
                   Unleash the beauty of green bliss.
                 </p>                
            </div>
        </div>
        </header>
        <br><br>
        <!--Categories -->
        <section style="background-color: #f5f5f5;">
            <div class="text-center container py-3">
                <h4 class="mt-4 mb-5"><strong>CATEGORIES</strong></h4>

                <div class="row">

                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="card">
                            <div class="bg-image hover-zoom" data-mdb-ripple-color="light">
                                <img src="img/plants.png" class="w-100" />
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                    <h5 class="card-title mb-3">Plants</h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="card">
                            <div class="bg-image hover-zoom " data-mdb-ripple-color="light">
                                <img src="img/seeds.png" class="w-100" />
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title mb-3">Seeds</h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="card">
                            <div class="bg-image hover-zoom " data-mdb-ripple-color="light">
                                <img src="img/tools.png" class="w-100" />
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title mb-3">Tools</h5>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row">

                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="card">
                            <div class="bg-image hover-zoom " data-mdb-ripple-color="light">
                                <img src="img/compost.png" class="w-100" />
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title mb-3">Compost & Fertilizers</h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="card">
                            <div class="bg-image hover-zoom " data-mdb-ripple-color="light">
                                <img src="img/soil.png" class="w-100" />
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title mb-3">Soil</h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="card">
                            <div class="bg-image hover-zoom " data-mdb-ripple-color="light">
                                <img src="img/accessories.png" class="w-100" />
                                <a href="#!">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title mb-3">Accessories</h5>
                            </div>
                        </div>
                    </div>


                </div>


            </div>
        </section>

        <!-- CONTAINER -->
        <section class="mt-5 mb-5" style="background-color: #f5f5f5;height: 300px;">
          <div class="container text-dark pt-3 ">
            <header class="pt-4 pb-3">
              <h3>Why choose us?</h3>
            </header>

            <div class="row mb-4">
              <div class="col-lg-4 col-md-6">

                    <h6 class="title"> Reasonable prices</h6>
                    <p>Low prices, best Products.</p>

                <!-- itemside // -->
              </div>
              <!-- col // -->
              <div class="col-lg-4 col-md-6">

                    <h6 class="title"> Free Shipping</h6>
                    <p>We deliver our products for free!</p>

                <!-- itemside // -->
              </div>
              <!-- col // -->
              <div class="col-lg-4 col-md-6">

                    <h6 class="title"> Doorstep delivery</h6>
                    <p>Get all the products you wish for at your doorstep.</p>

                <!-- itemside // -->
                  </div>
                  <!-- col // -->
                  <div class="col-lg-4 col-md-6">

                        <h6 class="title">Range of Products</h6>
                        <p>We have various categories of products</p>

                    <!-- itemside // -->
                  </div>
                  <!-- col // -->
                  <div class="col-lg-4 col-md-6">

                        <h6 class="title"> Happy customers</h6>
                        <p>We have a strong family of 1000+ customers.</p>

                    <!-- itemside // -->
                  </div>
                  <!-- col // -->
                  <div class="col-lg-4 col-md-6">

                        <h6 class="title"> Customer Support</h6>
                        <p>We are here to solve all your queries.</p>

                    <!-- itemside // -->
                  </div>
                  <!-- col // -->
                </div>
              </div>
              <!-- container end.// -->
            </section>

        <!-- Footer -->

             <div class="container">
              <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
                <p class="col-md-4 mb-0 text-muted">&copy; 2023 Green Bliss Nursery & Ceramics</p>

                <a href="index.jsp" target="_blank" class=""><img src="img/logonav.png" height="35" /></a>

                <ul class="nav col-md-4 justify-content-end">
                  <li class="nav-item"><a href="index" class="nav-link px-2 text-muted">Home</a></li>
                  <li class="nav-item"><a href="myorders" class="nav-link px-2 text-muted">My Orders</a></li>                  
                  <li class="nav-item"><a href="ticket" class="nav-link px-2 text-muted">FAQs</a></li>
                  <li class="nav-item"><a href="aboutus" class="nav-link px-2 text-muted">About</a></li>
                </ul>
              </footer>
			</div>
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
