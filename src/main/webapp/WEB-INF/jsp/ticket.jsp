

<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Bliss - Support</title>
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
          
        <div class="container" style="margin-top:20px">
          <h3 style="text-align: center;">Customer Support</h3>
			<div id="accordion" style="margin-top:10px">
			  <div class="card">
			    <div class="card-header" id="headingOne">
			      <h5 class="mb-0">
			        <button class="btn btn-link" style="text-decoration:none;color:black;font-size:25px;" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          Raise a ticket
			        </button>
			      </h5>
			    </div>
			
			    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
			      <div class="card-body">
			      
			      
			        <div class="container py-5 h-100">
					    <div class="row d-flex justify-content-center align-items-center h-100">
					      <div class="col col-xl-10">
					        <div class="card" style="border-radius: 1rem;height:600px;">
					          <div class="row g-0">
					          
					            <div class="col-md-6 col-lg-5 d-none d-md-block" style="margin-top:150px;padding-left:80px;">
					              <img src="img/ticket1.png" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;height:match-parent;width:match-parent;padding-top:30px;" />
					            </div>
					            
					            <div class="col-md-6 col-lg-7 d-flex align-items-center">
					              <div class="card-body p-4 p-lg-5 text-black">
						          		
								<form action="raiseticket" method="post">

					                <img src="img/logonav.png" style="height: 70px; width: 70px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
					                 <h3 class="text-center my-3">Raise a Ticket</h3>
					                 <small class="form-text text-muted text-center my-3">Please fill in the information below</small><br>
					
					                  <div class="form-outline mb-4">
					                  	<label class="form-label" >Subject</label>
					                    <input type="text" id="t_sub" name="tsub" class="form-control form-control-lg" />
					                  </div>
					
					                  <div class="form-outline mb-4">
					                  	<label class="form-label" >Description</label>
					                    <textarea class="form-control" name="tcon" id="exampleFormControlTextarea1" rows="3"></textarea>
					                  </div>
					
					                  <div class="pt-1 mb-4">
					                    <button class="btn btn-dark btn-lg btn-block" type="submit">Raise Ticket</button>
					                  </div>
					
							  	</form>
						          		
						          </div>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  
			      </div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-header" id="headingTwo">
			      <h5 class="mb-0">
			        <button class="btn btn-link collapsed" style="text-decoration:none;color:black;font-size:25px;" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			          Feedback
			        </button>
			      </h5>
			    </div>
			    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
			      <div class="card-body">
			      <div class="container py-5 h-100">
			      
			      
				    <div class="row d-flex justify-content-center align-items-center h-100">
				      <div class="col col-xl-10">
				        <div class="card" style="border-radius: 1rem;height:600px;">
				          <div class="row g-0">
				          
				            <div class="col-md-6 col-lg-5 d-none d-md-block" style="margin-top:150px;padding-left:80px;">
				              <img src="img/ticket1.png" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;height:match-parent;width:match-parent;padding-top:30px;" />
				            </div>
				            
				            <div class="col-md-6 col-lg-7 d-flex align-items-center">
				              <div class="card-body p-4 p-lg-5 text-black">
					          		
					       <form action="submitfeedback" method="POST">
					        <img src="img/logonav.png" style="height: 70px; width: 70px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
					           <h3 class="text-center my-3">Feedback</h3>
					             <small class="form-text text-muted text-center my-3">Tell us about your experience.</small><br>
					       
                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" >Comment</label>
                                  <input name="fcomment" type="text" id="pname" class="form-control form-control-lg"  required/>
                              </div>
                            </div>                           
                          </div>

                          						  
						  <div class="row"> 
						  <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                <label class="form-label" >Ratings</label>
								<select class="form-control" id="exampleFormControlSelect1" type="text" name="frating">
  								<option selected>Rating</option>
								<option value="1">1 Star</option>
								<option value="2">2 Stars</option>
								<option value="3">3 Stars</option>
								<option value="4">4 Stars</option>
								<option value="5">5 Stars</option>
							  </select>                               
                              </div>
                            </div>						
                          </div>
						<br>
                            <div class="pt-1 mb-4">
					                    <button class="btn btn-dark btn-lg btn-block" type="submit">Send feedback</button>
					                  </div>
						
                        </form>     		
					          		
						          </div>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  
			      </div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-header" id="headingThree">
			      <h5 class="mb-0">
			        <button class="btn btn-link collapsed" style="text-decoration:none;color:black;font-size:25px;" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			          Frequently Asked Questions (FAQs)
			        </button>
			      </h5>
			    </div>
			    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
			      <div class="card-body">
			      
			      
			        <div class="container py-5 h-100">
					   					      
					            <b>How do I track my order?</b><br>
								<p>If you are a registered user,<a href="myorders">Click Here</a> to track your order.</p><br>

								<b>When will I receive my order?</b><br>
								<p>Generally, your order will be dispatched within a day after your transaction has been confirmed. However, depending on the product the dispatch time may vary. <a href="myorders">Click here</a> to check the order status.</p><br>

								<b>How do I know my order is confirmed?</b><br>
								<p>You will be acknowledged through an email with order confirmation details.<a href="myorders">Click here</a> to check the order status.Once the order has been confirmed, it cannot be canceled, refunded, replaced, or returned.
								*We do not have a refund policy if you refuse the delivery.</p><br>
								
								<b>Refund policy</b>
								<p>Orders delivered & accepted by the customer cannot be refunded.In case you feel the order is not as per specification, please contact our customer care team immediately in 24hrs.</p>
					   				
					   			<b>Cancellation Policy</b>
					   			<p>Green Bliss believes in helping its customers as far as possible and has, therefore, a liberal cancellation policy. Under this policy:
								<p>Cancellations will be considered only if the request is made within 24 hours of placing an order. However, the cancellation request will not be entertained if the orders have been communicated to the vendors/merchants and they have initiated the process of shipping them.</p>

								<p>There is no cancellation of orders placed under the Same Day Delivery category. </p>

								<p>In case of receipt of damaged or defective consumer durable items and nondurable items, please report the same to our Customer Service team. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 1 day of receipt of the products.</p>  
								
								<p>In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 24 hours of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision. </p> 
					   			
					   			<b>Damaged/Wrong product received</b>
					   			<p>In case you received the damaged or wrong product, share the order number and images of the product within 48 hours at customer support. We will resolve your concern within 48 working hours.</p> 
					   			
					   			<b>How to update Address?</b>
					   			<p>Steps:<br>
								1. Go to <a href="userprofile">Your Profile</a><br>
								2. Fill in the information to update your address<br>
								3. Click Save Changes<br>
								*Please note that after your order is shipped you cannot change any details on your order.</p> 
					   			         
					</div>
				  </div>
				</div>
			  </div>
			</div>
		</div>
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