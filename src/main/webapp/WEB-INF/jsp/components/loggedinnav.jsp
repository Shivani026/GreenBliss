<link href='https://fonts.googleapis.com/css?family=Noto Sans' rel='stylesheet'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<nav class="navbar  navbar-expand-lg navbar-light" style="font-family: 'Noto Sans';color:black;">
  <div class="container">
  <a class="navbar-brand" href="index" ><img src="img/logonav.png" width="30" height="30" class="d-inline-block align-top" alt="">Green Bliss</a>&nbsp  Hi ,${sessionScope.currentuser.cname}.
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav ml-auto">
                        
       <li class="nav-item active">
        <a class="nav-link" href="index">Home</a>
      </li> &nbsp
                 
      
       <li class="nav-item active">
        <a class="nav-link" href="products">Shop</a>
       </li>

       <li class="nav-item active">
         <button class="btn btn-link-light" style="background-color: white;text-decoration:none;" type="button" data-toggle="modal" data-target="#cart"><svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
         <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
         <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
         </svg><span class="ml-0 mb-2 cart-items" >(0)</span> </button>
       </li>

		<li class="nav-item dropdown">
		
        <a class="nav-link"   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp
          <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
			  <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
		  </svg>&nbsp
        </a>
        
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="myorders">My Orders</a>
          <a class="dropdown-item" href="mytickets">My Tickets</a>
          <a class="dropdown-item" href="ticket">Support</a>
          <a class="dropdown-item" href="aboutus">About Us</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="userprofile">Your Profile</a>
          <a class="dropdown-item" href="login">Logout</a>
        </div>
        </div>
        
      </li>
            
      
    </ul>
  </div>
    </div>


</nav>