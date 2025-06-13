<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel</title>
<style>
        body {
            font-family: 'Lora', serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        .hotel-details-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .hotel-header {
            background-color: #2d5c4d;
            color: white;
            padding: 20px;
        }
        
        .hotel-name {
            margin: 0;
            font-size: 1.8em;
            font-weight: 600;
        }
        
        .hotel-location {
            margin: 5px 0 0;
            font-style: italic;
            font-size: 1.1em;
            opacity: 0.9;
        }
        
        .hotel-body {
            padding: 20px;
        }
        
        .hotel-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        
        .hotel-rating {
            color: #2d5c4d;
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.2em;
        }
        
        .hotel-amenities {
            margin: 20px 0;
        }
        
        .amenities-title {
            font-weight: 600;
            color: #2d5c4d;
            margin-bottom: 10px;
        }
        
        .rate-options {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin: 20px 0;
        }
        
        .rate-option {
            flex: 1;
            min-width: 150px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            text-align: center;
        }
        
        .rate-label {
            font-weight: 600;
            color: #2d5c4d;
            margin-bottom: 5px;
        }
        
        .rate-price {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        
        .book-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2d5c4d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
            font-family: 'Lora', serif;
            font-size: 1em;
        }
        
        .book-btn:hover {
            background-color: #1e4638;
        }
        
        .center-btn {
		    display: flex;
		    justify-content: center;
		}
        
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #2d5c4d;
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" href="style/style.css">
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
    

	<div class="hotel-details-container">
        <div class="hotel-header">
            <h1 class="hotel-name">${hotel.name}</h1>
            <p class="hotel-location">${hotel.location}</p>
        </div>
        
        <div class="hotel-body">
            <img src="images/hotel-placeholder.jpg" alt="${hotel.name}" class="hotel-image">
            
            <div class="hotel-rating">
                Rating: ${hotel.rating}/5
            </div>
            
            <p>${hotel.description}</p>
            
            <div class="hotel-amenities">
                <div class="amenities-title">Amenities:</div>
                <p>${hotel.amenities}</p>
            </div>
            
            <h3>Room Rates</h3>
            <div class="rate-options">
                <div class="rate-option">
                    <div class="rate-label">Single Room</div>
                    <div class="rate-price">LKR ${hotel.singleRate}</div>
                    
                </div>
                <div class="rate-option">
                    <div class="rate-label">Double Room</div>
                    <div class="rate-price">LKR ${hotel.doubleRate}</div>
                    
                </div>
                <div class="rate-option">
                    <div class="rate-label">Suite</div>
                    <div class="rate-price">LKR ${hotel.suiteRate}</div>
                    
                </div>
                <div class="rate-option">
                    <div class="rate-label">Deluxe Room</div>
                    <div class="rate-price">LKR ${hotel.deluxeRate}</div>
                    
                </div>
                
            </div>
            <div class="center-btn">
            <form action="InsertReservation.jsp" method="post">
            <button class="book-btn" >Book Now</button>
            </form>
            </div>
            
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

</body>
</html>