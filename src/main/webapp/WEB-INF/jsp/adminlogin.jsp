<%-- 
    Document   : signup
    Created on : Jun 6, 2023, 1:04:39 PM
    Author     : Shiwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Bliss - Admin Login</title>
        <%@include file="components/common_css_js.jsp" %>
         </head>
    <body>
        <%@include file="components/adminnav.jsp" %>
       <section class="vh-100 bg-light">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;height:600px;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="img/img3.png"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;height:598px;width:400px;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="adminloginprocess" method="post">
                <img src="img/logonav.png" style="height: 70px; width: 70px;border: none;" alt="Logo" class="img-thumbnail mx-auto d-block">
                 <h3 class="text-center my-3">Admin Login</h3>
                 <small class="form-text text-muted text-center my-3">Welcome back Admin!</small><br>

                  <div class="form-outline mb-4">
                    <input type="email" id="form2Example17" name="amail" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">Email address</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example27" name="apass" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Password</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <button class="btn btn-success btn-lg btn-block" type="submit">Login</button>
                  </div>

                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">New Admin? <a href="adminsignup"
                      style="color: #393f81;">Sign Up</a></p>
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
</html>
