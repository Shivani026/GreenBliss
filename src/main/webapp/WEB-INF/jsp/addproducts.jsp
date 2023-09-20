<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>GreenBliss - Add products</title>
</head>
<body>
<%@include file="components/adminloggedinnav.jsp" %>
        <section class="h-100 bg-light">
            <div class="container py-3 h-100" style="width:650px;">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                 <div class="card card-registration my-4">
                    
                        <div class="card-body p-md-5 text-black">              
                           <img src="img/logonav.png" style="height: 70px; width: 70px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
                           <h3 class="text-center my-3">Add new product</h3>
                           <small class="form-text text-muted text-center my-3">Fill in the product details</small><br>
                          
                          <!--Form-->
                          <form action="addproductprocess" method="POST" id="adproform" enctype="multipart/form-data">
                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" >Product name</label>
                                  <input name="pname" type="text" id="pname" class="form-control form-control-lg"  required/>                                
                              </div>
                            </div>                           
                          </div>

                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                   <label class="form-label" >Product details</label>
                                <textarea name="pdetails" type="text" id="pdetails" class="form-control form-control-lg" required/></textarea>                               
                              </div>
                            </div>
                          </div>
                               
                          <div class="row">                    
                            <div class="col-md-6 mb-3">
                              <div class="form-outline"> 
                                <label class="form-label" >Price(&#8377;)</label>
                                <input name="pprice" type="number" id="pprice" class="form-control form-control-lg" min="1" required/>
                                </div>
                            </div>                            
                          
                            <div class="col-md-6 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" >Product units</label>
                                <input name="punits" type="number" id="punits" class="form-control form-control-lg" min="1" required/>                                
                              </div>
                            </div>
                          </div>
						  
						  <div class="row"> 
						  <div class="col-md-6 mb-3">
                              <div class="form-outline">
                                <label class="form-label" >Product category</label>
								<select class="form-control" id="exampleFormControlSelect1" type="text" name="pcategory">
  								<option selected>product category</option>
								<option value="plants">Plants</option>
								<option value="seeds">Seeds</option>
								<option value="accessories">Accessories</option>
								<option value="soils">Soils</option>
								<option value="comnfer">Compost & fertilizers</option>
								<option value="tools">Tools</option>
							  </select>                               
                              </div>
                            </div>
							
							<div class="col-md-6 mb-3">
                              <div class="form-outline">
							  <label  class="form-label">Product image</label>
							  <input type="file" class="form-control-file" name="pimg" id="exampleFormControlFile1"  accept="image/*">
							  </div>
							</div>
                          </div>
						<br>
                            <div class="d-flex justify-content-center ">
                            <button type="button" class="btn btn-light" onClick = "reset()">Reset all</button>
                            <button type="submit" class="btn btn-warning  ml-3" value="Upload">Add product</button>
                          </div>
						
                        </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              
            
</section>
<script>  
   function reset(){  
   document.getElementById("adsignupform").reset();  
 }   
</body>

</html>
              