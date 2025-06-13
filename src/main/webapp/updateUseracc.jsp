<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User Details</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Lora',serif;
            background-size: cover;
        }

        .container-box {
            background-color: #F2F1EB;
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #2D5C4D;
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            color: #2D5C4D;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"] {
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #2D5C4D;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #24493d;
        }

        .logout-button {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .logout-button button {
            background-color: #2D5C4D;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        .logout-button button:hover {
            background-color: #24493d;
        }

        @media (max-width: 600px) {
            .container-box {
                margin: 40px 20px;
                padding: 20px;
            }

            input[type="submit"] {
                font-size: 14px;
            }

            .logout-button {
                top: 10px;
                right: 10px;
            }
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String Fname = request.getParameter("Fname");
    String Lname = request.getParameter("Lname");
    String email = request.getParameter("email");
%>

<div class="logout-button">
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</div>

<div class="container-box">
    <h2>Update User Details</h2>

    <form action="UpdateUseraccServlet" method="post">
        <input type="hidden" name="id" value="<%=id%>">

        <div class="mb-3">
            <label for="fname" class="form-label">First Name:</label>
            <input type="text" class="form-control" name="Fname" value="<%=Fname%>" required>
        </div>

        <div class="mb-3">
            <label for="lname" class="form-label">Last Name:</label>
            <input type="text" class="form-control" name="Lname" value="<%=Lname%>" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" name="email" value="<%=email%>" required>
        </div>

        <input type="submit" value="Update">
    </form>
</div>

</body>
</html>
    