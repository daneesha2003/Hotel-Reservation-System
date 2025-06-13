<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style/signup.css">
</head>
<body>

<div class="background-slideshow"></div>

<div class="signup-container">
    <h2>Sign Up</h2>
    <form action="SignupServlet" method="post">
        <div class="mb-3">
            <label for="fname" class="form-label">First name:</label>
            <input type="text" class="form-control" id="fname" name="Fname" required>
        </div>
        <div class="mb-3">
            <label for="lname" class="form-label">Last name:</label>
            <input type="text" class="form-control" id="lname" name="Lname" required>
        </div>
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
            Already have an account? <a href="Login.jsp">Login</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>