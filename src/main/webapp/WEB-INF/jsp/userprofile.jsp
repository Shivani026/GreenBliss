<%@ page import="com.greenbliss.entities.Customer" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Bliss - User Profile</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
    <%
        Customer user = (Customer) session.getAttribute("currentuser");
    %>
    <% if (user != null) { %>
    <%@ include file="components/loggedinnav.jsp" %>
    <% } else { %>
    <%@ include file="components/navbar.jsp" %>
    <% } %>
        <%
            Customer customer = (Customer) session.getAttribute("currentuser");
        %>
        <section class="h-100 bg-light">
            <div class="container py-3 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                  <div class="card card-registration my-4">
                    <div class="row g-0">
                      <div class="col-xl-6 d-none d-xl-block">
                        <img src="img/userpro.png"
                          alt="Sample photo" class="img-fluid"
                          style="border-top-left-radius: .50rem; border-bottom-left-radius: .25rem;height : 820px;" />
                      </div>
                      <div class="col-xl-6">
                        <div class="card-body p-md-5 text-black">              
                           <img src="img/logonav.png" style="height: 70px; width: 70px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
                           <h3 class="text-center my-3">User Profile</h3>
                           <small class="form-text text-muted text-center my-3">You can edit your details here.</small>
                          
                          <!--Form-->
                          <form action="saveprofile" method="post">
                          
                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" for="Firstname">Full name</label>
                                  <input value="<%=customer.getCname()%>" name="Cname" type="text" id="cfname" pattern="^[A-Z][a-z]+\s[A-Z][a-z]+$" class="form-control form-control-lg"  required/>
                              </div>
                            </div>                           
                          </div>

                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                   <label class="form-label" for="email">E-Mail</label>
                                <input value="<%=customer.getcmail()%>" name="Cmail" type="email" id="cemail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control form-control-lg" required/>
                              </div>
                            </div>
                          </div>
                               
                          <div class="row">                    
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">     
                             
                              <label class="form-label" for="password">Set Password</label>
                                <input name="Cpass" value="<%=customer.getCpass()%>"type="password" id="psw" class="form-control form-control-lg" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" oninvalid="alert('Password must be 8-12 characters, Must contain at least one number and one uppercase and lowercase letter, a special character and at least 8 or more characters');" maxlength="12" minlength="8"  required/>
                                 <small class="form-text text-muted " style="font-size: 12px;text-align: justify;  text-justify: inter-word;">(Password must be 8-12 characters, Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters)</small>
                              </div>
                            </div>   
                            </div>                         
                          
                            <div class="row" style="margin-bottom:-40px;">  
                            <div class="col-md-6 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" for="Phone">Phone (+91)</label>                                  
                                <input name="Cmob" value="<%=customer.getCmob()%>"type="tel" id="cphone" class="form-control form-control-lg" maxlength="10" minlength="10" required/>
                                <small class="form-text text-muted " style="font-size: 12px;">(Enter 10 digit phone number)</small>
                              </div>
                            </div>
                          
							<div class="col-md-6 mb-3">
							  <div class="form-outline mb-3">
							   <label class="form-label" for="Address">Local Address</label>
								<input value="<%=customer.getCadd()%>" name="Cadd" type="text" id="cadd" class="form-control form-control-lg" required/>
								<small class="form-text text-muted " style="font-size: 12px;">Local Address.</small><br>
							  </div>
							</div>
						  </div>     <br><br>

							

                          <div class="d-flex justify-content-center" style="margin-top:-10px;margin-bottom:-10px;">
                         	 <a class="btn btn-light btn-lg ml-3" href="index">Cancel</a>&nbsp
                            <button type="submit" class="btn btn-success btn-lg ml-3" >Save Changes</button>
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
   function reset(){  
   document.getElementById("signupform").reset();  
 }  
 

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
</html>
