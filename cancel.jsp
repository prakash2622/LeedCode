<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="Index.css">
<meta charset="UTF-8">
<title>Reservation System</title>
</head>
<body>
<nav>
		<ul>
			<li><a href="index.html">Book Ticket</a></li>
			<li><a href="Cancel.html">Cancel Ticket</a></li>
			<li><a href="summary.html">Booking Summary</a></li>
		</ul>
	</nav>
        <div class="form">
      <div class="title">HOGWARTS EXPRESS</div>
      <div class="subtitle">CHENNAI TO MADURAI</div>
      <form name="myForm" action="viewCancel.jsp">
 
      <div class="input-container ic2">
        <input id="to" list="tstations" class="input" type="text" onfocusout ="validateForm()"placeholder=" " name="PNR" required autocomplete="off"/>
        <div class="cut"></div>
        <label for="lastname" class="placeholder">Enter PNR</label>
        
      </div>
      <p id="alert" style="color:red;"></p>
    
      <script src="cancel.js"></script>
      <button  class="submit" >Verify and Cancel</button>
      </form>
    </div>
</body>
</html>