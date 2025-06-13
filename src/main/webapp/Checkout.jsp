<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="style/checkout.css">
</head>
<body>
<!--Nav bar-->
    <div class="navbar">
        <div class="logo">
            <a href="#"><img id="navilogo" src="images/logo.jpg" alt="Logo"></a>
        </div>

        <ul class="navilinks">
            <li><a href="home.jsp">Home</a></li>
	        <li><a href="DisplayStayServlet">Stays</a></li>
	        <li><a href="feedback.jsp">Feedback</a></li>
	        <li><a href="aboutus.jsp">About us</a></li>
        </ul>

        <div class="logo-placeholder"></div>
   	 		<div class="pro-user-account-image">
   	 	 	<a href="UserAccount.jsp">
    		<img src="images/man.png" alt="Pro User Profile"></a>
		</div>
		
    </div>
    
    <div class="checkout-container">
        <h2><i class="fas fa-credit-card"></i> Payment Information</h2>
        
        
        
        <form action="CaclculateBillServlet" method="post">
            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="expiry">Expiry Date</label>
                    <input type="text" id="expiry" name="expiry" placeholder="MM/YY" required>
                </div>
                
                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" name="cvv" placeholder="123" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="nameOnCard">Name on Card</label>
                <input type="text" id="nameOnCard" name="nameOnCard" placeholder="John Doe" required>
            </div>
            
            <button type="submit" class="submit-btn" >
                <i class="fas fa-lock"></i> Complete Booking
            </button>
        </form>
    </div>
    
    <!-- Footer start -->

    <footer>
       <hr>
        <div class="footer-container">
      
          <div class="footer-section company-info">
            <img src="images/logo.jpg" alt="Company Logo" class="footer-logo">
          </div>
      
          <div class="footer-section links">
            <h4>Links</h4>
            <ul>
              <li><a href="home.jsp">Home</a></li>
	          <li><a href="DisplayStayServlet">Stays</a></li>
	          <li><a href="Contactus.jsp">Contact us</a></li>
	          <li><a href="aboutus.jsp">About us</a></li>
	          <li><a href="FAQ.jsp">FAQ</a></li>
            </ul>
          </div>
      
          <!-- Social Media-->
          <div class="footer-section social">
            <h4>Follow Us</h4>
            <ul class="social-icons">
              <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
              <li><a href="#"><i class="fab fa-tiktok"></i></a></li>
              <li><a href="#"><i class="fab fa-youtube"></i></a></li>
              <li><a href="#"><i class="fab fa-instagram"></i></a></li>
            </ul>
          </div>
      
          <!--Subscribe-->
          <div class="footer-section subscribe">
            <h4>Stay Updated</h4>
            <form>
              <input type="email" placeholder="Enter your email">
              <button class="btn" type="submit">Subscribe</button>
            </form>
            <h4>Download App</h4>
            <div class="app-buttons">
              <a href="#"><img src="images/app-store.png" alt="App Store"></a>
              <a href="#"><img src="images/google-play.png" alt="Play Store"></a>
            </div>
          </div>
        </div>
      
        <!-- Copyright Section -->
        <div class="footer-bottom">
          <div class="language-currency">
            <select class="select Section1">
              <option value="en">English</option>
              <option value="es">Español</option>
              <option value="es">Français</option>
              <option value="es">Português</option>
              <option value="es">Deutsch</option>      
            </select>
      
            <select class="select Section2">
              <option value="usd">USD</option>
              <option value="eur">EUR</option>
              <option value="eur">PHP</option>
            </select>
          </div>
          <p>&copy; 2024 BOOKLT.COM All rights reserved.</p>
        </div>
      </footer> 
<script src="js/checkout.js"></script>
</body>
</html>