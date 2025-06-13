<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Feedback</title>
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="style/Update.css">
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


<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String feedback = request.getParameter("feedback");
    String rating = request.getParameter("rating");
%>

<!-- Begin blurred background section -->
<div class="blur-bg-section">
    <h2>Update feedback</h2>
    <form id="feedback-form" action="UpdateFeedbackServlet" method="post">
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" id="id" name="id" value="<%=id%>" readonly></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="<%=name%>" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" value="<%=email%>" required></td>
            </tr>
            <tr>
                <td>Feedback:</td>
                <td><textarea name="feedback" required><%=feedback%></textarea></td>
            </tr>
            <tr>
                <td>Rating:</td>
                <td>
                    <select name="rating" required>
                        <option value="" disabled <%= (rating==null||rating.equals(""))?"selected":"" %>>Select rating</option>
                        <option value="1" <%= "1".equals(rating)?"selected":"" %>>★ (1 Star)</option>
                        <option value="2" <%= "2".equals(rating)?"selected":"" %>>★★ (2 Stars)</option>
                        <option value="3" <%= "3".equals(rating)?"selected":"" %>>★★★ (3 Stars)</option>
                        <option value="4" <%= "4".equals(rating)?"selected":"" %>>★★★★ (4 Stars)</option>
                        <option value="5" <%= "5".equals(rating)?"selected":"" %>>★★★★★ (5 Stars)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
    </form>
</div>
<!-- End blurred background section -->

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
      <p>&copy; 2024 BOOKLT.COM All rights reserved.</p>
    </div>
</footer>
</body>
</html>