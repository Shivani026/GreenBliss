

<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Bliss - Products</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
			.icon-hover:hover {
			  border-color: #3b71ca !important;
			  background-color: white !important;
			}

			.icon-hover:hover i {
			  color: #3b71ca !important;
			}
            .product_view .modal-dialog{max-width: 800px; width: 100%;}
            .pre-cost{text-decoration: line-through; color: #a5a5a5;}
            .space-ten{padding: 10px 0;}
        </style>
    </head>
    <body>
          <%@include file="components/loggedinnav.jsp" %>
          <%@include file="components/chatwindow.jsp" %>
            <%
            ProductDao productDao =new ProductDao();
            List<Product> productList = productDao.getAllProducts();
        %>

  <div class="container" style="margin-bottom:100px;background:#F7F7F7;padding-top:50px;">
    <div class="row">
      <!-- sidebar -->
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
                    <form action="/productsCategory" method="post" id="categoryForm">
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
      <!-- sidebar -->
      <!-- content -->
      <div class="col-lg-9">

        <%
        for(Product product:productList)
        {
        if(product.getPcategory().equals(session.getAttribute("prod").toString()))
        {%>

        <div class="row justify-content-center mb-3">
          <div class="col-md-12">
            <div class="card shadow-0 border rounded-3">
              <div class="card-body">
                <div class="row g-0">
                  <div class="col-xl-3 col-md-4 d-flex justify-content-center">
                    <div class="bg-image hover-zoom ripple rounded ripple-surface me-md-3 mb-3 mb-md-0">
                        <img src="data:image/jpeg;base64,<%=product.getPimg()%>" class="w-100" style="height:180px;width:150px;" />
                      <a href="#!">
                        <div class="hover-overlay">
                          <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                      </a>
                    </div>
                  </div>
                    <div class="col-xl-6 col-md-5 col-sm-7">
                        <h5><%=product.getPname()%></h5>

                        <p style="text-align: justify;  text-justify: inter-word;">
                            <%=product.getPdetails()%>
                        </p>
                        <p class="toast alert alert-success" style="display: none; justify-content: center">
                            +1 Product Quantity Added to cart...!!
                        </p>
                    </div>
                  <div class="col-xl-3 col-md-3 col-sm-5">
                    <div class="d-flex flex-row align-items-center mb-1">
                      <h4 class="mb-1 me-1"> &#8377; <%=product.getPprice()%> </h4>

                    </div>
                    <%
					        if(product.getPunits()>0)
					        {
					    %>
					    <h6 class="text-success">Free shipping</h6>
					    <h6 class="text-warning">Only <%=product.getPunits()%> Units left in stock.. !!</h6>
					    <%
					    }
					    else
					    {
					    %>
					    <h6 class="text-error" style="color: red">Out of stock</h6>
					    <%
                                        }
                                    %>
                    <div class="mt-4">
                        <%--<button class="btn btn-primary shadow-0" type="button" data-toggle="modal" data-target="#product_view">View</button>--%>
                      <button onclick="add_to_cart(this,<%=product.getPid()%>,'<%=product.getPname()%>',<%=product.getPprice()%>,'<%=product.getPimg()%>',1)" class="btn btn-warning border px-2 pt-2 icon-hover">Add To Cart</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>


        <%  }}
                  %>
      </div>
    </div>
  </div>
<hr />
<!-- Footer -->


    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 ">
          <p class="col-md-4 mb-0 text-muted">&copy; 2023 Green Bliss Nursery & Ceramics</p>

          <a href="index.jsp" target="_blank" class="">
                  <img src="img/logonav.png" height="35" />
                </a>

          <ul class="nav col-md-4 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
          </ul>
        </footer>
    </div>


      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

      <script>

          function add_to_cart(button,pid, pname, pprice, pimg,punits)
          {
              var toast = $(button).closest(".card-body").find(".toast");
              toast.css("display", "block");
              setTimeout(function () {
                  toast.css("display", "none");
              }, 1000);
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


        function category(c)
        {
            $(".categoryinput").attr('value', c);
            document.getElementById("categoryForm").submit();
        }


        $(document).ready(function ()
        {
            updateCart();
        })

      </script>
    <%@include file="components/common_modals.jsp"%>
    </body>
</html>