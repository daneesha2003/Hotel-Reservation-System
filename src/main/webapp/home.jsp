<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StayZilla - Book Your Perfect Stay</title>
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Lora', serif;
        }
        
        body {
            background-color: #F2F2EB;
            color: #333;
        }
        .pro-user-account-image {
		  width: 50px;
		  height: 50px;
		  border-radius: 50%;
		  border: 2px solid gold; /* Indicates pro status */
		  overflow: hidden;
		}

		.pro-user-account-image img {
		  width: 100%;
		  height: 100%;
		  object-fit: cover;
		}
        
        /* Hero Section with Video Background */
        .hero {
            position: relative;
            height: 100vh;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }
        
        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            z-index: 0;
        }
        
        .hero-content {
            text-align: center;
            color: white;
            z-index: 1;
            padding: 0 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .hero-content h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        
        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }
        
        /* Search Bar */
        .search-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 30px;
            max-width: 900px;
            margin: 0 auto;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .search-form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: space-between;
        }
        
        .search-group {
            flex: 1;
            min-width: 200px;
        }
        
        .search-group label {
            display: block;
            margin-bottom: 8px;
            color: #2D5C4D;
            font-weight: bold;
        }
        
        .search-group input, 
        .search-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        
        .search-btn {
            background-color: #2D5C4D;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 25px;
            flex: 1 0 100%;
        }
        
        .search-btn:hover {
            background-color: #235243;
        }
        
        /* Featured Destinations */
        .featured-section {
            padding: 80px 20px;
            background-color: #F2F2EB;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
            color: #2D5C4D;
        }
        
        .section-title h2 {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }
        
        .section-title p {
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .destinations-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .destination-card {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        
        .destination-card:hover {
            transform: translateY(-10px);
        }
        
        .card-image {
            height: 200px;
            overflow: hidden;
        }
        
        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .destination-card:hover .card-image img {
            transform: scale(1.1);
        }
        
        .card-content {
            padding: 20px;
        }
        
        .card-content h3 {
            color: #2D5C4D;
            margin-bottom: 10px;
            font-size: 1.4rem;
        }
        
        .card-content p {
            margin-bottom: 15px;
            color: #666;
        }
        
        .card-price {
            font-weight: bold;
            color: #2D5C4D;
            font-size: 1.2rem;
        }
        
        /* Why Choose Us Section */
        .why-choose-us {
            padding: 80px 20px;
            background-color: white;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .feature-card {
            text-align: center;
            padding: 30px 20px;
        }
        
        .feature-icon {
            font-size: 3rem;
            color: #2D5C4D;
            margin-bottom: 20px;
        }
        
        .feature-card h3 {
            color: #2D5C4D;
            margin-bottom: 15px;
            font-size: 1.4rem;
        }
        
        /* Testimonials */
        .testimonials {
            padding: 80px 20px;
            background-color: #F2F2EB;
        }
        
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .testimonial-card {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
            color: #555;
        }
        
        .testimonial-author {
            display: flex;
            align-items: center;
        }
        
        .author-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 15px;
        }
        
        .author-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .author-info h4 {
            color: #2D5C4D;
            margin-bottom: 5px;
        }
        
        .author-info p {
            color: #777;
            font-size: 0.9rem;
        }
        
        /* Call to Action */
        .cta-section {
            padding: 80px 20px;
            background-color: #2D5C4D;
            color: white;
            text-align: center;
        }
        
        .cta-content {
            max-width: 700px;
            margin: 0 auto;
        }
        
        .cta-content h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        
        .cta-content p {
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        
        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        .cta-btn {
            padding: 12px 30px;
            border-radius: 5px;
            font-size: 1rem;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .primary-btn {
            background-color: white;
            color: #2D5C4D;
        }
        
        .primary-btn:hover {
            background-color: #F2F2EB;
        }
        
        .secondary-btn {
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }
        
        .secondary-btn:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2.5rem;
            }
            
            .hero-content p {
                font-size: 1rem;
            }
            
            .search-group {
                min-width: 100%;
            }
            
            .section-title h2 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
   <!-- navbar -->
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

    <!-- Hero Section with Video Background -->
    <section class="hero">
        <video autoplay muted loop class="video-background">
            <source src="images/hotel-video.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1>Discover Your Perfect Stay</h1>
            <p>Explore the world's finest hotels, resorts, and vacation rentals with exclusive deals and personalized recommendations.</p>
            
            <!-- Search Bar -->
            <div class="search-container">
                <form class="search-form">
                    <div class="search-group">
                        <label for="destination">Destination</label>
                        <input type="text" id="destination" placeholder="Where are you going?">
                    </div>
                    
                    <div class="search-group">
                        <label for="check-in">Check-in</label>
                        <input type="date" id="check-in">
                    </div>
                    
                    <div class="search-group">
                        <label for="check-out">Check-out</label>
                        <input type="date" id="check-out">
                    </div>
                    
                    <div class="search-group">
                        <label for="guests">Guests</label>
                        <select id="guests">
                            <option value="1">1 Guest</option>
                            <option value="2">2 Guests</option>
                            <option value="3">3 Guests</option>
                            <option value="4">4 Guests</option>
                            <option value="5+">5+ Guests</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="search-btn">Search Hotels</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Featured Destinations -->
    <section class="featured-section">
        <div class="section-title">
            <h2>Featured Destinations</h2>
            <p>Explore our most popular destinations loved by travelers worldwide</p>
        </div>
        
        <div class="destinations-grid">
            <div class="destination-card">
                <div class="card-image">
                    <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Bali">
                </div>
                <div class="card-content">
                    <h3>Bali, Indonesia</h3>
                    <p>Experience tropical paradise with stunning beaches and vibrant culture.</p>
                    <p class="card-price">From $89/night</p>
                </div>
            </div>
            
            <div class="destination-card">
                <div class="card-image">
                    <img src="https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Paris">
                </div>
                <div class="card-content">
                    <h3>Paris, France</h3>
                    <p>The city of love with iconic landmarks and romantic ambiance.</p>
                    <p class="card-price">From $120/night</p>
                </div>
            </div>
            
            <div class="destination-card">
                <div class="card-image">
                    <img src="https://images.unsplash.com/photo-1501594907352-04cda38ebc29?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="New York">
                </div>
                <div class="card-content">
                    <h3>New York, USA</h3>
                    <p>The city that never sleeps with endless entertainment options.</p>
                    <p class="card-price">From $150/night</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="why-choose-us">
        <div class="section-title">
            <h2>Why Choose StayZilla</h2>
            <p>We're committed to providing the best booking experience for our customers</p>
        </div>
        
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-medal"></i>
                </div>
                <h3>Best Price Guarantee</h3>
                <p>We guarantee the best prices for your stays. Found a better deal? We'll match it!</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-headset"></i>
                </div>
                <h3>24/7 Customer Support</h3>
                <p>Our dedicated support team is available round the clock to assist you.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-map-marked-alt"></i>
                </div>
                <h3>Curated Experiences</h3>
                <p>Discover handpicked hotels and unique stays tailored to your preferences.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3>Secure Booking</h3>
                <p>Your data and payments are protected with our advanced security measures.</p>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="testimonials">
        <div class="section-title">
            <h2>What Our Guests Say</h2>
            <p>Hear from travelers who have experienced StayZilla</p>
        </div>
        
        <div class="testimonials-grid">
            <div class="testimonial-card">
                <p class="testimonial-text">"Booking through StayZilla was a breeze! The hotel was exactly as described and the price was unbeatable. Will definitely use this service again for my next trip."</p>
                <div class="testimonial-author">
                    <div class="author-avatar">
                        <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Sarah Johnson">
                    </div>
                    <div class="author-info">
                        <h4>Sarah Johnson</h4>
                        <p>Frequent Traveler</p>
                    </div>
                </div>
            </div>
            
            <div class="testimonial-card">
                <p class="testimonial-text">"I was impressed by the customer service when I had to change my booking last minute. The representative was helpful and solved my issue within minutes."</p>
                <div class="testimonial-author">
                    <div class="author-avatar">
                        <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="Michael Chen">
                    </div>
                    <div class="author-info">
                        <h4>Michael Chen</h4>
                        <p>Business Traveler</p>
                    </div>
                </div>
            </div>
            
            <div class="testimonial-card">
                <p class="testimonial-text">"The selection of boutique hotels on StayZilla is amazing. Found a charming place in Rome that wasn't listed on any other booking site!"</p>
                <div class="testimonial-author">
                    <div class="author-avatar">
                        <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Emma Rodriguez">
                    </div>
                    <div class="author-info">
                        <h4>Emma Rodriguez</h4>
                        <p>Luxury Traveler</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="cta-section">
        <div class="cta-content">
            <h2>Ready for Your Next Adventure?</h2>
            <p>Join millions of travelers who trust StayZilla for their accommodation needs. Sign up today and get exclusive member benefits!</p>
            <div class="cta-buttons">
                <a href="Signup.jsp" class="cta-btn primary-btn">Sign Up Free</a>
                <a href="#" class="cta-btn secondary-btn">Learn More</a>
            </div>
        </div>
    </section>

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
            <p>&copy; 2024 STAYZILLA.COM All rights reserved.</p>
        </div>
    </footer>
</body>
</html>