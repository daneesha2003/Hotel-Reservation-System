<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation details</title>
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="style/reservationDisplay.css">
<link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;700&display=swap" rel="stylesheet">
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
    <h2 class="reservation-title">Reservation Details</h2>
    
    <c:forEach var="reservation" items="${allReservations}">
    <div class="reservation-card">
        <div class="reservation-header">
            <h3>Reservation #${reservation.id}</h3>
            <div class="action-buttons">
                <a href="UpdateReservation.jsp?id=${reservation.id}&firstName=${reservation.firstName}&lastName=${reservation.lastName}&email=${reservation.email}&phone=${reservation.phone}&roomType=${reservation.roomType}&checkIn=${reservation.checkIn}&checkOut=${reservation.checkOut}&totalLengthStay=${reservation.totalLengthStay}&specialRequest=${reservation.specialRequest}" class="update-btn">
                    <i class="fas fa-edit"></i> Update
                </a>
                <form action="DeleteReservationServlet" method="post" class="delete-form">
                    <input type="hidden" name="id" value="${reservation.id}" />
                    <button type="submit" class="delete-btn">
                        <i class="fas fa-trash-alt"></i> Delete
                    </button>
                </form>
            </div>
        </div>
        
        <div class="reservation-details">
            <div class="detail-row">
                <div class="detail-column">
                    <div class="detail-item">
                        <span class="detail-label">Guest Name:</span>
                        <span class="detail-value">${reservation.firstName} ${reservation.lastName}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Email:</span>
                        <span class="detail-value">${reservation.email}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Phone:</span>
                        <span class="detail-value">${reservation.phone}</span>
                    </div>
                </div>
                
                <div class="detail-column">
                    <div class="detail-item">
                        <span class="detail-label">Room Type:</span>
                        <span class="detail-value">${reservation.roomType}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Check In:</span>
                        <span class="detail-value">${reservation.checkIn}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Check Out:</span>
                        <span class="detail-value">${reservation.checkOut}</span>
                    </div>
                </div>
            </div>
            
            <div class="detail-row-full">
                <div class="detail-item">
                    <span class="detail-label">Length of Stay:</span>
                    <span class="detail-value">${reservation.totalLengthStay} nights</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Special Requests:</span>
                    <span class="detail-value">${reservation.specialRequest}</span>
                </div>
            </div>
           <c:forEach var="bill" items="${totbill}"> 
            <div class="detail-item">
                    <span class="detail-label">Total Amount:</span>
                    <span class="detail-value">LKR${bill.totalAmount}</span>
                </div>
                </c:forEach>
        </div>
    </div>
    </c:forEach>
    
    <div class="checkout-container">
        <a href="Checkout.jsp" class="checkout-btn" onclick="location.href='Checkout.jsp'">
            <i class="fas fa-credit-card"></i> Go to Checkout
        </a>
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
      <script src="js/script.js"></script>
</body>
</html>