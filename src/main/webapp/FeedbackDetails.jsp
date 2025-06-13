<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback</title>
<!-- Lora font -->
<link href="https://fonts.googleapis.com/css?family=Lora:400,600,700&display=swap" rel="stylesheet">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="style/read.css">
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

<section class="feedback-section">
    <h2 class="feedback-title">Feedback</h2>
    <div class="feedback-grid">
        <c:choose>
            <c:when test="${not empty allFeedbacks}">
                <c:forEach var="Feedback" items="${allFeedbacks}">
                    <div class="feedback-card">
                        <div class="feedback-header">
                            <h3 class="feedback-name">${Feedback.name}</h3>
                            <span class="feedback-id">ID: ${Feedback.id}</span>
                        </div>
                        <a href="mailto:${Feedback.email}" class="feedback-email">${Feedback.email}</a>
                        <p class="feedback-content">${Feedback.feedback}</p>
                        <!-- Rating display -->
                        <div class="feedback-rating" style="margin-bottom:1rem;">
                            <c:forEach var="i" begin="1" end="5">
                                <c:choose>
                                    <c:when test="${i <= Feedback.rating}">
                                        <span style="color: #2D5C4D; font-size:1.2rem;">&#9733;</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: #ccc; font-size:1.2rem;">&#9733;</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <span style="color:#2D5C4D; font-size:1rem; margin-left:8px;">(${Feedback.rating} Stars)</span>
                        </div>
                        <div class="feedback-actions">
                            <a href="UpdateFeedback.jsp?id=${Feedback.id}&name=${Feedback.name}&email=${Feedback.email}&feedback=${Feedback.feedback}&rating=${Feedback.rating}" class="btn btn-update">
                                <i class="fas fa-edit"></i> Update
                            </a>
                            <form action="DeleteFeedbackServlet" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="${Feedback.id}"/>
                                <button type="submit" class="btn btn-delete">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-feedback">
                    <p>No feedback available yet.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

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
