<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.greenbliss.dao.TicketDao" %>
<%@ page import="com.greenbliss.entities.Ticket" %>
<%@ page import="com.greenbliss.dao.CustomerDao" %>
<%@ page import="com.greenbliss.entities.Customer" %>
<%@ page import="java.util.Optional" %><%--
    Document   : signup
    Created on : Jun 6, 2023, 1:04:39 PM
    Author     : Shiwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Tickets</title>
    <%@include file="components/common_css_js.jsp" %>
    <%
        HttpSession httpSession;
    %>
</head>
<body>
<%@include file="components/loggedinnav.jsp"%>
<%
    TicketDao ticketDao =new TicketDao();
    List<Ticket> ticketList = ticketDao.getAllTickets();


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
                                    <h4>Manage Tickets</h4>
                                </div>
                            </div>
                        </div>
                    </div>


                <div>
                    <%
                        for(Ticket ticket:ticketList)
                        {
                    Customer current = (Customer) session.getAttribute("currentuser");
                    if(current.getCid()==ticket.getCid())
                    {%>
                <div class="card shadow-0 border rounded-3" style="margin-bottom: 10px;">
                    <div class="card-body">
                        <div class="row">
                            <%
                                CustomerDao customerDao = new CustomerDao();
                                Customer customer = customerDao.getCustomer(ticket.getCid());
                            %>
                            <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                    <h5>User : <%=customer.getCname()%></h5>
                                    <h7 class="mb-1 me-1" >Ticket Id : <%=ticket.getTid()%></h7>
                                        <a href="#!">
                                            <div class="hover-overlay">
                                                <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                            </div>
                                        </a>
                                 </div>
                             </div>
                            <div class="col-md-6 col-lg-6 col-xl-6">

                                <h6><%=ticket.getTsub()%></h6>
                                <p class="mb-5 mb-md-0 " style="width: 450px;font-size: 16px;color: gray;text-align: justify;text-justify: inter-word; ">
                                    <%=ticket.getTcon()%>
                                </p>
                                <div >
                                <p class="mb-5 mb-md-0 " style="width: 450px;font-size: 16px;color: indianred;text-align: justify;text-justify: inter-word; ">
                                    Response : <%=ticket.getTres()%>
                                </p>
                                </div>



                            </div>
                            <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">

                            </div>
                        </div>
                    </div>
                </div>  <%  }}
                    %>
                </div>

                 </div>
            </div>
        </div>
    </div>
</section>
 <%@include file="components/common_modals.jsp"%>
</body>
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
                                        "<td><img style='width: 100px;height: 100px;' src="+item.productImg+"></td>"+
                                        "<td>&#8377;"+item.productPrice+"</td>"+
                                        "<td>"+item.productUnits+"</td>"+
                                        "<td>&#8377;"+item.productPrice * item.productUnits+"</td>"+
                                        "<td>"+"<button class='btn btn-danger btn-sm' onclick='deleteItemFromCart("+item.productId+")'>Remove</button>"+"</td>"+
                                        "</tr>";
                                    totalPrice += item.productPrice * item.productUnits;

                                });

                                table = table + "<tr><td colspan='6' class='text-right font-weight-bold m5'> Total Price : &#8377; "+ totalPrice +"</td></tr>" +"</table"
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
