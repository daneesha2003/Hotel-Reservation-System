<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="style/contact.css">
<link rel="stylesheet" href="style/validation.css">
<script>
    function validateSubmit() {
        let isValid = true;

        // Clear previous error messages
        document.getElementById("firstNameError").textContent = "";
        document.getElementById("lastNameError").textContent = "";
        document.getElementById("emailError").textContent = "";
        document.getElementById("phoneError").textContent = "";
        document.getElementById("messageError").textContent = "";

        // Get form field values
        const firstName = document.getElementById("name").value.trim();
        const lastName = document.getElementById("lastname").value.trim();
        const email = document.getElementById("email").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const message = document.getElementById("message").value.trim();

        // Validate First Name
        if (firstName === "") {
            document.getElementById("firstNameError").textContent = "First name cannot be empty";
            isValid = false;
        }

        // Validate Last Name
        if (lastName === "") {
            document.getElementById("lastNameError").textContent = "Last name cannot be empty";
            isValid = false;
        }

        // Validate Email (optional, but recommended)
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === "") {
            document.getElementById("emailError").textContent = "Email cannot be empty";
            isValid = false;
        } else if (!emailPattern.test(email)) {
            document.getElementById("emailError").textContent = "Invalid email address";
            isValid = false;
        }

        // Validate Phone Number (exactly 10 digits, numeric only)
        const digitsOnly = phone.replace(/\D/g, "");
        if (phone === "") {
            document.getElementById("phoneError").textContent = "Phone number cannot be empty";
            isValid = false;
        } else if (digitsOnly.length !== 10) {
            document.getElementById("phoneError").textContent = "Phone number must have exactly 10 digits";
            isValid = false;
        } else if (phone !== digitsOnly) { // Check if input contains non-numeric characters
            document.getElementById("phoneError").textContent = "Phone number must contain only numbers";
            isValid = false;
        }

        // Validate Message (optional, but you can add if needed)
        if (message === "") {
            document.getElementById("messageError").textContent = "Message cannot be empty";
            isValid = false;
        }

        return isValid;
    }
</script>
</head>
<body>
    <!-- Header start -->
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
    <!-- Header end -->

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>CONTACT US</h1>
        <div class="hero-subtitle">Our team of customer care ninjas is ready to hear from you.</div>
    </div>

    <!-- Main Contact Us Section -->
    <div class="lander-contact-main">
        <!-- Left: Contact Form and Info -->
        <div class="lander-contact-left">
            <h2>Reach out to us!</h2>
            <div class="lander-contact-desc">
                Got a question about Lander? Are you interested in partnering with us? Have some suggestions or just want to say hi? Contact us:
            </div>
            <!-- NEW FORM STARTS HERE -->
            <form action="ConnectusInsert" method="post" onsubmit="return validateSubmit()">
    <div class="form-row">
        <label for="name">First name :</label>
        <input type="text" name="FirstName" id="name" />
        <span class="error" id="firstNameError"></span>
    </div>

    <div class="form-row">
        <label for="lastname">Last name :</label>
        <input type="text" name="LastName" id="lastname" />
        <span class="error" id="lastNameError"></span>
    </div>

    <div class="form-row">
        <label for="email">Email Address :</label>
        <input type="text" name="EmailAddress" id="email" />
        <span class="error" id="emailError"></span>
    </div>

    <div class="form-row">
        <label for="phone">Phone number:</label>
        <input type="text" name="PhoneNumber" id="phone" />
        <span class="error" id="phoneError"></span>
    </div>

    <div class="form-row">
        <label for="message">Message :</label>
        <textarea name="Message" id="message" rows="4" cols="40"></textarea>
        <span class="error" id="messageError"></span>
    </div>

    <div class="form-row">
        <input class="lander-submit-btn" type="submit" value="Submit" id="submit-required" />
    </div>
</form>
        </div>
        <!-- Right: Customer Care and Social -->
        <div class="lander-contact-right">
            <h2>Customer Care</h2>
            <div class="lander-contact-desc">
                Not sure where to start? Need help adding that extra mojo to your landing page? Just visit our help <a href="#">center</a> or get in touch with us:
            </div>
            <div class="lander-care-team">
                <div class="lander-care-person">
                    <img src="images/people1.jpg" alt="Claudio Pierantonio" class="lander-care-avatar">
                    <div>
                        <div class="lander-care-name">Mr. Niroshan Perera</div>
                        <div class="lander-care-role">Customer Care</div>
                        <div class="lander-care-phone">Tel: +94 11 290 2636</div>
                    </div>
                </div>
                <div class="lander-care-person">
                    <img src="images/people2.jpg" alt="Noelia Rosemberg" class="lander-care-avatar">
                    <div>
                        <div class="lander-care-name">Ms. Chamari Fernando</div>
                        <div class="lander-care-role">Customer Care Lead</div>
                        <div class="lander-care-phone">Tel: +94 11 240 8976</div>
                    </div>
                </div>
            </div>
            <div class="lander-other-ways">
                <h3>Others ways to connect</h3>
                <div class="lander-social-block">
                    <span class="lander-social-icon"><i class="fab fa-facebook-f"></i></span>
                    <span>
                        Be the first on your block to get product updates, announcements, news and lots of really good content, like us on <a href="#">Facebook</a> today!
                    </span>
                </div>
                <div class="lander-social-block">
                    <span class="lander-social-icon"><i class="fab fa-twitter"></i></span>
                    <span>
                        Want the best tips on conversion optimization, landing pages, content marketing, SEO &amp; SEM? Then follow us on <a href="#">Twitter at @landerapp</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Contact Us Section End -->

    <!-- Footer start -->
    <footer>

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
    <!-- Footer end -->

</body>
</html>
    