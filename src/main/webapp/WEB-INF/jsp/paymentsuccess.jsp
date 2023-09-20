
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Payment Success</title>
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
         <div class="container" style="margin:100px;" style="height:auto;">
        	<div class="card d-flex justify-content-center align-items-center" style="height:auto;">
        		<div class="card-body text-center" style="height:auto;padding:50px;">
        	    <form action="index">
	            <img src="img/check-green.gif" id="center" style="height:200px;width:200px;"><br>
	                <h3>Hi ,${sessionScope.currentuser.cname}.</h3>
	                <h3>Your payment is successful and Order has been placed.</h3>
	                <h4>Payment ID :<span style="color:red;"> ${paymentId}</span></h4><br>
	                <button class="btn btn-dark" type="submit"> Return to Home</button>
	              
	            </form>
	        	</div>
	       </div>
	      </div>
        
</body>


<script>

    $(document).ready(function() {
        localStorage.clear();
    });
</script>
</html>