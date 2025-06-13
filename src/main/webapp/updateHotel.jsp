<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Hotel</title>
<link rel="stylesheet" href="style/hotelUpdate.css">
</head>
<body>


<%
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // Add null checks and default values
        double singleRate = request.getParameter("singleRate") != null && !request.getParameter("singleRate").isEmpty() 
                             ? Double.parseDouble(request.getParameter("singleRate")) : 0.0;
                             
        double doubleRate = request.getParameter("doubleRate") != null && !request.getParameter("doubleRate").isEmpty() 
                             ? Double.parseDouble(request.getParameter("doubleRate")) : 0.0;
                             
        double suiteRate = request.getParameter("suiteRate") != null && !request.getParameter("suiteRate").isEmpty() 
                             ? Double.parseDouble(request.getParameter("suiteRate")) : 0.0;
                             
        double deluxeRate = request.getParameter("deluxeRate") != null && !request.getParameter("deluxeRate").isEmpty() 
                             ? Double.parseDouble(request.getParameter("deluxeRate")) : 0.0;

        String rating = request.getParameter("rating");
        String amenities = request.getParameter("amenities"); 
        String imageUrl = request.getParameter("imageUrl"); 
%>

<div class="form-container">
    <div class="update-header">
        <h1>Update Hotel</h1>
        <p>Edit the hotel details below</p>
    </div>
    
    <form action="UpdateHotelAddServlet" method="post">
        <div class="form-content">
            <div class="form-group">
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" value="<%=id %>" readonly>
            </div>
            
            <div class="form-group">
                <label for="name">Hotel Name:</label>
                <input type="text" id="name" name="name" value="<%=name%>" required>
            </div>
            
            <div class="form-group">
                <label for="location">Location:</label>
                <input type="text" id="location" name="location" value="<%=location%>" required>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="5" required><%=description%></textarea>
            </div>
            
            <div class="form-group">
                <label for="singleRate">Single Room Rate:</label>
                <input type="number" step="0.01" id="singleRate" name="singleRate" value="<%=singleRate%>" required>
            </div>
            
            <div class="form-group">
                <label for="doubleRate">Double Room Rate:</label>
                <input type="number" step="0.01" id="doubleRate" name="doubleRate" value="<%=doubleRate%>" required>
            </div>
            
            <div class="form-group">
                <label for="suiteRate">Suite Room Rate:</label>
                <input type="number" step="0.01" id="suiteRate" name="suiteRate" value="<%=suiteRate%>" required>
            </div>
            
            <div class="form-group">
                <label for="deluxeRate">Deluxe Room Rate:</label>
                <input type="number" step="0.01" id="deluxeRate" name="deluxeRate" value="<%=deluxeRate%>" required>
            </div>
            
            <div class="form-group">
                <label for="rating">Rating:</label>
                <select id="rating" name="rating">
                    <option value="1" <%= "1".equals(rating) ? "selected" : "" %>>1 Star</option>
                    <option value="2" <%= "2".equals(rating) ? "selected" : "" %>>2 Stars</option>
                    <option value="3" <%= "3".equals(rating) ? "selected" : "" %>>3 Stars</option>
                    <option value="4" <%= "4".equals(rating) ? "selected" : "" %>>4 Stars</option>
                    <option value="5" <%= "5".equals(rating) ? "selected" : "" %>>5 Stars</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="amenities">Amenities (comma separated):</label>
                <input type="text" id="amenities" name="amenities" value="<%=amenities%>" required>
            </div>
            
            <div class="form-group">
                <label for="imageUrl">Image URL:</label>
                <input type="text" id="imageUrl" name="imageUrl" value="<%=imageUrl%>" required>
            </div>
        </div>
        
        <button type="submit" class="submit-btn">Update Hotel</button>
    </form>
</div>
            

</body>
</html>