<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>About Us</title>
  <!-- Bootstrap 5 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <!-- Google Fonts for the signature -->
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <!--  stylesheet for navbar/footer -->
  <link rel="stylesheet" href="style/aboutus.css">
  <link rel="stylesheet" href="style/style.css">
</head>
<body>
  <!-- Navbar/Header -->
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

  <!-- About Us Hero Section -->
  <div class="about-hero-section position-relative d-flex align-items-center justify-content-center min-vh-100">
    <img 
      src="images/aboutus1.jpg" 
      alt="About Us Event" 
      class="about-bg-img"
    >
    <div class="container position-relative z-2">
      <div class="row min-vh-100 align-items-center">
        <div class="col-lg-7"></div>
        <div class="col-lg-5 d-flex align-items-center">
          <div class="about-quote-box ms-lg-5 p-4 p-md-5 bg-white bg-opacity-75 rounded-4 shadow animate-fade-in">
            <div class="display-5 lh-1 text-primary mb-3" style="opacity:0.25;">"</div>
            <p class="about-quote-text fs-4 mb-4">
              Finding the perfect stay should be easy and stress-free. Our platform connects you with trusted hotels worldwide, offering seamless booking and great choices for every traveler. We are dedicated to helping you discover comfortable, memorable stays - so your journey is always exceptional.
            </p>
            <div class="about-signature mb-2">Chathura</div>
            <div class="about-title">
             Mr. Chathura Fernando<br>
              President &amp; CEO<br>
              STAYZILLA
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
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
      <div class="footer-section social">
        <h4>Follow Us</h4>
        <ul class="social-icons">
          <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
          <li><a href="#"><i class="fab fa-tiktok"></i></a></li>
          <li><a href="#"><i class="fab fa-youtube"></i></a></li>
          <li><a href="#"><i class="fab fa-instagram"></i></a></li>
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
    <div class="footer-bottom">
      <div class="language-currency">
        <select class="select Section1">
          <option value="en">English</option>
          <option value="es">Espanol</option>
          <option value="fr">Francais</option>
          <option value="pt">Portugues</option>
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
