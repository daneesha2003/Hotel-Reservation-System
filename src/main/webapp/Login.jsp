<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom Login CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style/login.css">
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-custom">Submit</button>
        
        <div class="mt-3 text-center">
            Don't have an account? <a href="Signup.jsp">Sign Up</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>