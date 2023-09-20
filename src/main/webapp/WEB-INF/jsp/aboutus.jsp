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
    <title>Green Bliss - About Us</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       <%@include file="components/common_css_js.jsp" %>
       <style>
		       #center {
		  display: block;
		  margin-left: auto;
		  margin-right: auto;
		  width: 50%;
		}
     </style>
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
    <br>
    <h3 style="text-align: center;">About Us</h3>
    <div class="container d-flex justify-content-center" style="margin:50px;height:auto;width:100%;margin-left:100px;">
    
    
       <table>
       
       <tr>
       <td style="width:600px;">
         <p style="width:450px;height:250px;text-align: justify;text-justify: inter-word;">
         "Green Bliss Nursery and Ceramics" is a local nursery located at Chandrapur, Maharashtra and is owned by Mr. Prakash Katole. He started this nursery in the year 2001 from a promise to deliver 'green and healthy' to every customer and has successfully established 22 years of business. The nursery business runs in the family and they have a strong customer base of around 700+ regular customers. 
         </p>
       </td>
       <td><img src="https://img.freepik.com/premium-vector/set-cute-mexican-succulents-illustration_318237-161.jpg?w=740" style="width:400px;height:330px;"></td>
       </tr>
         
       <tr>
       <td style="width:600px;"><img src="https://img.freepik.com/premium-vector/cartoon-flower-wither-plant-pot-green-leaf-wilting-faded-vector-sick-dry-sad-sprout-funny-flower-plant-flowerpot-happy-growing-withered-wilted-sad-emoji-emoticon-with-smile_53500-1177.jpg?w=996" style="width:500px;height:300px;"></td>
       <td>
        <p style="width:450px;height:250px;text-align: justify;text-justify: inter-word;">
         The family is actively into the nursery business. They regularly hold workshops covering various areas like garden decoration, bonsai technique etc. They claim to have provided employment to 100+ people with their business and have held 50+ workshops till date.
         </p>
        </td>
       </tr>
       
       <tr>
       <td style="width:600px;">
         <p style="width:450px;height:250px;text-align: justify;text-justify: inter-word;">
         The nursery is spread across 30 acres of land near Lohara, Chandrapur where they grow plants as well as vegetables. They cater to all kinds of gardening needs ranging from plants, pots, tools, to curated plant-scaping solutions. They sell products such as flowering-plants, vegetable-plants, seeds, soils, compost & fertilizers (organic), and imported decorative accessories and tools. They also deal in the ceramic’s products and has a partnership with the person with expertise in it. They currently serve only around the Chandrapur district covering all the tehsils. 
         </p>
         </td>
         <td><img src="https://img.freepik.com/premium-vector/set-cute-hand-drawn-houseplant-illustration_631550-22.jpg?w=740" style="width:450px;height:350px;"><br></td>
       </tr>
         
       <tr>
       <td style="width:600px;"><img src="https://img.freepik.com/premium-vector/set-cute-cactus-succulent-plants-mascot_373791-483.jpg?w=740" style="width:450px;height:300px;"></td>
       <td>
         <p style="width:450px;height:250px;text-align: justify;text-justify: inter-word;">
         Along all these 22 years of business they have 60% of repeat customer base and thus have decided to expand their business on the online platform as well. A one-stop-shop for all gardening related requirements, Green Bliss has more than 1000 products available for sale.
         </p>
         </td>
       </tr>
                  
       </table>
       
    </div>
        
         <!-- Footer -->

             <div class="container">
              <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
                <p class="col-md-4 mb-0 text-muted">&copy; 2023 Green Bliss Nursery & Ceramics</p>

                <a href="index.jsp" target="_blank" class=""><img src="img/logonav.png" height="35" /></a>

                <ul class="nav col-md-4 justify-content-end">
                  <li class="nav-item" style="color:grey;">Write us at : nurserygreenbliss@gmail.com</li>
                </ul>
              </footer>
			</div>
</body>
</html>