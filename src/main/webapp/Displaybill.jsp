<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style/style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
      <link rel="stylesheet" href="style/billStyles.css">
<title>Insert title here</title>
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

        

    </div>
    
    <div class="invoice-container">
        <div class="invoice-header">
            <img src="images/logo.jpg" alt="Hotel Logo" class="hotel-logo">
            <h1>Booking Invoice</h1>
            
            <c:forEach var="bill" items="${totbill}">
            <p class="invoice-date">Date: ${currentDate}</p>
        </div>

        <div class="invoice-body">
            <div class="guest-info">
                <h2>Guest Information</h2>
                <p><strong>Name:</strong> ${bill.firstName} ${bill.lastName}</p>
                <p><strong>Email:</strong> ${bill.email}</p>
                <p><strong>Phone:</strong> ${bill.phone}</p>
            </div>

            <div class="booking-details">
                <h2>Booking Details</h2>
                <div class="details-grid">
                    <div>
                        <p><strong>Room Type:</strong></p>
                        <p><strong>Check-In:</strong></p>
                        <p><strong>Check-Out:</strong></p>
                        <p><strong>Nights:</strong></p>
                    </div>
                    <div>
                        <p>${bill.roomType}</p>
                        <p>${bill.checkIn}</p>
                        <p>${bill.checkOut}</p>
                        <p>${bill.totalLengthStay}</p>
                    </div>
                </div>
            </div>

            <div class="price-breakdown">
                <h2>Price Breakdown</h2>
                <table>
                    <tr>
                        <th>Description</th>
                        <th>Amount</th>
                    </tr>
                    <tr>
                        <td>Room Charges (${bill.totalLengthStay} nights)</td>
                        <td id="roomCharges">LKR ${String.format("%.2f", bill.roomCharges)}</td>
                    </tr>
                    <tr>
                        <td>Taxes & Fees</td>
                        <td id="taxes">LKR ${String.format("%.2f", bill.taxes)}</td>
                    </tr>
                    <tr class="total-row">
                        <td><strong>Total Amount</strong></td>
                        <td id="totalAmount">LKR ${String.format("%.2f", bill.totalAmount)}</td>
                    </tr>
                </table>
            </div>

            <div class="special-requests">
                <h2>Special Requests</h2>
                <p>${bill.specialRequest}</p>
            </div>
        </div>
        </c:forEach>

        <div class="invoice-footer">
            <p>Thank you for choosing our hotel!</p>
            <button class="print-btn" onclick="window.print()">
                <i class="fas fa-print"></i> Print Invoice
            </button>
        </div>
    </div>
     
      
       
</body>
</html>