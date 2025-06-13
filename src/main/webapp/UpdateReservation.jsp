<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<link rel="stylesheet" type="text/css" href="style/reservationUpdate.css">
<link rel="stylesheet" href="style/style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
    <div class="form-container">
        <%
        String id = request.getParameter("id");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String roomType = request.getParameter("roomType");
        LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
        LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));
        int totalLengthStay = Integer.parseInt(request.getParameter("totalLengthStay"));
        String specialRequest = request.getParameter("specialRequest"); 
        %>
        
        <h1 class="form-title">Update Reservation</h1>
        
        <form action="UpdateReservationServlet" method="post" class="reservation-form">
            <div class="form-group">
                <label for="id">Reservation ID</label>
                <input type="text" id="id" name="id" value="<%=id%>" readonly>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" value="<%=firstName%>" required>
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="<%=lastName%>" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%=email%>" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" value="<%=phone%>" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="roomType">Room Type</label>
                <select id="roomType" name="roomType" required>
                    <option value="single" <%= roomType.equals("single") ? "selected" : "" %>>Single Room</option>
                    <option value="double" <%= roomType.equals("double") ? "selected" : "" %>>Double Room</option>
                    <option value="suite" <%= roomType.equals("suite") ? "selected" : "" %>>Suite</option>
                    <option value="deluxe" <%= roomType.equals("deluxe") ? "selected" : "" %>>Deluxe Room</option>
                </select>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="checkIn">Check In Date</label>
                    <input type="date" id="checkIn" name="checkIn" value="<%=checkIn%>" required>
                </div>
                
                <div class="form-group">
                    <label for="checkOut">Check Out Date</label>
                    <input type="date" id="checkOut" name="checkOut" value="<%=checkOut%>" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="totalLengthStay">Total Length of Stay (nights)</label>
                <input type="number" id="totalLengthStay" name="totalLengthStay" value="<%=totalLengthStay%>" required>
            </div>
            
            <div class="form-group">
                <label for="specialRequest">Special Requests</label>
                <textarea id="specialRequest" name="specialRequest" rows="4"><%=specialRequest%></textarea>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="submit-btn">
                    <i class="fas fa-save"></i> Update Reservation
                </button>
                <a href="ReservationGetServlet" class="cancel-btn">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
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
</body>
</html>