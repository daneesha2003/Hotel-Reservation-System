<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback</title>
<!-- Lora font for form styling -->
<link href="https://fonts.googleapis.com/css?family=Lora:400,600,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="style/feedback.css">
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<script>

document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form[action='FeedbackServlet']");
    const emailInput = document.getElementById("email");
    const emailError = document.createElement("div");
    emailError.className = "invalid-feedback";
    emailInput.parentNode.appendChild(emailError);

    // Custom email validation regex (simple version)
    const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;

    form.addEventListener("submit", function(event) {
        let valid = true;

        // Check all required fields (HTML5 will do this too)
        form.querySelectorAll("[required]").forEach(function(input) {
            if (!input.value.trim()) {
                input.classList.add("is-invalid");
                valid = false;
            } else {
                input.classList.remove("is-invalid");
            }
        });

        // Custom email validation
        if (!emailRegex.test(emailInput.value.trim())) {
            emailInput.classList.add("is-invalid");
            emailError.textContent = "Please enter a valid email address (lowercase letters, numbers, @, .).";
            valid = false;
        } else {
            emailInput.classList.remove("is-invalid");
            emailError.textContent = "";
        }

        // Prevent form submission if not valid
        if (!valid) {
            event.preventDefault();
            event.stopPropagation();
        }
    });

    // Remove validation on input
    emailInput.addEventListener("input", function() {
        emailInput.classList.remove("is-invalid");
        emailError.textContent = "";
    });
});
</script>
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

<!-- Feedback Section with Background -->
<div class="feedback-bg">
    <div class="container py-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-6 col-md-8">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="row g-0">
                        <!-- Left Panel (Form) -->
                        <div class="col-md-7 p-4 bg-white rounded-start-4">
                            <h2 class="mb-4" style="color:#2D5C4D;font-family:'Lora',serif;">Feedback</h2>
                           <form action="FeedbackServlet" method="post" class="needs-validation" novalidate>
								    <div class="mb-3">
								        <label for="name" class="form-label">Name:</label>
								        <input type="text" class="form-control" name="name" id="name" required>
								        <div class="invalid-feedback">This field is required.</div>
								    </div>
								    <div class="mb-3">
								        <label for="email" class="form-label">Email:</label>
								        <input type="text" class="form-control" name="email" id="email" required>
								        <div class="invalid-feedback">Please enter a valid email address.</div>
								    </div>
								    <div class="mb-3">
								        <label for="feedback" class="form-label">Feedback:</label>
								        <textarea class="form-control" name="feedback" id="feedback" rows="4" required></textarea>
								        <div class="invalid-feedback">This field is required.</div>
								    </div>
								    <div class="mb-3">
								        <label for="rating" class="form-label">Rating:</label>
								        <select class="form-select" name="rating" id="rating" required>
								            <option value="" disabled selected>Select rating</option>
								            <option value="1">&#9733; (1 Star)</option>
								            <option value="2">&#9733;&#9733; (2 Stars)</option>
								            <option value="3">&#9733;&#9733;&#9733; (3 Stars)</option>
								            <option value="4">&#9733;&#9733;&#9733;&#9733; (4 Stars)</option>
								            <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733; (5 Stars)</option>
								        </select>
								        <div class="invalid-feedback">Please select a rating.</div>
								    </div>
								    <div class="d-grid">
								        <input type="submit" value="Submit" class="btn btn-success">
								    </div>
								</form>

                        </div>
                        <!-- Right Panel (Image & Text) -->
                        <div class="col-md-5 d-flex flex-column align-items-center justify-content-center bg-light rounded-end-4 p-3">
                            <img src="images/customer.jpg" alt="Hotel" class="img-fluid rounded-3 mb-3" style="max-height:180px;">
                            <h6 class="text-success text-center fw-normal" style="color:#2D5C4D;font-family:'Lora',serif;">
                                Thanks for sending us your ideas, issues, or appreciations.<br>
                                We can’t respond individually, but we’ll pass it on to the teams who are working to help make STAYZILLA better for everyone.
                            </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</div>

<!-- Footer start (Unchanged) -->
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
