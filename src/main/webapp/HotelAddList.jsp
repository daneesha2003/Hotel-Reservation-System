<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hotel List</title>
    <link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Lora', serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        h1 {
            color: #2d5c4d;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }
        
        .hotel-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        
        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }
        
        #searchInput {
            padding: 10px 15px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: 'Lora', serif;
            font-size: 1em;
        }
        
        .hotel-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 300px;
            overflow: hidden;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
        }
        
        .hotel-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
        
        .hotel-header {
            background-color: #2d5c4d;
            color: white;
            padding: 15px;
        }
        
        .hotel-name {
            margin: 0;
            font-size: 1.4em;
            font-weight: 600;
        }
        
        .hotel-location {
            margin: 5px 0 0;
            font-style: italic;
            font-size: 0.9em;
            opacity: 0.9;
        }
        
        .hotel-body {
            padding: 15px;
            flex-grow: 1;
        }
        
        .hotel-rating {
            color: #2d5c4d;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .hotel-rates {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 0.9em;
        }
        
        .rate-label {
            font-weight: 600;
            color: #2d5c4d;
        }
        
        .no-hotels {
            text-align: center;
            color: #666;
            font-style: italic;
            margin: 40px 0;
        }
        
        .error {
            color: #d9534f;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 4px;
            margin: 20px auto;
            max-width: 600px;
            text-align: center;
        }
        
        .check-availability-btn {
            display: block;
            width: calc(100% - 30px);
            margin: 15px;
            padding: 10px;
            background-color: #2d5c4d;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
            font-family: 'Lora', serif;
            font-size: 1em;
        }
        
        .check-availability-btn:hover {
            background-color: #1e4638;
        }
    </style>
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
     <h1>Featured Hotels</h1>
    
    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Search by hotel name or location..." onkeyup="filterHotels()">
    </div>

    <%-- Display error if any --%>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    
    <div class="hotel-container" id="hotelContainer">
        <c:choose>
            <c:when test="${empty hotels}">
                <p class="no-hotels">No hotels found in the database.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${hotels}" var="hotel">
                    <div class="hotel-card" data-name="${hotel.name.toLowerCase()}" data-location="${hotel.location.toLowerCase()}">
                        <div class="hotel-header">
                            <h3 class="hotel-name">${hotel.name}</h3>
                            <p class="hotel-location">${hotel.location}</p>
                        </div>
                        
                        <div class="hotel-body">
                            <div class="hotel-rating">
                                Rating: ${hotel.rating}/5
                            </div>
                            <div class="hotel-rates">
                                <span class="rate-label">Single:</span>
                                <span>LKR${hotel.singleRate}</span>
                            </div>
                            <div class="hotel-rates">
                                <span class="rate-label">Double:</span>
                                <span>LKR${hotel.doubleRate}</span>
                            </div>
                            <div class="hotel-rates">
                                <span class="rate-label">Suite:</span>
                                <span>LKR${hotel.suiteRate}</span>
                            </div>
                            <div class="hotel-rates">
                                <span class="rate-label">Deluxe:</span>
                                <span>LKR${hotel.deluxeRate}</span>
                            </div>
                            <c:if test="${not empty hotel.description}">
                                <p style="margin-top: 15px; font-size: 0.9em;">
                                    ${hotel.description}
                                </p>
                            </c:if>
                        </div>
                        <button class="check-availability-btn" onclick="checkAvailability(${hotel.id})">
                            Book
                        </button>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    
    <p class="no-hotels" id="noResults" style="display: none;">No hotels match your search criteria.</p>
    
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

     <script>
    function checkAvailability(hotelId) {
        window.location.href = 'DisplayHotelServlet?hotelId=' + hotelId;
    }
    
    function filterHotels() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const hotelContainer = document.getElementById('hotelContainer');
        const hotels = hotelContainer.getElementsByClassName('hotel-card');
        const noResults = document.getElementById('noResults');
        
        let foundMatches = false;
        
        for (let i = 0; i < hotels.length; i++) {
            const name = hotels[i].getAttribute('data-name');
            const location = hotels[i].getAttribute('data-location');
            
            if (name.includes(filter) || location.includes(filter)) {
                hotels[i].style.display = "";
                foundMatches = true;
            } else {
                hotels[i].style.display = "none";
            }
        }
        
        // Show/hide no results message
        if (foundMatches || filter === "") {
            noResults.style.display = "none";
        } else {
            noResults.style.display = "block";
        }
    }
    
    // Add event listener for when the page loads
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize search functionality
        const searchInput = document.getElementById('searchInput');
        if (searchInput) {
            searchInput.focus();
        }
    });
    </script>
</body>
</html>