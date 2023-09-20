<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Checkout</title>
    <%@include file="components/common_css_js.jsp" %>

    <style>
        @media (min-width: 1025px) {
            .h-custom {
                height: 100vh !important;
            }
        }
         body{
             background-color: #F7F7F7;
         }
        .card-registration .select-input.form-control[readonly]:not([disabled]) {
            font-size: 1rem;
            line-height: 2.15;
            padding-left: .75em;
            padding-right: .75em;
        }

        .card-registration .select-arrow {
            top: 13px;
        }

        .bg-grey {
            background-color: #eae8e8;
        }

        @media (min-width: 992px) {
            .card-registration-2 .bg-grey {
                border-top-right-radius: 16px;
                border-bottom-right-radius: 16px;
            }
        }

        @media (max-width: 991px) {
            .card-registration-2 .bg-grey {
                border-bottom-left-radius: 16px;
                border-bottom-right-radius: 16px;
            }
        }
    </style>
</head>
        <body>
        <%@include file="components/loggedinnav.jsp" %>
        <div class="container">
            <div class="row">


                <div class="col-md-6">
                    <div class="card" style="display: inline-block;">
                        <div class="card-body" >
                            <h3 class="text-center mb-5">Your selected products</h3>
                            <div class="cart-body" >

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" style="width:500px;margin-left:50px;">
                    <form action="paymentform" method="post">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Order details</h3>
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <div class="form-outline">
                                        <label class="form-label" >Receiver's Name</label>
                                        <input name="oname" type="text" class="form-control form-control-lg" value="${sessionScope.currentuser.cname}" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <div class="form-outline">
                                        <label class="form-label" >Receiver's Email</label>
                                        <input name="omail" type="email" class="form-control form-control-lg" value="${sessionScope.currentuser.cmail}" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <div class="form-outline">
                                        <label class="form-label" >Receiver's Phone</label>
                                        <input name="omob" type="tel" class="form-control form-control-lg" value="${sessionScope.currentuser.cmob}" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <div class="form-outline">
                                        <label class="form-label" >Receiver's Address</label>
                                        <input name="oadd" type="text" class="form-control form-control-lg" value="${sessionScope.currentuser.cadd}" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <div class="form-outline">
                                        <input name="oprods" type="hidden" id="cfname" class="form-control form-control-lg total-products"/>
                                        <input name="amount" type="hidden" class="total-amt"/>
                                    </div>
                                </div>
                            </div>
                                <h4 class="centered-label" name="amount" style="color:red;">Amount : &#8377;<span class="total-amt"></span></h4><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-success" type="submit" >Pay Now</button>
                                <button class="btn btn-light" type="button" onclick="window.location.href='products'">Cancel</button>
                        </div>
                        <div class="row">
							<div class="col-md-12 mb-3 justify-content-center">
                            
                            </div>
                        </div>

                    </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <script>

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
                    $(".total-amt").html(totalPrice)
                    $(".total-amt").attr("value",totalPrice)
                    $(".total-products").attr("value", cartString)
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

            $(document).ready(function ()
            {
                updateCart();
            })


        </script>

        </body>
</html>