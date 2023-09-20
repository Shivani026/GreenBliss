
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Bliss - Admin Sign Up</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/adminnav.jsp" %>
        <section class="h-100 bg-light">
            <div class="container py-3 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                  <div class="card card-registration my-4">
                    <div class="row g-0">
                      <div class="col-xl-6 d-none d-xl-block">
                        <img src="img/img3.png"
                          alt="Sample photo" class="img-fluid"
                          style="border-top-left-radius: .50rem; border-bottom-left-radius: .25rem;height : 820px;width:450px;" />
                      </div>
                      <div class="col-xl-6" style="margin-left:-50px;">
                        <div class="card-body p-md-5 text-black">              
                           <img src="img/logonav.png" style="height: 70px; width: 70px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
                           <h3 class="text-center my-3">Admin Sign Up</h3>
                           <small class="form-text text-muted text-center my-3">Please fill in the information below</small>
                          
                          <!--Form-->
                          <form action="adminsignupprocess" method="post" id="adsignupform">
                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" for="Firstname">Full name</label>
                                  <input name="aname" type="text" id="cfname" pattern="^[A-Z][a-z]+\s[A-Z][a-z]+$" class="form-control form-control-lg"  required/>                                
                              </div>
                            </div>                           
                          </div>

                          <div class="row">
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">
                                   <label class="form-label" for="email">E-Mail</label>
                                <input name="amail" type="email" id="cemail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control form-control-lg" required/>                               
                              </div>
                            </div>
                          </div>
                               
                          <div class="row">                    
                            <div class="col-md-12 mb-3">
                              <div class="form-outline">     
                                <label class="form-label" for="password">Set Password</label>
                                <input name="apass" type="password" id="cpass" class="form-control form-control-lg" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" oninvalid="alert('Password must be 8-12 characters, Must contain at least one number and one uppercase and lowercase letter, a special character and at least 8 or more characters');" maxlength="12" minlength="8" required/>
                                 <small class="form-text text-muted " style="font-size: 12px;text-align: justify;  text-justify: inter-word;">(Password must be 8-12 characters, Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters)</small>
                              </div>
                            </div>      
                            </div>                      
                          
                          <div class="row"> 
                            <div class="col-md-6 mb-3">
                              <div class="form-outline">
                                  <label class="form-label" for="Phone">Phone (+91)</label>                                  
                                <input name="amob" type="tel" id="cphone" class="form-control form-control-lg" maxlength="10" minlength="10" required/>
                                <small class="form-text text-muted " style="font-size: 12px;">(Enter 10 digit phone number)</small>
                              </div>
                            </div>
                                             
                          <div class="col-md-6 mb-3">     
                          <div class="form-outline mb-3">
                           <label class="form-label" for="Address">Address</label>
                            <input name="aadd" type="text" id="cadd" class="form-control form-control-lg" required/><br>
                          </div>  
                          </div>  
                          </div>

							<div class="row"><div class="col-md-12 mb-3"><small class="form-text text-muted text-center mt-0">Already have an account? <a href="login">Login</a></small><br></div></div>

                          <div class="d-flex justify-content-center "  style="margin-top:-10px;margin-bottom:-10px;">
                            <button type="button" class="btn btn-light btn-lg" onClick = "reset()">Reset all</button>
                            <button type="submit" class="btn btn-warning btn-lg ml-3">Submit form</button>
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
    </body>
    <script>  
   function reset(){  
   document.getElementById("adsignupform").reset();  
 }   
</script>
</html>
