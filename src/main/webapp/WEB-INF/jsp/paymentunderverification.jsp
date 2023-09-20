<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Payment Under Verification</title>
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
	<img src="https://cdn.dribbble.com/users/437847/screenshots/3770748/media/526f69faa2fcd14b87496ef91213ba9e.gif" id="center" style="height:200px;width:250px;"><br>
    <h3>Hi ,${sessionScope.currentuser.cname}. Thanks for making the payment.</h3>
    <h4>Your payment is under verification for below payment ID</h4>
    <h4>Payment ID :<span style="color:red;"> ${paymentId}</span></h4>
    <h4>Your order will be accepted by admin after verification of payment</h4>
    <h4>You can check your order status under "My Orders" tab.</h4>

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