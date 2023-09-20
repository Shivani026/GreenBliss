<%--<%@ page import="com.greenbliss.entities.Customer" %><%--%>
<%--    Customer customer = (Customer) session.getAttribute("currentuser");--%>
<%--    if(customer==null)--%>
<%--    {--%>

<%--    }--%>
<%--%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Payment</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/loggedinnav.jsp" %>
<section class="h-100 bg-light">
    <div class="container py-3 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
        		<div class="card" style="border-radius: 1rem;height:auto;width:auto">
        		  <div class="row g-0">

        		  		<div class="col-xl-6 d-none d-xl-block align-items-center justify-content-center" style="border-right: 2px solid gray;padding:30px;">
        		  		<h3 class="text-center my-3">Pay via QR code</h3><br>
        		  		<div class="container" style="margin:130px;margin-top:10px;">
		                <div class="container" id="qrcode">
                            <form action="/payviaqr" method="post">
                                  <img src="img/code2.png" alt="Sample photo" class="img-fluid" style="border-top-left-radius: .50rem; border-bottom-left-radius: .25rem;height :300px;width:250px;margin-left:-60px;" /><br><br>
                                  <input name="payid" class="form-control form-control-lg" placeholder="Enter Your Payment/Transaction Id" style="margin-left:-120px;">
                                  <input name="amount" type="hidden" value="${sessionScope.amount}"/>
                                  <input name="odate" type="hidden" value=${sessionScope.odate}/><br>
                                  <button class="btn btn-primary" type="submit">Submit Payment</button>
                            </form>
		                </div>
		               </div>
		               </div>

		               
		                      
		                   <div class="col-xl-6">
        		           <div class="card-body p-md-5 text-black">
                                <img src="img/download.png" style="height: 50px; width: 100px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
                                
                                <h3 class="text-center my-3">Pay via card</h3>

                                <!--Form-->
                                <form action="/payment" method="post" id="paymentform">
                                    <div class="row">
                                        <div class="col-md-12 mb-3 justify-content-center align-items-center">
                                            <div class="form-outline">
                                                <h6 class="text-center">Accepted Cards
                                                <div class="icon-container">
									              <i class="fa fa-cc-visa" style="color:navy;"></i>
									              <i class="fa fa-cc-amex" style="color:blue;"></i>
									              <i class="fa fa-cc-mastercard" style="color:red;"></i>
									              <i class="fa fa-cc-discover" style="color:orange;"></i>
									            </div></h6>
									            <h5 style="color:red; class="text-center my-3" >Amount : &#8377;<span class="total-amt"></span> </h5>
                                                <input name="amount" type="hidden" value="${sessionScope.amount}"/>
                                                <input name="odate" type="hidden" value=${sessionScope.odate}/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <div class="form-outline">
                                                <label class="form-label" for="Firstname">Cardholder's Name</label>
                                                <input name="name" type="text" id="cfname" pattern="^[A-Z]+\s[A-Z]+$" class="form-control form-control-lg" style="text-transform:uppercase"  required/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <div class="form-outline">
                                                <label class="form-label" for="email">Card Number</label>
                                                <input type="tel" placeholder="xxxx xxxx xxxx xxxx" pattern="[0-9]+\s[0-9]+\s[0-9]+\s[0-9]+$" maxlength="19" minlength="19" id="cemail" class="form-control form-control-lg" required/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <div class="form-outline">

                                                <label class="form-label" for="password">Expiry Month</label>
                                                <input name="month" type="tel" placeholder="MM" min="01" max="12" maxlength="2" minlength="2" id="cpass" class="form-control form-control-lg" required/>
                                                
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <div class="form-outline">
                                                <label class="form-label" for="Phone">Expiry Year</label>
                                                <input name="year" type="tel" placeholder="YYYY" min="2023" max="2035" maxlength="4" minlength="4" id="cphone" class="form-control form-control-lg" required/>
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-outline mb-3">
                                        <label class="form-label" for="CVV">CVV</label>
                                        <input name="cvv" type="password" min="100" max="999"maxlength="3" minlength="3" id="cadd" placeholder="XXX" class="form-control form-control-lg" required/>
                                        
                                    </div>

                                    <div class="d-flex justify-content-center ">
                                         <button type="submit" class="btn btn-warning btn-lg ml-3" >Confirm and Proceed</button>
                                    </div>
                                </form>
                            </div>
                        </div>
		             </div>
                </div>
            </div>
        </div>
	</div>
</section>
 <%@include file="components/common_modals.jsp"%>
</body>
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
            // document.getElementsByClassName("cart-items")[0].innerHTML="("+cart.length+")"

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
            $(".total-amt").attr('value', totalPrice)
            $(".total-amt").html(totalPrice)
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
</html>
