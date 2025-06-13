<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserve Your Stay</title>
<link rel="stylesheet" type="text/css" href="style/reservationInsert.css">
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script src="js/reservationIns.js"></script>
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
    <div class="background-image"></div>
<div class="reservation-container">
		
        <div class="reservation-box">
            <h2 class="form-title">Reserve Your Stay</h2>
            <form action="InsertReservationServlet" method="post" class="reservation-form" onsubmit="return validateForm()">
                <table>
                    <tr>
                        <td><label for="firstName">First Name:</label></td>
                        <td><input type="text" id="firstName" name="firstName" class="input-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="lastName">Last Name:</label></td>
                        <td><input type="text" id="lastName" name="lastName" class="input-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="email">Email:</label></td>
                        <td><input type="email" id="email" name="email" class="input-field email-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="phone">Phone Number:</label></td>
                        <td><input type="tel" id="phone" name="phone" class="input-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="roomType">Room Type:</label></td>
                        <td>
                            <select id="roomType" name="roomType" class="input-field" required>
                                <option value="single">Single Room</option>
                                <option value="double">Double Room</option>
                                <option value="suite">Suite</option>
                                <option value="deluxe">Deluxe Room</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="checkIn">Check In Date:</label></td>
                        <td><input type="date" id="checkIn" name="checkIn" class="input-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="checkOut">Check Out Date:</label></td>
                        <td><input type="date" id="checkOut" name="checkOut" class="input-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="totalLengthStay">Total Length of Stay:</label></td>
                        <td><input type="number" id="totalLengthStay" name="totalLengthStay" class="input-field length-field" required></td>
                    </tr>
                    <tr>
                        <td><label for="specialRequest">Special Requests:</label></td>
                        <td><textarea id="specialRequest" name="specialRequest" class="input-field" rows="4"></textarea></td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" class="submit-cell">
                            <input type="submit" value="Submit" class="submit-btn">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
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
      <script src="js/reservationIns.js"></script>
</body>
</html>