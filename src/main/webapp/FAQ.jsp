<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>FAQ</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style/FAQ.css">
  <!-- Your header/footer CSS file -->
  <link rel="stylesheet" href="style/style.css">
</head>
<body>
  <!-- Header/Navbar -->
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

  <!-- Main FAQ Section -->
  <div class="container">
    <h2>Frequently Asked Questions</h2>
    <div class="grid">
      <div class="card">
        <span class="icon"><i class="fa-regular fa-user"></i></span>
        <div class="card-title">How do I create a user account?</div>
        <div class="card-desc">You can create an account during booking or by clicking "Sign Up" on our site.</div>
        
        
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-globe"></i></span>
        <div class="card-title">Can I cancel or change my reservation?</div>
        <div class="card-desc">You can cancel or change your booking.Policies apply.</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-network-wired"></i></span>
        <div class="card-title">How do I know if my reservation is confirmed?</div>
        <div class="card-desc">You’ll get a confirmation email after booking.</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-house"></i></span>
        <div class="card-title">How do I make a special request?</div>
        <div class="card-desc">During booking or contact the hotel directly.</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-file-invoice-dollar"></i></span>
        <div class="card-title">Is my payment information secure?</div>
        <div class="card-desc">All transactions are encrypted and your information is kept safe</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-users"></i></span>
        <div class="card-title">What payment methods are accepted?</div>
        <div class="card-desc">Major credit cards, debit cards, and sometimes digital wallets.</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-users-gear"></i></span>
        <div class="card-title">If I have not received my confirmation email?</div>
        <div class="card-desc">Check spam or contact support.</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-list"></i></span>
        <div class="card-title">How do I get booking notifications?</div>
        <div class="card-desc">You’ll get email updates for bookings.</div>
      </div>
      <div class="card">
        <span class="icon"><i class="fa-solid fa-calculator"></i></span>
        <div class="card-title">Can I save payment details?</div>
        <div class="card-desc">Yes, securely in your account.</div>
      </div>
    </div>
  </div>

  <!-- Footer Start -->
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
          <li><a href="#">Stays</a></li>
          <li><a href="Contactus.jsp">Contact us</a></li>
          <li><a href="aboutus.jsp">About us</a></li>
          <li><a href="FAQ.jsp">FAQ</a></li>
        </ul>
      </div>
      <div class="footer-section social">
        <h4>Follow Us</h4>
        <ul class="social-icons">
          <li><a href="home.jsp">Home</a></li>
          <li><a href="DisplayStayServlet">Stays</a></li>
          <li><a href="Contactus.jsp">Contact us</a></li>
          <li><a href="aboutus.jsp">About us</a></li>
          <li><a href="FAQ.jsp">FAQ</a></li>
        </ul>
      </div>
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
          <option value="fr">Français</option>
          <option value="pt">Português</option>
          <option value="de">Deutsch</option>      
        </select>
        <select class="select Section2">
          <option value="usd">USD</option>
          <option value="eur">EUR</option>
          <option value="php">PHP</option>
        </select>
      </div>
      <p>&copy; 2024 BOOKLT.COM All rights reserved.</p>
    </div>
  </footer> 
</body>
</html>
