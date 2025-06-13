<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    UserPackage.SignupModel user = (UserPackage.SignupModel) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Account Details</title>
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/style/useraccount.css">
<script>
    function showAlertAndRedirect() {
        alert("No user data available. Please login.");
        window.location.href = "Login.jsp";
    }
</script>
</head>
<body onload="<%= user == null ? "showAlertAndRedirect()" : "" %>">
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
		</div>>

    
    <div class="logo-placeholder"></div>
</div>

<div class="account-header">
    <h2>User Account Details</h2>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

<div class="account-container">
<%
    if (user != null) {
%>
    <div class="account-details">
        <p><strong>ID:</strong> <%= user.getId() %></p>
        <p><strong>First Name:</strong> <%= user.getFname() %></p>
        <p><strong>Last Name:</strong> <%= user.getLname() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
    </div>
    
    <div class="action-buttons">
        <a href="updateUseracc.jsp?id=<%= user.getId() %>&Fname=<%= user.getFname() %>&Lname=<%= user.getLname() %>&email=<%= user.getEmail() %>" class="btn btn-edit">
            Edit User Details
        </a>
        <form action="DeleteUseraccServlet" method="post" style="margin:0;">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <button type="submit" class="btn btn-delete">Delete account</button>
        </form>
    </div>
<%
    }
%>
</div>

    
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
          <p>&copy; 2024 STAYZILLA.COM All rights reserved.</p>
        </div>
      </footer> 
      

</body>
</html>