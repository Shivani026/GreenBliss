<style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the chat form - fixed at the bottom of the page */

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width textarea */
.form-container textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
  resize: none;
  min-height: 200px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}



/* Add some hover effects to buttons */

.container-div {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

/* Darker chat container */
.darker {
  border-color: #ccc;
  background-color: #ddd;
}

/* Clear floats */
.container-div::after {
  content: "";
  clear: both;
  display: table;
}

/* Style images */
.container-div img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

</style>

<button class="btn btn-success btn-lg" style="position:fixed;  bottom: 23px;  right: 28px;z-index:5;font-size:25px;width:50px;padding:5px;" onclick="openChat()"><i class="bi bi-chat-text"></i> </button>


<div class="chat-popup" id="chat" style="background-color:rgba(0,0,0,0);border:none;">
  <div  class="container-div"> 
     
     <h3>Support</h3><br>

    <div class="container-div">
	  <img src="https://cdn-icons-png.flaticon.com/512/1053/1053244.png" style="height:40px;width:40px;" alt="Avatar">
	  <p>Hello. How may I help you?</p>
	  </div><br>
	  
    <div class="container justify-content-center">
    
        <a  class="btn btn-success" href="ticket" style="width:100px;">FAQ</a>&nbsp

        <a  class="btn btn-primary" href="ticket" style="width:100px;">Feedback</a><br><br>
      
        <a class="btn btn-warning" role="button" href="ticket" style="width:100px;">Ticket</a>&nbsp

    	<button type="button" class="btn btn-danger" onclick="closeChat()" style="width:100px;">Close</button>
    	
	</div>

  </div>
</div>

<script>
function openChat() {
  document.getElementById("chat").style.display = "block";
}

function closeChat() {
  document.getElementById("chat").style.display = "none";
}
</script>
